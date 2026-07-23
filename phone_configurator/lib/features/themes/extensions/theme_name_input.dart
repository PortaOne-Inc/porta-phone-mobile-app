import 'package:flutter/material.dart';

import 'package:webtrit_configurator/localization/localization.dart';

import '../models/theme_name_input.dart';

extension ThemeNameInputErrorL10n on ThemeNameInput {
  String? errorL10n(BuildContext context) {
    if (isValid) {
      return null;
    } else {
      switch (error!) {
        case ThemeNameValidationError.blank:
          return context.l10n.validationBlankError;
        case ThemeNameValidationError.toLong:
          return context.l10n.feature_theme_edit_Validation_to_long;
        case ThemeNameValidationError.toShort:
          return context.l10n.feature_theme_edit_Validation_to_short;
      }
    }
  }
}
