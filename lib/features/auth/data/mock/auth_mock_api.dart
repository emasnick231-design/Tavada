import 'package:tavada_eats/core/network/mock/mock_database.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';

/// Fake auth backend.
///
/// * Users live in `assets/mock/auth_users.json`; sign-ups are persisted.
/// * Every one-time code is `1234` (shown as a dev tip outside prod).
class AuthMockApi implements MockApi {
  AuthMockApi(this._db);

  static const validCode = '1234';
  static const _users = 'auth_users';

  final MockDatabase _db;

  @override
  List<MockRoute> get routes => [
    MockRoute.post('/auth/sign-up/check-email', _checkEmail),
    MockRoute.post('/auth/sign-up', _signUp),
    MockRoute.post('/auth/otp/send', _sendOtp),
    MockRoute.post('/auth/otp/verify', _verifyOtp),
    MockRoute.post('/auth/login', _login),
    MockRoute.post('/auth/login/phone', _phoneLogin),
    MockRoute.post('/auth/login/phone/verify', _phoneLoginVerify),
    MockRoute.post('/auth/password/forgot', _forgotPassword),
    MockRoute.post('/auth/password/reset', _resetPassword),
  ];

  // ── Helpers ───────────────────────────────────────────────────────────────

  static String _digits(String value) => value.replaceAll(RegExp(r'\D'), '');

  /// The rule shown under every password field: 8+ characters, a letter and
  /// a number or special character.
  static bool _isStrong(String password) =>
      password.length >= 8 &&
      RegExp('[A-Za-z]').hasMatch(password) &&
      RegExp('[^A-Za-z]').hasMatch(password);

  Future<Map<String, dynamic>?> _byEmail(String email) async {
    final target = email.trim().toLowerCase();
    final matches = await _db.where(
      _users,
      (u) => '${u['email']}'.toLowerCase() == target,
    );
    return matches.isEmpty ? null : matches.first;
  }

  Future<Map<String, dynamic>?> _byPhone(String phone) async {
    final target = _digits(phone);
    final matches = await _db.where(
      _users,
      (u) => _digits('${u['phone'] ?? ''}') == target,
    );
    return matches.isEmpty ? null : matches.first;
  }

  static Map<String, dynamic> _session(Map<String, dynamic> user) {
    final stamp = DateTime.now().millisecondsSinceEpoch;
    return {
      'user': {...user}..remove('password'),
      'access_token': 'tk_${user['id']}_$stamp',
      'refresh_token': 'rt_${user['id']}_$stamp',
    };
  }

  static MockResponse _invalidCode() => MockResponse.validation(
    "That code isn't right. Check it and try again.",
    code: 'invalid_otp',
    fields: const {'code': 'invalid'},
  );

  static String _firstNameFrom(String email) {
    final local = email.split('@').first;
    final word = local
        .split(RegExp('[^A-Za-z]'))
        .firstWhere(
          (s) => s.isNotEmpty,
          orElse: () => 'Friend',
        );
    return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
  }

  // ── Handlers ──────────────────────────────────────────────────────────────

  Future<MockResponse> _checkEmail(MockRequest req) async {
    final email = '${req.json['email'] ?? ''}';
    if (!email.contains('@')) {
      return MockResponse.validation(
        'Enter a valid email address.',
        code: 'invalid_email',
      );
    }
    if (await _byEmail(email) != null) {
      return MockResponse.error(
        409,
        code: 'email_taken',
        message: 'An account with this email already exists.',
      );
    }
    return MockResponse.ok(const {'available': true});
  }

  MockResponse _sendOtp(MockRequest req) {
    final destination = '${req.json['destination'] ?? ''}';
    if (destination.isEmpty) {
      return MockResponse.validation('Missing destination.');
    }
    return MockResponse.ok({
      'destination': destination,
      'resend_in_seconds': 30,
    });
  }

  MockResponse _verifyOtp(MockRequest req) {
    if (req.json['code'] != validCode) return _invalidCode();
    final stamp = DateTime.now().millisecondsSinceEpoch;
    return MockResponse.ok({'verification_token': 'vt_$stamp'});
  }

  Future<MockResponse> _signUp(MockRequest req) async {
    final body = req.json;
    if (body['code'] != validCode) return _invalidCode();
    final email = '${body['email'] ?? ''}'.trim().toLowerCase();
    if (await _byEmail(email) != null) {
      return MockResponse.error(
        409,
        code: 'email_taken',
        message: 'An account with this email already exists.',
      );
    }
    final password = '${body['password'] ?? ''}';
    if (!_isStrong(password)) {
      return MockResponse.validation(
        'Choose a stronger password.',
        code: 'weak_password',
      );
    }
    final firstName = '${body['first_name'] ?? ''}'.trim();
    final user = await _db.insert(_users, {
      'id': 'u_${DateTime.now().millisecondsSinceEpoch}',
      // Older clients didn't ask for a name: fall back to the email.
      'first_name': firstName.isEmpty ? _firstNameFrom(email) : firstName,
      'last_name': '${body['last_name'] ?? ''}'.trim(),
      'email': email,
      'phone': body['phone'],
      'avatar_url': 'assets/images/avatars/parrot.png',
      'password': body['password'],
    });
    return MockResponse(201, {'data': _session(user)});
  }

  Future<MockResponse> _login(MockRequest req) async {
    final user = await _byEmail('${req.json['email'] ?? ''}');
    if (user == null || user['password'] != req.json['password']) {
      return MockResponse.error(
        401,
        code: 'invalid_credentials',
        message: 'Incorrect email or password',
      );
    }
    return MockResponse.ok(_session(user));
  }

  Future<MockResponse> _phoneLogin(MockRequest req) async {
    final phone = '${req.json['phone'] ?? ''}';
    if (await _byPhone(phone) == null) {
      return MockResponse.notFound(
        "We couldn't find an account with that number.",
      );
    }
    return MockResponse.ok({'destination': phone, 'resend_in_seconds': 30});
  }

  Future<MockResponse> _phoneLoginVerify(MockRequest req) async {
    if (req.json['code'] != validCode) return _invalidCode();
    final user = await _byPhone('${req.json['phone'] ?? ''}');
    if (user == null) return MockResponse.notFound();
    return MockResponse.ok(_session(user));
  }

  MockResponse _forgotPassword(MockRequest req) {
    // Always succeed so the API doesn't reveal which emails are registered.
    return MockResponse.ok({
      'destination': '${req.json['email'] ?? ''}',
      'resend_in_seconds': 30,
    });
  }

  Future<MockResponse> _resetPassword(MockRequest req) async {
    final body = req.json;
    if (!'${body['verification_token'] ?? ''}'.startsWith('vt_')) {
      return MockResponse.validation(
        'This reset link has expired. Request a new code.',
        code: 'invalid_token',
      );
    }
    if (!_isStrong('${body['password'] ?? ''}')) {
      return MockResponse.validation(
        'Use at least 8 characters with a letter and a number or symbol.',
        code: 'weak_password',
      );
    }
    final user = await _byEmail('${body['email'] ?? ''}');
    if (user != null) {
      await _db.update(_users, '${user['id']}', {'password': body['password']});
    }
    return MockResponse.ok(const {'reset': true});
  }
}
