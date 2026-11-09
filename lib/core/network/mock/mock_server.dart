import 'dart:math';

import 'package:tavada_eats/app/flavor/flavor_config.dart';
import 'package:tavada_eats/core/logging/app_logger.dart';
import 'package:tavada_eats/core/network/mock/mock_http.dart';

export 'mock_http.dart';

/// In-process fake backend. Features register [MockRoute]s; requests are
/// routed here by `MockApiInterceptor` with realistic latency and an optional
/// failure rate (staging) so loading/error UI gets exercised.
class MockServer {
  MockServer(this._config, {Random? random}) : _random = random ?? Random();

  final FlavorConfig _config;
  final Random _random;
  final List<MockRoute> _routes = [];

  /// Paths that never fail randomly (auth flows stay deterministic).
  static const _neverFail = ['/auth', '/me', '/session'];

  void addRoutes(Iterable<MockRoute> routes) => _routes.addAll(routes);

  void addApi(MockApi api) => addRoutes(api.routes);

  Future<MockResponse> handle(MockRequest request) async {
    await Future<void>.delayed(_latency());

    final failRoll = _random.nextDouble();
    final canFail = !_neverFail.any(request.path.startsWith);
    if (canFail && failRoll < _config.mockFailureRate) {
      return MockResponse.error(
        503,
        code: 'service_unavailable',
        message: 'Our kitchen is a little busy. Please try again.',
      );
    }

    for (final route in _routes) {
      final params = route.match(request.method, request.path);
      if (params == null) continue;
      try {
        return await route.handler(request.copyWith(pathParams: params));
      } on Object catch (e, s) {
        AppLogger.instance.error(
          'Mock handler crashed: ${request.method} ${request.path}',
          e,
          s,
        );
        return MockResponse.error(
          500,
          code: 'internal_error',
          message: 'Something went wrong on our side.',
        );
      }
    }

    AppLogger.instance.warning(
      'No mock route for ${request.method} ${request.path}',
    );
    return MockResponse.notFound(
      'No mock route for ${request.method} ${request.path}',
    );
  }

  Duration _latency() {
    final min = _config.mockLatency.min.inMilliseconds;
    final max = _config.mockLatency.max.inMilliseconds;
    return Duration(milliseconds: min + _random.nextInt(max - min + 1));
  }
}
