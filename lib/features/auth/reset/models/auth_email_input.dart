// ignore_for_file: use_super_parameters

import 'package:formz/formz.dart';
import 'package:validated/validated.dart' as validate;

enum EmailValidationError {
  blank,
  invalid,
}

class AuthEmailInput extends FormzInput<String, EmailValidationError> {
  const AuthEmailInput.pure([String value = '']) : super.pure(value);

  const AuthEmailInput.dirty([String value = '']) : super.dirty(value);

  AuthEmailInput toDirty() => AuthEmailInput.dirty(value);

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.blank;
    } else if (!validate.isEmail(value)) {
      return EmailValidationError.invalid;
    } else {
      return null;
    }
  }
}
