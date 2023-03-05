import 'package:formz/formz.dart';

enum ThemeNameValidationError {
  blank,
  toLong,
  toShort,
}

class ThemeNameInput extends FormzInput<String, ThemeNameValidationError> {
  const ThemeNameInput.pure([String value = '']) : super.pure(value);

  const ThemeNameInput.dirty([String value = '']) : super.dirty(value);

  ThemeNameInput toDirty() => ThemeNameInput.dirty(value);

  @override
  ThemeNameValidationError? validator(String value) {
    if (value.isEmpty) {
      return ThemeNameValidationError.blank;
    } else if (value.length > 24) {
      return ThemeNameValidationError.toLong;
    } else if (value.length < 4) {
      return ThemeNameValidationError.toShort;
    } else {
      return null;
    }
  }
}
