import 'exception.dart';

class InvalidFormatImageException extends BaseException {
  InvalidFormatImageException(this.invalidFormat) : super(message: '');
  final String invalidFormat;
}
