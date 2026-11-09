/// Exceptions thrown by the data layer (data sources / API client).
///
/// Repositories catch these and convert them to `Failure`s so the domain and
/// presentation layers never deal with raw exceptions.
sealed class AppException implements Exception {
  const AppException(this.message, {this.code, this.statusCode});

  final String message;

  /// Machine-readable error code from the API envelope (e.g. `invalid_otp`).
  final String? code;
  final int? statusCode;

  @override
  String toString() => 'AppException($statusCode, $code): $message';
}

/// No connectivity, DNS failure or timeout.
final class NetworkException extends AppException {
  const NetworkException([super.message = 'No internet connection'])
    : super(code: 'network');
}

/// Request timed out.
final class TimeoutException extends AppException {
  const TimeoutException([super.message = 'The request timed out'])
    : super(code: 'timeout');
}

/// 5xx or malformed server response.
final class ServerException extends AppException {
  const ServerException(super.message, {super.code, super.statusCode});
}

/// 401/403 — session expired or forbidden.
final class UnauthorizedException extends AppException {
  const UnauthorizedException([super.message = 'Unauthorized'])
    : super(code: 'unauthorized', statusCode: 401);
}

/// 404.
final class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Not found'])
    : super(code: 'not_found', statusCode: 404);
}

/// 400/422 with optional per-field messages.
final class ValidationException extends AppException {
  const ValidationException(
    super.message, {
    super.code,
    this.fieldErrors = const {},
  }) : super(statusCode: 422);

  final Map<String, String> fieldErrors;
}

/// Request was cancelled (e.g. a newer search superseded it).
final class CancelledException extends AppException {
  const CancelledException() : super('Request cancelled', code: 'cancelled');
}

/// Local persistence failed.
final class CacheException extends AppException {
  const CacheException([super.message = 'Local storage error'])
    : super(code: 'cache');
}
