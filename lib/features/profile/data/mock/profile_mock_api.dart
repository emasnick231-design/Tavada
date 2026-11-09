import 'package:tavada_eats/core/network/mock/mock_accounts.dart';
import 'package:tavada_eats/core/network/mock/mock_database.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';
import 'package:uuid/uuid.dart';

/// Fake backend for wallet, rewards and account settings.
///
/// State is per signed-in user ([MockAccounts]): the demo customer uses
/// `assets/mock/account.json`, other accounts start empty. Wallet history
/// lives in `wallet_transactions` (records carry a `user_id`) — checkout
/// reads the same balance and records its payments there. Guests get 401.
class ProfileMockApi implements MockApi {
  ProfileMockApi(this._db, {DateTime Function()? clock})
    : _clock = clock ?? DateTime.now,
      _accounts = MockAccounts(_db);

  final MockDatabase _db;
  final MockAccounts _accounts;
  final DateTime Function() _clock;

  static const _uuid = Uuid();
  static const _maxTopUp = 5000;
  static const _channels = ['push', 'whatsapp', 'email'];
  static const _categories = [
    'order_status',
    'promotions',
    'recommendations',
    'reminders',
  ];
  static const _hearingValues = ['none', 'deaf', 'hard_of_hearing'];

  @override
  List<MockRoute> get routes => [
    MockRoute.get('/account', _account),
    MockRoute.get('/wallet/transactions', _transactions),
    MockRoute.post('/wallet/top-up', _topUp),
    MockRoute.post('/rewards/redeem', _redeem),
    MockRoute.post('/me/phone/code', _sendPhoneCode),
    MockRoute.put('/me/phone', _updatePhone),
    MockRoute.post('/me/password', _changePassword),
    MockRoute.put('/me/profile', _updateProfile),
    MockRoute.delete('/me', _deleteAccount),
    MockRoute.get('/me/notifications', _notifications),
    MockRoute.put('/me/notifications/:channel', _updateNotifications),
    MockRoute.get('/me/accessibility', _accessibility),
    MockRoute.put('/me/accessibility', _updateAccessibility),
  ];

  // ── Helpers ───────────────────────────────────────────────────────────────

  static String _lang(MockRequest r) {
    final header = r.headers['Accept-Language'] ?? r.headers['accept-language'];
    final code = '${header ?? 'en'}'.split(RegExp('[-_,]')).first.toLowerCase();
    return code == 'tr' ? 'tr' : 'en';
  }

  /// Picks the right language from `{ "en": …, "tr": … }` values.
  static String _text(Object? value, String lang) {
    if (value is Map) return '${value[lang] ?? value['en'] ?? ''}';
    return '${value ?? ''}';
  }

  static String _t(String lang, String en, String tr) => lang == 'tr' ? tr : en;

  static Map<String, dynamic> _map(Object? value) =>
      value is Map<String, dynamic> ? value : <String, dynamic>{};

  static double _num(Object? value, [double fallback = 0]) =>
      value is num ? value.toDouble() : fallback;

  /// Rounds to pence to keep the persisted balance clean.
  static double _round(double value) => (value * 100).round() / 100;

  Future<Map<String, dynamic>> _overviewJson(Map<String, dynamic> doc) async {
    final wallet = _map(doc['wallet']);
    return {
      'wallet_balance': _num(wallet['balance']),
      'rewards': _map(doc['rewards']),
    };
  }

  Future<void> _recordTransaction({
    required String userId,
    required String type,
    required double amount,
    required Map<String, String> description,
    String? orderId,
  }) => _db.insert('wallet_transactions', {
    'id': 'wt-${_uuid.v4().substring(0, 8)}',
    'user_id': userId,
    'type': type,
    'amount': _round(amount),
    'description': description,
    'created_at': _clock().toUtc().toIso8601String(),
    'order_id': ?orderId,
  });

  // ── Wallet & rewards ──────────────────────────────────────────────────────

  Future<MockResponse> _account(MockRequest req) async {
    final userId = req.userId;
    if (userId == null) return MockResponse.unauthorized();
    return MockResponse.ok(await _overviewJson(await _accounts.load(userId)));
  }

  Future<MockResponse> _transactions(MockRequest req) async {
    final userId = req.userId;
    if (userId == null) return MockResponse.unauthorized();
    final lang = _lang(req);
    final items = await _db.collection('wallet_transactions');
    final localized = [
      for (final t in items)
        if (MockAccounts.owns(t, userId))
          {...t, 'description': _text(t['description'], lang)},
    ]..sort((a, b) => '${b['created_at']}'.compareTo('${a['created_at']}'));
    return MockResponse.ok(localized);
  }

  Future<MockResponse> _topUp(MockRequest req) async {
    final userId = req.userId;
    if (userId == null) return MockResponse.unauthorized();
    final lang = _lang(req);
    final amount = _num(req.json['amount']);
    if (amount < 1 || amount > _maxTopUp) {
      return MockResponse.validation(
        _t(
          lang,
          'Top-ups must be between £1 and £$_maxTopUp.',
          'Yükleme tutarı £1 ile £$_maxTopUp arasında olmalıdır.',
        ),
        code: 'invalid_amount',
      );
    }
    final doc = await _accounts.load(userId);
    final wallet = _map(doc['wallet']);
    // Points are earned by spending (orders), not by topping up.
    doc['wallet'] = {
      ...wallet,
      'balance': _round(_num(wallet['balance']) + amount),
    };
    await _accounts.save(userId, doc);
    await _recordTransaction(
      userId: userId,
      type: 'top_up',
      amount: amount,
      description: const {'en': 'Wallet top-up', 'tr': 'Cüzdan yüklemesi'},
    );
    return MockResponse.ok(await _overviewJson(doc));
  }

  Future<MockResponse> _redeem(MockRequest req) async {
    final userId = req.userId;
    if (userId == null) return MockResponse.unauthorized();
    final lang = _lang(req);
    final doc = await _accounts.load(userId);
    final rewards = _map(doc['rewards']);
    final points = _num(rewards['points']).toInt();
    final needed = _num(rewards['next_reward_points'], 200).toInt();
    final value = _num(rewards['reward_value'], 5);
    if (points < needed) {
      return MockResponse.validation(
        _t(
          lang,
          'You need ${needed - points} more points to redeem a reward.',
          'Ödül almak için $needed puana ulaşmalısınız (${needed - points} '
              'puan kaldı).',
        ),
        code: 'insufficient_points',
      );
    }
    final wallet = _map(doc['wallet']);
    doc
      ..['rewards'] = {...rewards, 'points': points - needed}
      ..['wallet'] = {
        ...wallet,
        'balance': _round(_num(wallet['balance']) + value),
      };
    await _accounts.save(userId, doc);
    await _recordTransaction(
      userId: userId,
      type: 'reward',
      amount: value,
      description: const {'en': 'Rewards redeemed', 'tr': 'Ödül kullanıldı'},
    );
    return MockResponse.ok(await _overviewJson(doc));
  }

  // ── Account settings ──────────────────────────────────────────────────────

  static const _users = 'auth_users';
  static const otpCode = '1234';

  static String _digits(String value) => value.replaceAll(RegExp(r'\D'), '');

  static Map<String, dynamic> _public(Map<String, dynamic> user) =>
      {...user}..remove('password');

  /// 8+ characters, a letter and a number or special character (the rule
  /// shown under every password field).
  static bool _isStrong(String password) =>
      password.length >= 8 &&
      RegExp('[A-Za-z]').hasMatch(password) &&
      RegExp('[^A-Za-z]').hasMatch(password);

  /// The signed-in user's `auth_users` record (null for guests).
  Future<Map<String, dynamic>?> _me(MockRequest req) async {
    final userId = req.userId;
    return userId == null ? null : _db.findById(_users, userId);
  }

  /// Validates the new number and "sends" a code to it (always `1234`).
  Future<MockResponse> _sendPhoneCode(MockRequest req) async {
    final rejected = await _checkPhone(req);
    if (rejected != null) return rejected;
    return MockResponse.ok({
      'destination': '${req.json['phone']}',
      'resend_in_seconds': 30,
    });
  }

  /// Format + ownership checks shared by sending the code and saving.
  Future<MockResponse?> _checkPhone(MockRequest req) async {
    final lang = _lang(req);
    final phone = '${req.json['phone'] ?? ''}'.replaceAll(' ', '');
    if (!RegExp(r'^\+\d{7,15}$').hasMatch(phone)) {
      return MockResponse.validation(
        _t(
          lang,
          'Enter a valid phone number.',
          'Geçerli bir telefon numarası girin.',
        ),
        code: 'invalid_phone',
        fields: const {'phone': 'invalid'},
      );
    }
    final me = await _me(req);
    if (me == null) return MockResponse.unauthorized();
    final taken = await _db.where(
      _users,
      (u) =>
          u['id'] != me['id'] &&
          _digits('${u['phone'] ?? ''}') == _digits(phone),
    );
    if (taken.isNotEmpty) {
      return MockResponse.error(
        409,
        code: 'phone_taken',
        message: _t(
          lang,
          'This number is already linked to another account.',
          'Bu numara başka bir hesaba bağlı.',
        ),
        fields: const {'phone': 'taken'},
      );
    }
    return null;
  }

  /// Changes the phone number after it was verified with a one-time code
  /// (`code`, sent with `POST /auth/otp/send`). Numbers already used by
  /// another account are rejected.
  Future<MockResponse> _updatePhone(MockRequest req) async {
    final rejected = await _checkPhone(req);
    if (rejected != null) return rejected;
    final lang = _lang(req);
    final phone = '${req.json['phone']}'.replaceAll(' ', '');
    final me = (await _me(req))!;
    if (req.json['code'] != otpCode) {
      return MockResponse.validation(
        _t(
          lang,
          "That code isn't right. Check it and try again.",
          'Kod hatalı. Kontrol edip tekrar deneyin.',
        ),
        code: 'invalid_otp',
        fields: const {'code': 'invalid'},
      );
    }
    final updated = await _db.update(_users, '${me['id']}', {'phone': phone});
    return MockResponse.ok(_public(updated!));
  }

  /// Requires the current password; persists the new one.
  Future<MockResponse> _changePassword(MockRequest req) async {
    final lang = _lang(req);
    final me = await _me(req);
    if (me == null) return MockResponse.unauthorized();
    final current = '${req.json['current_password'] ?? ''}';
    if (current != me['password']) {
      return MockResponse.validation(
        _t(
          lang,
          'Your current password is incorrect.',
          'Mevcut şifreniz hatalı.',
        ),
        code: 'wrong_password',
        fields: const {'current_password': 'invalid'},
      );
    }
    final password = '${req.json['new_password'] ?? ''}';
    if (!_isStrong(password)) {
      return MockResponse.validation(
        _t(
          lang,
          'Choose a stronger password.',
          'Daha güçlü bir şifre seçin.',
        ),
        code: 'weak_password',
      );
    }
    if (password == current) {
      return MockResponse.validation(
        _t(
          lang,
          'Choose a password you haven’t used before.',
          'Daha önce kullanmadığınız bir şifre seçin.',
        ),
        code: 'same_password',
      );
    }
    await _db.update(_users, '${me['id']}', {'password': password});
    return MockResponse.noContent();
  }

  /// First/last name.
  Future<MockResponse> _updateProfile(MockRequest req) async {
    final lang = _lang(req);
    final me = await _me(req);
    if (me == null) return MockResponse.unauthorized();
    final first = '${req.json['first_name'] ?? ''}'.trim();
    final last = '${req.json['last_name'] ?? ''}'.trim();
    if (first.isEmpty) {
      return MockResponse.validation(
        _t(lang, 'Enter your first name.', 'Adınızı girin.'),
        code: 'invalid_name',
        fields: const {'first_name': 'required'},
      );
    }
    final updated = await _db.update(_users, '${me['id']}', {
      'first_name': first,
      'last_name': last,
    });
    return MockResponse.ok(_public(updated!));
  }

  /// Deletes the account and everything it owns (orders, wallet, settings).
  Future<MockResponse> _deleteAccount(MockRequest req) async {
    final me = await _me(req);
    if (me == null) return MockResponse.unauthorized();
    final id = '${me['id']}';
    await _accounts.delete(id);
    await _db.remove(_users, id);
    return MockResponse.noContent();
  }

  /// Per-channel preferences, derived from the flat fixture on first use and
  /// persisted under `notification_preferences` once edited.
  Map<String, List<String>> _preferences(Map<String, dynamic> doc) {
    final stored = _map(doc['notification_preferences']);
    if (stored.isNotEmpty) {
      return {
        for (final c in _channels)
          c: ((stored[c] as List?) ?? const []).map((e) => '$e').toList(),
      };
    }
    final channels = _map(doc['notification_channels']);
    final categories = _map(doc['notification_categories']);
    final enabledCategories = [
      for (final c in _categories)
        if (categories[c] != false) c,
    ];
    return {
      for (final c in _channels)
        c: channels[c] == false ? <String>[] : [...enabledCategories],
    };
  }

  Future<MockResponse> _notifications(MockRequest req) async {
    final userId = req.userId;
    if (userId == null) return MockResponse.unauthorized();
    final prefs = _preferences(await _accounts.load(userId));
    return MockResponse.ok([
      for (final c in _channels) {'channel': c, 'categories': prefs[c]},
    ]);
  }

  Future<MockResponse> _updateNotifications(MockRequest req) async {
    final userId = req.userId;
    if (userId == null) return MockResponse.unauthorized();
    final channel = req.param('channel')!;
    if (!_channels.contains(channel)) return MockResponse.notFound();
    final categories = ((req.json['categories'] as List?) ?? const [])
        .map((e) => '$e')
        .where(_categories.contains)
        .toList();
    final doc = await _accounts.load(userId);
    final prefs = _preferences(doc)..[channel] = categories;
    doc['notification_preferences'] = prefs;
    await _accounts.save(userId, doc);
    return MockResponse.ok({'channel': channel, 'categories': categories});
  }

  Future<MockResponse> _accessibility(MockRequest req) async {
    final userId = req.userId;
    if (userId == null) return MockResponse.unauthorized();
    final doc = await _accounts.load(userId);
    final hearing = _map(doc['accessibility'])['hearing'] ?? 'none';
    return MockResponse.ok({'hearing': hearing});
  }

  Future<MockResponse> _updateAccessibility(MockRequest req) async {
    final userId = req.userId;
    if (userId == null) return MockResponse.unauthorized();
    final hearing = '${req.json['hearing'] ?? ''}';
    if (!_hearingValues.contains(hearing)) {
      return MockResponse.validation('Unknown hearing preference');
    }
    final doc = await _accounts.load(userId);
    doc['accessibility'] = {..._map(doc['accessibility']), 'hearing': hearing};
    await _accounts.save(userId, doc);
    return MockResponse.ok({'hearing': hearing});
  }
}
