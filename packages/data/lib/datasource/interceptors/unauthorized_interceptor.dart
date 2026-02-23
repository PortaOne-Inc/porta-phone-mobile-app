import 'package:data/common/common.dart';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// A custom interceptor for handling token expiration in HTTP requests.
///
/// This interceptor checks for unauthorized responses (status code 401)
/// and notifies a callback when such responses are detected.
@injectable
class UnauthorizedInterceptor extends Interceptor {
  static const int _unauthorizedStatusCode = 401;

  /// Callback to be invoked when an unauthorized response is detected.
  VoidCallback? _onUnauthorized;

  /// Sets the callback to be invoked when an unauthorized response is detected.
  ///
  /// This method allows setting a callback that will be called when a response
  /// with status code 401 is received.
  ///
  /// \param onUnauthorized The callback to be invoked.
  // ignore: use_setters_to_change_properties
  void setOnTokenExpired(VoidCallback onUnauthorized) {
    _onUnauthorized = onUnauthorized;
  }

  /// Invokes the unauthorized callback if it is set.
  void _notifyTokenExpired() => _onUnauthorized?.call();

  /// Intercepts HTTP responses to check for unauthorized status code.
  ///
  /// If the response status code is 401, the unauthorized callback is invoked.
  ///
  /// \param response The HTTP response.
  /// \param handler The response interceptor handler.
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.statusCode == _unauthorizedStatusCode) _notifyTokenExpired();
    super.onResponse(response, handler);
  }

  /// Intercepts HTTP errors to check for unauthorized status code.
  ///
  /// If the error response status code is 401, the unauthorized callback is invoked.
  ///
  /// \param err The HTTP error.
  /// \param handler The error interceptor handler.
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == _unauthorizedStatusCode) {
      _notifyTokenExpired();
    }
    super.onError(err, handler);
  }
}
