import 'package:flutter/widgets.dart';

import 'package:formz/formz.dart';
import 'package:validated/validated.dart' as validate;

import 'package:webtrit_configurator/localization/localization.dart';

import 'applications_consts.dart';

enum ApplicationTermsConditionsValidationError { toLong, invalid }

class ApplicationTermsConditionsInput
    extends FormzInput<String, ApplicationTermsConditionsValidationError> {
  const ApplicationTermsConditionsInput.pure([super.value = '']) : super.pure();

  const ApplicationTermsConditionsInput.dirty([super.value = ''])
    : super.dirty();

  ApplicationTermsConditionsInput toDirty() =>
      ApplicationTermsConditionsInput.dirty(value);

  @override
  ApplicationTermsConditionsValidationError? validator(String value) {
    if (value.length > ApplicationConsts.maxCoreLimit) {
      return ApplicationTermsConditionsValidationError.toLong;
    } else if (!validate.isURL(value) && value.isNotEmpty) {
      return ApplicationTermsConditionsValidationError.invalid;
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
        case ApplicationTermsConditionsValidationError.toLong:
          return context.l10n.feature_application_terms_and_conditions_error;
        case ApplicationTermsConditionsValidationError.invalid:
          return context.l10n.common_url_is_not_valid;
      }
    }
  }
}
