// ignore_for_file: use_super_parameters

import 'package:formz/formz.dart';

enum ThemeDescriptionValidationError {
  blank,
  toLong,
  toShort,
}

class ThemeDescriptionInput extends FormzInput<String, ThemeDescriptionValidationError> {
  const ThemeDescriptionInput.pure([String value = '']) : super.pure(value);

  const ThemeDescriptionInput.dirty([String value = '']) : super.dirty(value);

  ThemeDescriptionInput toDirty() => ThemeDescriptionInput.dirty(value);

  @override
  ThemeDescriptionValidationError? validator(String value) {
    if (value.isEmpty) {
      return ThemeDescriptionValidationError.blank;
    } else if (value.length > 64) {
      return ThemeDescriptionValidationError.toLong;
    } else if (value.length < 4) {
      return ThemeDescriptionValidationError.toShort;
    } else {
      return null;
    }
  }
}
