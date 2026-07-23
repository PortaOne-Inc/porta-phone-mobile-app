import 'common/base_exception.dart';

/// Thrown when the backend rejects a request with HTTP 401.
///
/// The re-login flow reacts to the token-expired status, so UI layers should
/// treat this as already handled and avoid surfacing a redundant error dialog.
class UnauthorizedException extends BaseException {
  UnauthorizedException({super.message = 'Unauthorized', super.statusCode, super.errorCode, super.details});
}
