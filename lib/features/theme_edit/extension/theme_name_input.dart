import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/config/l10n/l10n.dart';

import '../model/theme_name_input.dart';

extension ThemeNameInputErrorL10n on ThemeNameInput {
  String? errorL10n(BuildContext context) {
    if (!invalid) {
      return null;
    } else {
      switch (error!) {
        case ThemeNameValidationError.blank:
          return context.l10n.validationBlankError;
        case ThemeNameValidationError.toLong:
          return context.l10n.common_validation_description_to_long;
        case ThemeNameValidationError.toShort:
          return context.l10n.common_validation_description_to_short;
      }
    }
  }
}
