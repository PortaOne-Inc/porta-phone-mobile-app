import 'package:formz/formz.dart';

enum ApplicationDescriptionValidationError {
  blank,
  toLong,
  toShort,
}

class ApplicationDescriptionInput extends FormzInput<String, ApplicationDescriptionValidationError> {
  const ApplicationDescriptionInput.pure([String value = '']) : super.pure(value);

  const ApplicationDescriptionInput.dirty([String value = '']) : super.dirty(value);

  ApplicationDescriptionInput toDirty() => ApplicationDescriptionInput.dirty(value);

  @override
  ApplicationDescriptionValidationError? validator(String value) {
    if (value.isEmpty) {
      return ApplicationDescriptionValidationError.blank;
    } else if (value.length > 64) {
      return ApplicationDescriptionValidationError.toLong;
    } else if (value.length < 4) {
      return ApplicationDescriptionValidationError.toShort;
    } else {
      return null;
    }
  }
}
