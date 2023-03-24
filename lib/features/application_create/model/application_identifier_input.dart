import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';
import 'package:webtrit_configurator/core/config/l10n/l10n.dart';

enum ApplicationIdentifierValidationError {
  blank,
  toLong,
  toShort,
}

class ApplicationIdentifierInput extends FormzInput<String, ApplicationIdentifierValidationError> {
  const ApplicationIdentifierInput.pure([String value = '']) : super.pure(value);

  const ApplicationIdentifierInput.dirty([String value = '']) : super.dirty(value);

  ApplicationIdentifierInput toDirty() => ApplicationIdentifierInput.dirty(value);

  @override
  ApplicationIdentifierValidationError? validator(String value) {
    if (value.isEmpty) {
      return ApplicationIdentifierValidationError.blank;
    } else if (value.length > 24) {
      return ApplicationIdentifierValidationError.toLong;
    } else if (value.length < 4) {
      return ApplicationIdentifierValidationError.toShort;
    } else {
      return null;
    }
  }
}

// TODO: ADD CORRECT VALIDATION
extension ExtensionIdentifierErrorL10n on ApplicationIdentifierInput {
  String? errorL10n(BuildContext context) {
    if (isValid) {
      return null;
    } else {
      switch (error!) {
        case ApplicationIdentifierValidationError.blank:
          return context.l10n.feature_application_identifier_error;
        case ApplicationIdentifierValidationError.toLong:
          return context.l10n.feature_application_identifier_error;
        case ApplicationIdentifierValidationError.toShort:
          return context.l10n.feature_application_identifier_error;
      }
    }
    return null;
  }
}
