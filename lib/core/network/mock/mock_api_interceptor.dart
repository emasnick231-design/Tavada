import 'package:dio/dio.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';

/// Short-circuits every request to the in-process [MockServer].
class MockApiInterceptor extends Interceptor {
  MockApiInterceptor(this._server);

  final MockServer _server;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.cancelToken?.isCancelled ?? false) {
      handler.reject(
        DioException.requestCancelled(
          requestOptions: options,
          reason: options.cancelToken?.cancelError,
        ),
      );
      return;
    }

    final result = await _server.handle(MockRequest.fromOptions(options));

    if (options.cancelToken?.isCancelled ?? false) {
      handler.reject(
        DioException.requestCancelled(
          requestOptions: options,
          reason: options.cancelToken?.cancelError,
        ),
      );
      return;
    }

    final response = Response<Object?>(
      requestOptions: options,
      statusCode: result.statusCode,
      data: result.body,
    );
    if (result.isError) {
      handler.reject(
        DioException.badResponse(
          statusCode: result.statusCode,
          requestOptions: options,
          response: response,
        ),
        true,
      );
    } else {
      handler.resolve(response, true);
    }
  }
}
