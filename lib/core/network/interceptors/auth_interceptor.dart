import 'package:dio/dio.dart';
import 'package:tavada_eats/core/storage/secure_storage.dart';

/// Attaches the bearer token, the user's locale and the delivery location
/// (`X-Delivery-Location: lat,lng`, so the catalog and quotes match the
/// chosen address) to every request.
class AuthInterceptor extends Interceptor {
  AuthInterceptor(
    this._secureStorage, {
    required this.localeProvider,
    this.locationProvider,
  });

  static const locationHeader = 'X-Delivery-Location';

  final SecureStorage _secureStorage;
  final String Function() localeProvider;

  /// `lat,lng` of the current delivery address, if any.
  final String? Function()? locationProvider;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _secureStorage.readAccessToken();
    if (token != null) options.headers['Authorization'] = 'Bearer $token';
    options.headers['Accept-Language'] = localeProvider();
    final location = locationProvider?.call();
    if (location != null) options.headers[locationHeader] = location;
    handler.next(options);
  }
}
