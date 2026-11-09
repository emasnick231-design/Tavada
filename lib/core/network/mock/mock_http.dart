import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// A request as seen by a mock route handler.
@immutable
class MockRequest {
  const MockRequest({
    required this.method,
    required this.path,
    required this.query,
    required this.headers,
    this.body,
    this.pathParams = const {},
  });

  factory MockRequest.fromOptions(RequestOptions options) => MockRequest(
    method: options.method.toUpperCase(),
    path: options.uri.path.replaceFirst(
      Uri.parse(options.baseUrl).path,
      '',
    ),
    query: options.queryParameters,
    headers: options.headers,
    body: options.data,
  );

  final String method;

  /// Path relative to the API base URL, e.g. `/restaurants/mide-lagos`.
  final String path;
  final Map<String, String> pathParams;
  final Map<String, dynamic> query;
  final Map<String, dynamic> headers;
  final Object? body;

  /// Body decoded as a JSON object (empty map when absent).
  Map<String, dynamic> get json =>
      body is Map<String, dynamic> ? body! as Map<String, dynamic> : const {};

  String? param(String name) => pathParams[name];

  String? queryString(String name) {
    final v = query[name];
    if (v == null) return null;
    if (v is List) return v.join(',');
    return '$v';
  }

  /// Comma separated or repeated query params as a list.
  List<String> queryList(String name) {
    final v = query[name];
    if (v == null) return const [];
    if (v is List) return v.map((e) => '$e').toList();
    return '$v'.split(',').where((e) => e.isNotEmpty).toList();
  }

  bool queryBool(String name) {
    final v = queryString(name);
    return v == 'true' || v == '1';
  }

  double? queryDouble(String name) => double.tryParse(queryString(name) ?? '');
  int? queryInt(String name) => int.tryParse(queryString(name) ?? '');

  /// Bearer token sent by the auth interceptor, if any.
  String? get bearerToken {
    final auth = headers['Authorization'] ?? headers['authorization'];
    if (auth is String && auth.startsWith('Bearer ')) return auth.substring(7);
    return null;
  }

  MockRequest copyWith({Map<String, String>? pathParams}) => MockRequest(
    method: method,
    path: path,
    query: query,
    headers: headers,
    body: body,
    pathParams: pathParams ?? this.pathParams,
  );
}

/// Response produced by a mock handler. Uses the same envelope as the real
/// API: `{ "data": … }` on success, `{ "error": { … } }` on failure.
@immutable
class MockResponse {
  const MockResponse(this.statusCode, this.body);

  factory MockResponse.ok(Object? data, {Map<String, dynamic>? meta}) =>
      MockResponse(200, {'data': data, 'meta': ?meta});

  factory MockResponse.created(Object? data) =>
      MockResponse(201, {'data': data});

  factory MockResponse.noContent() => const MockResponse(204, null);

  factory MockResponse.error(
    int statusCode, {
    required String code,
    required String message,
    Map<String, String>? fields,
  }) => MockResponse(statusCode, {
    'error': {'code': code, 'message': message, 'fields': ?fields},
  });

  factory MockResponse.notFound([String message = 'Not found']) =>
      MockResponse.error(404, code: 'not_found', message: message);

  factory MockResponse.unauthorized([String message = 'Please sign in']) =>
      MockResponse.error(401, code: 'unauthorized', message: message);

  factory MockResponse.validation(
    String message, {
    String code = 'validation_error',
    Map<String, String>? fields,
  }) => MockResponse.error(422, code: code, message: message, fields: fields);

  final int statusCode;
  final Object? body;

  bool get isError => statusCode >= 400;
}

typedef MockHandler = FutureOr<MockResponse> Function(MockRequest request);

/// A single mock endpoint. Paths support `:param` segments.
///
/// Example (`db` is the shared `MockDatabase`):
///
/// ```dart
/// MockRoute.get('/restaurants/:id', (req) async {
///   final r = await db.findById('restaurants', req.param('id')!);
///   return r == null ? MockResponse.notFound() : MockResponse.ok(r);
/// });
/// ```
@immutable
class MockRoute {
  MockRoute(this.method, this.path, this.handler) : _segments = _split(path);

  MockRoute.get(String path, MockHandler handler) : this('GET', path, handler);
  MockRoute.post(String path, MockHandler handler)
    : this('POST', path, handler);
  MockRoute.put(String path, MockHandler handler) : this('PUT', path, handler);
  MockRoute.patch(String path, MockHandler handler)
    : this('PATCH', path, handler);
  MockRoute.delete(String path, MockHandler handler)
    : this('DELETE', path, handler);

  final String method;
  final String path;
  final MockHandler handler;
  final List<String> _segments;

  static List<String> _split(String path) =>
      path.split('/').where((s) => s.isNotEmpty).toList();

  /// Returns the extracted path params when the request matches, else null.
  Map<String, String>? match(String requestMethod, String requestPath) {
    if (requestMethod != method) return null;
    final parts = _split(requestPath);
    if (parts.length != _segments.length) return null;
    final params = <String, String>{};
    for (var i = 0; i < parts.length; i++) {
      final seg = _segments[i];
      if (seg.startsWith(':')) {
        params[seg.substring(1)] = Uri.decodeComponent(parts[i]);
      } else if (seg != parts[i]) {
        return null;
      }
    }
    return params;
  }
}

/// Implemented by each feature to contribute endpoints to the mock server.
abstract interface class MockApi {
  List<MockRoute> get routes;
}
