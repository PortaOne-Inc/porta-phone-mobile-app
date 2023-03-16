import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/config/l10n/l10n.dart';

import '../model/application_name_input.dart';

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
