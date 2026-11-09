import 'dart:math' as math;

import 'package:tavada_eats/core/network/mock/mock_database.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';
import 'package:tavada_eats/features/support/data/mock/support_agent_script.dart';
import 'package:tavada_eats/features/support/data/mock/support_mock_helpers.dart';
import 'package:uuid/uuid.dart';

/// Fake live chat. The conversation is persisted (`support_chat` document +
/// `support_chat_messages` collection) so it survives restarts.
///
/// `POST /support/chat/reply` behaves like a long-poll: it waits a realistic
/// "typing" time before answering the customer's pending messages.
class ChatMockApi implements MockApi {
  ChatMockApi(
    this._db, {
    Duration Function(String reply)? typingDelay,
    DateTime Function()? clock,
  }) : _typingDelay = typingDelay ?? _defaultTypingDelay,
       _clock = clock ?? DateTime.now;

  final MockDatabase _db;
  final Duration Function(String reply) _typingDelay;
  final DateTime Function() _clock;

  static const _uuid = Uuid();
  static const _messages = 'support_chat_messages';

  static Duration _defaultTypingDelay(String reply) =>
      Duration(milliseconds: math.min(2600, 900 + reply.length * 14));

  @override
  List<MockRoute> get routes => [
    MockRoute.get('/support/chat', _thread),
    MockRoute.post('/support/chat/messages', _send),
    MockRoute.post('/support/chat/reply', _reply),
  ];

  String _now([int offsetMicros = 0]) => _clock()
      .toUtc()
      .add(Duration(microseconds: offsetMicros))
      .toIso8601String();

  Future<Map<String, dynamic>> _session() async {
    final doc = await _db.document('support_chat');
    if (doc['active_chat_id'] != null) return doc;
    final started = {...doc, 'active_chat_id': 'chat-${_uuid.v4()}'};
    await _db.saveDocument('support_chat', started);
    return started;
  }

  Future<Map<String, dynamic>> _threadJson(Map<String, dynamic> session) async {
    final id = session['active_chat_id'];
    final messages = await _db.where(_messages, (m) => m['chat_id'] == id)
      ..sort((a, b) => '${a['created_at']}'.compareTo('${b['created_at']}'));
    return {'id': id, 'agent': session['agent'], 'messages': messages};
  }

  Future<MockResponse> _thread(MockRequest req) async =>
      MockResponse.ok(await _threadJson(await _session()));

  Future<MockResponse> _send(MockRequest req) async {
    final body = req.json;
    final text = '${body['text'] ?? ''}'.trim();
    final image = '${body['image_path'] ?? ''}';
    if (text.isEmpty && image.isEmpty) {
      return MockResponse.validation('A message needs text or a photo.');
    }
    var session = await _session();
    final chatId = session['active_chat_id'];
    await _db.insert(_messages, {
      'id': '${body['id'] ?? _uuid.v4()}',
      'chat_id': chatId,
      'author': 'user',
      'text': text.isEmpty ? null : text,
      'image_path': image.isEmpty ? null : image,
      'created_at': _now(),
      'answered': false,
    });

    // First message: an agent picks the conversation up.
    if (session['agent'] == null) {
      session = {
        ...session,
        'agent': {
          'name': SupportAgentScript.agentName,
          'avatar_url': SupportAgentScript.agentAvatar,
          'is_online': true,
        },
      };
      await _db.saveDocument('support_chat', session);
      await _db.insert(_messages, {
        'id': 'sys-${_uuid.v4()}',
        'chat_id': chatId,
        'author': 'system',
        'text': SupportAgentScript.joinedMessage(mockLanguage(req)),
        'created_at': _now(1),
      });
    }
    return MockResponse.ok(await _threadJson(session));
  }

  Future<MockResponse> _reply(MockRequest req) async {
    final session = await _session();
    final chatId = session['active_chat_id'];
    final pending = await _db.where(
      _messages,
      (m) =>
          m['chat_id'] == chatId &&
          m['author'] == 'user' &&
          m['answered'] == false,
    );
    if (pending.isEmpty) return MockResponse.ok(await _threadJson(session));

    final lang = mockLanguage(req);
    final reply = SupportAgentScript.reply(
      pendingText: pending.map((m) => m['text'] ?? '').join(' '),
      hasPhoto: pending.any((m) => m['image_path'] != null),
      lang: lang,
      customerName: req.json['customer_name'] as String?,
    );
    await Future<void>.delayed(_typingDelay(reply.text));

    for (final m in pending) {
      await _db.update(_messages, '${m['id']}', {'answered': true});
    }
    await _db.insert(_messages, {
      'id': 'agent-${_uuid.v4()}',
      'chat_id': chatId,
      'author': 'agent',
      'author_name': SupportAgentScript.agentName,
      'text': reply.text,
      'created_at': _now(),
    });
    if (reply.walletCredit > 0) await _creditWallet(reply.walletCredit);
    return MockResponse.ok(await _threadJson(session));
  }

  /// Refunds land in the shared wallet (see `assets/mock/account.json`).
  Future<void> _creditWallet(double amount) async {
    final doc = await _db.document('account');
    final wallet = Map<String, dynamic>.from(
      (doc['wallet'] as Map?) ?? const {},
    );
    final balance = (wallet['balance'] as num?)?.toDouble() ?? 0;
    wallet['balance'] = ((balance + amount) * 100).round() / 100;
    await _db.saveDocument('account', {...doc, 'wallet': wallet});
    await _db.insert('wallet_transactions', {
      'id': 'wt-${_uuid.v4().substring(0, 8)}',
      'type': 'refund',
      'amount': amount,
      'description': SupportAgentScript.refundReason,
      'created_at': _now(),
    });
  }
}
