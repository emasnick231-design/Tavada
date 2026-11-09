import 'dart:io' show SocketException;

import 'package:dio/dio.dart';
import 'package:tavada_eats/core/error/app_exception.dart';

/// HTTP client used by every remote data source.
///
/// * Unwraps the `{ "data": … }` response envelope.
/// * Converts [DioException]s into typed [AppException]s, reading the
///   `{ "error": { "code", "message", "fields" } }` error envelope.
///
/// Data sources depend on this class only, never on Dio directly, so the
/// mock API and a real backend are interchangeable.
class ApiClient {
  ApiClient(this._dio);

  final Dio _dio;

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) => _send<T>(
    () => _dio.get<Object?>(
      path,
      queryParameters: _clean(query),
      cancelToken: cancelToken,
    ),
  );

  Future<T> post<T>(
    String path, {
    Object? body,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) => _send<T>(
    () => _dio.post<Object?>(
      path,
      data: body,
      queryParameters: _clean(query),
      cancelToken: cancelToken,
    ),
  );

  Future<T> put<T>(String path, {Object? body}) =>
      _send<T>(() => _dio.put<Object?>(path, data: body));

  Future<T> patch<T>(String path, {Object? body}) =>
      _send<T>(() => _dio.patch<Object?>(path, data: body));

  Future<T> delete<T>(String path, {Object? body}) =>
      _send<T>(() => _dio.delete<Object?>(path, data: body));

  Future<T> _send<T>(Future<Response<Object?>> Function() request) async {
    try {
      final response = await request();
      final body = response.data;
      final data = body is Map<String, dynamic> && body.containsKey('data')
          ? body['data']
          : body;
      return data as T;
    } on DioException catch (e) {
      throw _mapDioException(e);
    } on SocketException catch (e) {
      throw NetworkException(e.message);
    }
  }

  static Map<String, dynamic>? _clean(Map<String, dynamic>? query) {
    if (query == null) return null;
    return Map.fromEntries(
      query.entries.where((e) {
        final v = e.value;
        return v != null && !(v is Iterable && v.isEmpty) && v != '';
      }),
    );
  }

  static AppException _mapDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return const TimeoutException();
      case DioExceptionType.connectionError:
        return const NetworkException();
      case DioExceptionType.cancel:
        return const CancelledException();
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        if (e.error is SocketException) return const NetworkException();
        return ServerException(e.message ?? 'Unknown error');
      case DioExceptionType.badResponse:
        return _fromResponse(e.response);
    }
  }

  static AppException _fromResponse(Response<dynamic>? response) {
    final status = response?.statusCode ?? 500;
    final body = response?.data;
    var message = 'Something went wrong';
    String? code;
    var fields = <String, String>{};
    if (body is Map<String, dynamic> && body['error'] is Map<String, dynamic>) {
      final error = body['error'] as Map<String, dynamic>;
      message = error['message'] as String? ?? message;
      code = error['code'] as String?;
      final rawFields = error['fields'];
      if (rawFields is Map) {
        fields = rawFields.map((k, v) => MapEntry('$k', '$v'));
      }
    }
    return switch (status) {
      401 || 403 => UnauthorizedException(message),
      404 => NotFoundException(message),
      400 || 409 || 422 => ValidationException(
        message,
        code: code,
        fieldErrors: fields,
      ),
      _ => ServerException(message, code: code, statusCode: status),
    };
  }
}
