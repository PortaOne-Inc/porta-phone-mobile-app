import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';
import 'package:webtrit_configurator/core/l10n/l10n.dart';

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

extension ExtensionValidationNameErrorL10n on ApplicationNameInput {
  String? errorL10n(BuildContext context) {
    if (isValid) {
      return null;
    } else {
      switch (error!) {
        case ApplicationNameValidationError.blank:
          return context.l10n.validationBlankError;
        case ApplicationNameValidationError.toLong:
          return context.l10n.feature_vendor_create_Validation_description_to_long;
        case ApplicationNameValidationError.toShort:
          return context.l10n.feature_vendor_create_Validation_description_to_short;
      }
    }
  }
}
