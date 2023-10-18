import 'package:flutter/widgets.dart';

import 'package:formz/formz.dart';

import 'package:webtrit_configurator/localization/localization.dart';

import 'applications_consts.dart';

enum ApplicationTermsConditionsValidationError {
  blank,
  toLong,
  toShort,
}

class ApplicationTermsConditionsInput extends FormzInput<String, ApplicationTermsConditionsValidationError> {
  const ApplicationTermsConditionsInput.pure([String value = '']) : super.pure(value);

  const ApplicationTermsConditionsInput.dirty([String value = '']) : super.dirty(value);

  ApplicationTermsConditionsInput toDirty() => ApplicationTermsConditionsInput.dirty(value);

  @override
  ApplicationTermsConditionsValidationError? validator(String value) {
    if (value.isEmpty) {
      return ApplicationTermsConditionsValidationError.blank;
    } else if (value.length > ApplicationConsts.maxCoreLimit) {
      return ApplicationTermsConditionsValidationError.toLong;
    } else if (value.length < ApplicationConsts.minIdentifierLimit) {
      return ApplicationTermsConditionsValidationError.toShort;
    } else {
      return null;
    }
  }
}

extension ExtensionTermsConditionsErrorL10n on ApplicationTermsConditionsInput {
  String? errorL10n(BuildContext context) {
    if (isValid) {
      return null;
    } else {
      switch (error!) {
        case ApplicationTermsConditionsValidationError.blank:
          return context.l10n.feature_application_terms_and_conditions_error;
        case ApplicationTermsConditionsValidationError.toLong:
          return context.l10n.feature_application_terms_and_conditions_error;
        case ApplicationTermsConditionsValidationError.toShort:
          return context.l10n.feature_application_terms_and_conditions_error;
      }
    }
  }
}
