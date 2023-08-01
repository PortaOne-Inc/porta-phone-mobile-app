import '../exception.dart';

class NullException extends BaseException {
  NullException({required String message}) : super(message: message);
}
