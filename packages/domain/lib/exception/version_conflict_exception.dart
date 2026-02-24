import 'common/base_exception.dart';

class VersionConflictException extends BaseException {
  VersionConflictException({super.message = 'Version conflict'});
}
