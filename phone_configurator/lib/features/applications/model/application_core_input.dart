import 'package:flutter/widgets.dart';

import 'package:formz/formz.dart';
import 'package:validated/validated.dart' as validate;

import 'package:webtrit_configurator/localization/localization.dart';

import 'applications_consts.dart';

enum ApplicationCoreValidationError { toLong, invalid }

class ApplicationCoreInput
    extends FormzInput<String, ApplicationCoreValidationError> {
  const ApplicationCoreInput.pure([super.value = '']) : super.pure();

  const ApplicationCoreInput.dirty([super.value = '']) : super.dirty();

  ApplicationCoreInput toDirty() => ApplicationCoreInput.dirty(value);

  @override
  ApplicationCoreValidationError? validator(String value) {
    if (value.length > ApplicationConsts.maxCoreLimit) {
      return ApplicationCoreValidationError.toLong;
    } else if (!validate.isURL(value) && value.isNotEmpty) {
      return ApplicationCoreValidationError.invalid;
    } else {
      return null;
    }
  }
}

extension ExtensionCoreErrorL10n on ApplicationCoreInput {
  String? errorL10n(BuildContext context) {
    if (isValid) {
      return null;
    } else {
      switch (error!) {
        case ApplicationCoreValidationError.toLong:
          return context.l10n.feature_application_identifier_error;
        case ApplicationCoreValidationError.invalid:
          return context.l10n.common_url_is_not_valid;
      }
    }
  }
}
