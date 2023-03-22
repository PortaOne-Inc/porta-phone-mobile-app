import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';
import 'package:webtrit_configurator/core/config/l10n/l10n.dart';

enum ApplicationAndroidIdentifierError {
  blank,
  toLong,
  toShort,
}

class ApplicationAndroidIdentifierInput extends FormzInput<String, ApplicationAndroidIdentifierError> {
  const ApplicationAndroidIdentifierInput.pure([String value = '']) : super.pure(value);

  const ApplicationAndroidIdentifierInput.dirty([String value = '']) : super.dirty(value);

  ApplicationAndroidIdentifierInput toDirty() => ApplicationAndroidIdentifierInput.dirty(value);

  @override
  ApplicationAndroidIdentifierError? validator(String value) {
    if (value.isEmpty) {
      return ApplicationAndroidIdentifierError.blank;
    } else if (value.length > 24) {
      return ApplicationAndroidIdentifierError.toLong;
    } else if (value.length < 4) {
      return ApplicationAndroidIdentifierError.toShort;
    } else {
      return null;
    }
  }
}

// TODO: ADD CORRECT VALIDATION
extension ExtensionValidationAndroidIdentifierErrorL10n on ApplicationAndroidIdentifierInput {
  String? errorL10n(BuildContext context) {
    if (isValid) {
      return null;
    } else {
      switch (error!) {
        case ApplicationAndroidIdentifierError.blank:
          return context.l10n.feature_application_android_package_name_error;
        case ApplicationAndroidIdentifierError.toLong:
          return context.l10n.feature_application_android_package_name_error;
        case ApplicationAndroidIdentifierError.toShort:
          return context.l10n.feature_application_android_package_name_error;
      }
    }
  }
}
