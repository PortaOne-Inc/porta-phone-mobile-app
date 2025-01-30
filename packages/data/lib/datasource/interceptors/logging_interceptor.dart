import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 80,
      printTime: true,
    ),
  );

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    _logger.i(
      '🚀 REQUEST → [${options.method}] ${options.uri}\n'
      '📝 HEADERS: ${options.headers}\n'
      '📄 BODY: ${options.data ?? "No body"}\n'
      '🔍 PARAMS: ${options.queryParameters.isNotEmpty ? options.queryParameters : "No params"}',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    _logger.i(
      '✅ RESPONSE ← [${response.statusCode}] ${response.requestOptions.uri}\n'
      '📝 HEADERS: ${response.headers.map}\n'
      '📄 BODY: ${response.data ?? "No response body"}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    _logger.e(
      '❌ ERROR ← [${err.response?.statusCode ?? "Unknown"}] ${err.requestOptions.uri}\n'
      '📝 HEADERS: ${err.response?.headers.map ?? "No headers"}\n'
      '⚠️ MESSAGE: ${err.message}\n'
      '📄 BODY: ${err.response?.data ?? "No error body"}',
    );
    super.onError(err, handler);
  }
}
