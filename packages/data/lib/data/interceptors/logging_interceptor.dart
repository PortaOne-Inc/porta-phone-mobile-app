import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      lineLength: 64,
    ),
  );

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    _logger.i(
      'REQUEST[${options.method}] => ${options.baseUrl}${options.path}'
      '=> BODY: ${options.data} => PARAMS: ${options.queryParameters}',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    _logger.i(
      'RESPONSE[${response.statusCode}] => ${response.requestOptions.path}'
      '=> BODY: ${response.data}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    _logger.e(
      'ERROR[${err.response?.statusCode}] => ${err.requestOptions.path}'
      '=> ERROR: ${err.message}',
    );
    super.onError(err, handler);
  }
}
