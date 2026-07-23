import 'package:flutter/widgets.dart';

import 'package:formz/formz.dart';

import 'package:webtrit_configurator/localization/localization.dart';

import 'applications_consts.dart';

enum ApplicationEmailValidationError { blank, toLong, toShort }

class ApplicationEmailInput
    extends FormzInput<String, ApplicationEmailValidationError> {
  const ApplicationEmailInput.pure([super.value = '']) : super.pure();

  // ignore: use_super_parameters
  const ApplicationEmailInput.dirty([String value = '']) : super.dirty(value);

  ApplicationEmailInput toDirty() => ApplicationEmailInput.dirty(value);

  @override
  ApplicationEmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return ApplicationEmailValidationError.blank;
    } else if (value.length > ApplicationConsts.maxNameLimit) {
      return ApplicationEmailValidationError.toLong;
    } else if (value.length < ApplicationConsts.minNameLimit) {
      return ApplicationEmailValidationError.toShort;
    } else {
      return null;
    }
  }
}

extension ExtensionValidationEmailErrorL10n on ApplicationEmailInput {
  String? errorL10n(BuildContext context) {
    if (isValid) {
      return null;
    } else {
      switch (error!) {
        case ApplicationEmailValidationError.blank:
          return context.l10n.validationBlankError;
        case ApplicationEmailValidationError.toLong:
          return context
              .l10n
              .feature_application_create_Validation_description_to_long;
        case ApplicationEmailValidationError.toShort:
          return context
              .l10n
              .feature_application_create_Validation_description_to_short;
      }
    }
  }
}
