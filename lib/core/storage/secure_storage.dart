import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Keychain/Keystore-backed storage for credentials. The access token is
/// cached in memory so the auth interceptor doesn't hit a platform channel on
/// every request.
class SecureStorage {
  SecureStorage(this._storage);

  static const _accessTokenKey = 'auth.access_token';
  static const _refreshTokenKey = 'auth.refresh_token';

  final FlutterSecureStorage _storage;
  String? _accessToken;
  bool _loaded = false;

  Future<String?> readAccessToken() async {
    if (_loaded) return _accessToken;
    try {
      _accessToken = await _storage.read(key: _accessTokenKey);
    } on Object {
      _accessToken = null;
    }
    _loaded = true;
    return _accessToken;
  }

  Future<void> writeTokens({
    required String accessToken,
    String? refreshToken,
  }) async {
    _accessToken = accessToken;
    _loaded = true;
    await _storage.write(key: _accessTokenKey, value: accessToken);
    if (refreshToken != null) {
      await _storage.write(key: _refreshTokenKey, value: refreshToken);
    }
  }

  Future<void> clear() async {
    _accessToken = null;
    _loaded = true;
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }
}
