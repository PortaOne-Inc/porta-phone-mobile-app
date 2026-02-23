import 'package:dio/dio.dart';

import 'package:data/datasource/preferences/auth_pref_datasource.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this.authPrefDatasource);

  final AuthPrefDatasource authPrefDatasource;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (authPrefDatasource.isAuthTokenExist()) {
      options.headers['Authorization'] =
          'Bearer ${authPrefDatasource.getAuthToken()}';
    }
    handler.next(options);
  }
}

class HeadersInterceptor extends Interceptor {
  HeadersInterceptor(this.headers);

  final Map<String, String> headers;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll(headers);
    handler.next(options);
  }
}
