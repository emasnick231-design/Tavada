import 'package:tavada_eats/core/network/mock/mock_database.dart';
import 'package:tavada_eats/core/network/mock/mock_http.dart';

/// The demo customer who owns the fixture data (orders, wallet, rewards).
const mockDemoUserId = 'u_vanessa';

extension MockRequestUserX on MockRequest {
  /// Id of the signed-in caller, decoded from the mock access token
  /// (`tk_<userId>_<stamp>`); `null` for guests. Tokens in another format
  /// (older installs, test sessions) belong to the demo customer.
  String? get userId {
    final token = bearerToken;
    if (token == null || token.isEmpty) return null;
    return RegExp(r'^tk_(.+)_\d+$').firstMatch(token)?.group(1) ??
        mockDemoUserId;
  }
}

/// Per-user account documents (wallet, rewards, notification and
/// accessibility settings) plus ownership of user-scoped records.
///
/// The demo customer keeps `assets/mock/account.json`; every other account
/// starts empty (£0 wallet, 0 points) with its own referral code.
class MockAccounts {
  MockAccounts(this._db);

  final MockDatabase _db;

  static String _docName(String userId) =>
      userId == mockDemoUserId ? 'account' : 'account.$userId';

  /// Records without a `user_id` are fixture data of the demo customer.
  static bool owns(Map<String, dynamic> record, String userId) =>
      (record['user_id'] ?? mockDemoUserId) == userId;

  Future<Map<String, dynamic>> load(String userId) async {
    if (userId == mockDemoUserId) return _db.document('account');
    return await _db.maybeDocument(_docName(userId)) ?? await _fresh(userId);
  }

  Future<void> save(String userId, Map<String, dynamic> doc) =>
      _db.saveDocument(_docName(userId), doc);

  /// Erases the account document and every record the user owns.
  Future<void> delete(String userId) async {
    await _db.deleteDocument(_docName(userId));
    for (final name in ['orders', 'wallet_transactions']) {
      final kept = (await _db.collection(
        name,
      )).where((r) => !owns(r, userId)).toList();
      await _db.replaceCollection(name, kept);
    }
  }

  Future<Map<String, dynamic>> _fresh(String userId) async {
    final user = await _db.findById('auth_users', userId);
    final name = '${user?['first_name'] ?? ''}'.toUpperCase().replaceAll(
      RegExp('[^A-Z]'),
      '',
    );
    final suffix = userId.replaceAll(RegExp(r'\D'), '');
    final tail = suffix.length > 4
        ? suffix.substring(suffix.length - 4)
        : suffix;
    final code = [
      'TAVADA',
      if (name.isNotEmpty) name,
      if (tail.isNotEmpty) tail,
    ].join('-');
    return {
      'wallet': {'balance': 0.0, 'currency': 'GBP'},
      'rewards': {
        'points': 0,
        'next_reward_points': 200,
        'reward_value': 5.0,
        'referral_points': 80,
        'referral_code': code,
      },
      'notification_channels': {'push': true, 'whatsapp': false, 'email': true},
      'notification_categories': {
        'order_status': true,
        'promotions': true,
        'recommendations': true,
        'reminders': true,
      },
      'accessibility': {'hearing': 'none'},
    };
  }
}
