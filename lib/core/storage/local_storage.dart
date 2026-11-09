import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// Keys for [LocalStorage]. Feature-specific keys should be prefixed with the
/// feature name to avoid collisions (e.g. `search.recent`).
abstract final class StorageKeys {
  static const recentSearches = 'search.recent';
  static const lastKnownLocation = 'location.last_known';
}

/// Typed wrapper around [SharedPreferences] for small, non-sensitive values.
class LocalStorage {
  LocalStorage(this._prefs);

  final SharedPreferences _prefs;

  String? getString(String key) => _prefs.getString(key);
  Future<void> setString(String key, String value) =>
      _prefs.setString(key, value);

  bool getBool(String key, {bool fallback = false}) =>
      _prefs.getBool(key) ?? fallback;
  Future<void> setBool(String key, {required bool value}) =>
      _prefs.setBool(key, value);

  int? getInt(String key) => _prefs.getInt(key);
  Future<void> setInt(String key, int value) => _prefs.setInt(key, value);

  List<String> getStringList(String key) => _prefs.getStringList(key) ?? [];
  Future<void> setStringList(String key, List<String> value) =>
      _prefs.setStringList(key, value);

  Map<String, dynamic>? getJson(String key) {
    final raw = _prefs.getString(key);
    if (raw == null) return null;
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  Future<void> setJson(String key, Map<String, dynamic> value) =>
      _prefs.setString(key, jsonEncode(value));

  Future<void> remove(String key) => _prefs.remove(key);
}
