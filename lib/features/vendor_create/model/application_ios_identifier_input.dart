import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';
import 'package:webtrit_configurator/core/config/l10n/l10n.dart';

enum ApplicationIOSIdentifierValidationError {
  blank,
  toLong,
  toShort,
}

class ApplicationIOSIdentifierInput extends FormzInput<String, ApplicationIOSIdentifierValidationError> {
  const ApplicationIOSIdentifierInput.pure([String value = '']) : super.pure(value);

  const ApplicationIOSIdentifierInput.dirty([String value = '']) : super.dirty(value);

  ApplicationIOSIdentifierInput toDirty() => ApplicationIOSIdentifierInput.dirty(value);

  @override
  ApplicationIOSIdentifierValidationError? validator(String value) {
    if (value.isEmpty) {
      return ApplicationIOSIdentifierValidationError.blank;
    } else if (value.length > 24) {
      return ApplicationIOSIdentifierValidationError.toLong;
    } else if (value.length < 4) {
      return ApplicationIOSIdentifierValidationError.toShort;
    } else {
      return null;
    }
  }
}

// TODO: ADD CORRECT VALIDATION
extension ExtensionIOSIdentifierErrorL10n on ApplicationIOSIdentifierInput {
  String? errorL10n(BuildContext context) {
    if (isValid) {
      return null;
    } else {
      switch (error!) {
        case ApplicationIOSIdentifierValidationError.blank:
          return context.l10n.feature_application_ios_identifier_error;
        case ApplicationIOSIdentifierValidationError.toLong:
          return context.l10n.feature_application_ios_identifier_error;
        case ApplicationIOSIdentifierValidationError.toShort:
          return context.l10n.feature_application_ios_identifier_error;
      }
    }
  }
}
