import 'package:formz/formz.dart';

enum ApplicationNameValidationError {
  blank,
  toLong,
  toShort,
}

class ApplicationNameInput extends FormzInput<String, ApplicationNameValidationError> {
  const ApplicationNameInput.pure([String value = '']) : super.pure(value);

  const ApplicationNameInput.dirty([String value = '']) : super.dirty(value);

  ApplicationNameInput toDirty() => ApplicationNameInput.dirty(value);

  @override
  ApplicationNameValidationError? validator(String value) {
    if (value.isEmpty) {
      return ApplicationNameValidationError.blank;
    } else if (value.length > 24) {
      return ApplicationNameValidationError.toLong;
    } else if (value.length < 4) {
      return ApplicationNameValidationError.toShort;
    } else {
      return null;
    }
  }
}
