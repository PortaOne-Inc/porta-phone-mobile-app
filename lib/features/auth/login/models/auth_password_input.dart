// ignore_for_file: use_super_parameters

import 'package:formz/formz.dart';

enum PasswordValidationError {
  blank,
  invalid,
}

class AuthPasswordInput extends FormzInput<String, PasswordValidationError> {
  const AuthPasswordInput.pure([String value = '']) : super.pure(value);

  const AuthPasswordInput.dirty([String value = '']) : super.dirty(value);

  AuthPasswordInput toDirty() => AuthPasswordInput.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.blank;
    } else if (value.length < 6) {
      return PasswordValidationError.invalid;
    } else {
      return null;
    }
  }
}
