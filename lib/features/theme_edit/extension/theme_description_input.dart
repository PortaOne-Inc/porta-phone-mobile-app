import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/config/l10n/l10n.dart';

import '../model/models.dart';

extension ThemeDescriptionInputErrorL10n on ThemeDescriptionInput {
  String? errorL10n(BuildContext context) {
    if (!invalid) {
      return null;
    } else {
      switch (error!) {
        case ThemeDescriptionValidationError.blank:
          return context.l10n.validationBlankError;
        case ThemeDescriptionValidationError.toLong:
          return context.l10n.common_validation_description_to_long;
        case ThemeDescriptionValidationError.toShort:
          return context.l10n.common_validation_description_to_short;
      }
    }
  }
}
