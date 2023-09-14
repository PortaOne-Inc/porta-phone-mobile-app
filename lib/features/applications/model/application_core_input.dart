import 'package:flutter/widgets.dart';

import 'package:formz/formz.dart';

import 'package:webtrit_configurator/localization/localization.dart';

import 'applications_consts.dart';

enum ApplicationCoreValidationError {
  blank,
  toLong,
  toShort,
}

class ApplicationCoreInput extends FormzInput<String, ApplicationCoreValidationError> {
  const ApplicationCoreInput.pure([String value = '']) : super.pure(value);

  const ApplicationCoreInput.dirty([String value = '']) : super.dirty(value);

  ApplicationCoreInput toDirty() => ApplicationCoreInput.dirty(value);

  @override
  ApplicationCoreValidationError? validator(String value) {
    if (value.isEmpty) {
      return ApplicationCoreValidationError.blank;
    } else if (value.length > ApplicationConsts.maxCoreLimit) {
      return ApplicationCoreValidationError.toLong;
    } else if (value.length < ApplicationConsts.minIdentifierLimit) {
      return ApplicationCoreValidationError.toShort;
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
        case ApplicationCoreValidationError.blank:
          return context.l10n.feature_application_identifier_error;
        case ApplicationCoreValidationError.toLong:
          return context.l10n.feature_application_identifier_error;
        case ApplicationCoreValidationError.toShort:
          return context.l10n.feature_application_identifier_error;
      }
    }
  }
}
