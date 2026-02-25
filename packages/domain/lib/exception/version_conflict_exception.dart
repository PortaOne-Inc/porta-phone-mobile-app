import 'common/base_exception.dart';

class VersionConflictException extends BaseException {
  VersionConflictException({
    super.message = 'Version conflict',
    super.statusCode,
    super.errorCode,
    super.details,
  });
}
