import 'package:flutter/widgets.dart';

import 'package:formz/formz.dart';

import 'package:webtrit_configurator/localization/localization.dart';

import 'applications_consts.dart';

enum ApplicationIdentifierValidationError { toLong, toShort }

class ApplicationIdentifierInput
    extends FormzInput<String, ApplicationIdentifierValidationError> {
  const ApplicationIdentifierInput.pure([super.value = '']) : super.pure();

  const ApplicationIdentifierInput.dirty([super.value = '']) : super.dirty();

  ApplicationIdentifierInput toDirty() =>
      ApplicationIdentifierInput.dirty(value);

  @override
  ApplicationIdentifierValidationError? validator(String value) {
    if (value.isEmpty) {
      return null;
    } else if (value.length > ApplicationConsts.maxIdentifierLimit) {
      return ApplicationIdentifierValidationError.toLong;
    } else if (value.length < ApplicationConsts.minIdentifierLimit) {
      return ApplicationIdentifierValidationError.toShort;
    } else {
      return null;
    }
  }
}

extension ExtensionIdentifierErrorL10n on ApplicationIdentifierInput {
  String? errorL10n(BuildContext context) {
    if (isValid) {
      return null;
    } else {
      switch (error!) {
        case ApplicationIdentifierValidationError.toLong:
          return context.l10n.feature_application_identifier_error;
        case ApplicationIdentifierValidationError.toShort:
          return context.l10n.feature_application_identifier_error;
      }
    }
  }
}
