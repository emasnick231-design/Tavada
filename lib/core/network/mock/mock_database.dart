import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// Tiny JSON document store backing the mock API.
///
/// * A **collection** is a JSON array in `assets/mock/<name>.json`.
/// * A **document** is a JSON object in `assets/mock/<name>.json`.
///
/// Fixtures load lazily on first access. Mutations are persisted to
/// [SharedPreferences] so demo state (orders, wallet top-ups, profile edits)
/// survives app restarts. Every read returns a deep copy so handlers can't
/// corrupt the cache by accident.
class MockDatabase {
  MockDatabase({required this._bundle, required this._prefs});

  static const _prefix = 'mockdb.';
  static const _uuid = Uuid();

  final AssetBundle _bundle;
  final SharedPreferences _prefs;
  final Map<String, Object?> _cache = {};

  // ── Collections ───────────────────────────────────────────────────────────

  Future<List<Map<String, dynamic>>> collection(String name) async {
    final raw = await _load(name);
    if (raw is! List) {
      throw StateError('assets/mock/$name.json is not a JSON array');
    }
    return _copy(raw)! as List<Map<String, dynamic>>;
  }

  Future<List<Map<String, dynamic>>> where(
    String name,
    bool Function(Map<String, dynamic> item) test,
  ) async => (await collection(name)).where(test).toList();

  Future<Map<String, dynamic>?> findById(
    String name,
    String id, {
    String idField = 'id',
  }) async {
    for (final item in await collection(name)) {
      if ('${item[idField]}' == id) return item;
    }
    return null;
  }

  /// Inserts [item] (assigning a UUID `id` when missing) and returns it.
  Future<Map<String, dynamic>> insert(
    String name,
    Map<String, dynamic> item, {
    bool prepend = true,
  }) async {
    final items = await collection(name);
    final withId = {'id': _uuid.v4(), ...item};
    prepend ? items.insert(0, withId) : items.add(withId);
    await _save(name, items);
    return withId;
  }

  /// Shallow-merges [patch] into the item with [id]. Returns the new value.
  Future<Map<String, dynamic>?> update(
    String name,
    String id,
    Map<String, dynamic> patch,
  ) async {
    final items = await collection(name);
    final index = items.indexWhere((e) => '${e['id']}' == id);
    if (index == -1) return null;
    final updated = {...items[index], ...patch};
    items[index] = updated;
    await _save(name, items);
    return updated;
  }

  Future<bool> remove(String name, String id) async {
    final items = await collection(name);
    final before = items.length;
    items.removeWhere((e) => '${e['id']}' == id);
    if (items.length == before) return false;
    await _save(name, items);
    return true;
  }

  Future<void> replaceCollection(
    String name,
    List<Map<String, dynamic>> items,
  ) => _save(name, items);

  // ── Documents ─────────────────────────────────────────────────────────────

  Future<Map<String, dynamic>> document(String name) async {
    final raw = await _load(name);
    if (raw is! Map) {
      throw StateError('assets/mock/$name.json is not a JSON object');
    }
    return _copy(raw)! as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> patchDocument(
    String name,
    Map<String, dynamic> patch,
  ) async {
    final doc = {...await document(name), ...patch};
    await _save(name, doc);
    return doc;
  }

  Future<void> saveDocument(String name, Map<String, dynamic> doc) =>
      _save(name, doc);

  /// A document that only exists once saved (no fixture), or `null`.
  Future<Map<String, dynamic>?> maybeDocument(String name) async {
    final raw = _cache.containsKey(name)
        ? _cache[name]
        : switch (_prefs.getString('$_prefix$name')) {
            final String persisted => _cache[name] = jsonDecode(persisted),
            null => null,
          };
    return raw is Map ? _copy(raw)! as Map<String, dynamic> : null;
  }

  /// Removes a saved document (see [maybeDocument]).
  Future<void> deleteDocument(String name) async {
    _cache.remove(name);
    await _prefs.remove('$_prefix$name');
  }

  // ── Maintenance ───────────────────────────────────────────────────────────

  /// Drops every persisted mutation and reloads fixtures on next access.
  Future<void> reset() async {
    _cache.clear();
    final keys = _prefs.getKeys().where((k) => k.startsWith(_prefix));
    for (final key in keys.toList()) {
      await _prefs.remove(key);
    }
  }

  // ── Internals ─────────────────────────────────────────────────────────────

  Future<Object?> _load(String name) async {
    if (_cache.containsKey(name)) return _cache[name];
    final persisted = _prefs.getString('$_prefix$name');
    final source =
        persisted ?? await _bundle.loadString('assets/mock/$name.json');
    final decoded = jsonDecode(source);
    _cache[name] = decoded;
    return decoded;
  }

  Future<void> _save(String name, Object value) async {
    _cache[name] = _copy(value);
    await _prefs.setString('$_prefix$name', jsonEncode(value));
  }

  static Object? _copy(Object? value) {
    if (value is Map) {
      return value.map<String, dynamic>((k, v) => MapEntry('$k', _copy(v)));
    }
    if (value is List) {
      if (value.every((e) => e is Map)) {
        return value.map((e) => _copy(e)! as Map<String, dynamic>).toList();
      }
      return value.map(_copy).toList();
    }
    return value;
  }
}
