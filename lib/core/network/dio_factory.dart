import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tavada_eats/app/flavor/flavor_config.dart';
import 'package:tavada_eats/core/network/interceptors/auth_interceptor.dart';
import 'package:tavada_eats/core/network/mock/mock_api_interceptor.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';

/// Builds the app-wide [Dio] instance for a flavor.
///
/// Interceptor order: auth → logging → mock (the mock must be last so it sees
/// the final request, exactly like a real server would).
Dio buildDio({
  required FlavorConfig config,
  required AuthInterceptor authInterceptor,
  MockServer? mockServer,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: config.apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      contentType: Headers.jsonContentType,
      headers: {'X-Client': 'tavada-eats-mobile'},
    ),
  );

  dio.interceptors.add(authInterceptor);
  if (config.enableNetworkLogs) {
    dio.interceptors.add(
      PrettyDioLogger(
        maxWidth: 100,
        enabled: config.enableNetworkLogs,
      ),
    );
  }
  if (config.useMockApi && mockServer != null) {
    dio.interceptors.add(MockApiInterceptor(mockServer));
  }
  return dio;
}
