import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/config/l10n/l10n.dart';

import '../model/models.dart';

extension ExtensionValidationDescriptionErrorL10n on ApplicationDescriptionInput {
  String? errorL10n(BuildContext context) {
    if (!invalid) {
      return null;
    } else {
      switch (error!) {
        case ApplicationDescriptionValidationError.blank:
          return context.l10n.validationBlankError;
        case ApplicationDescriptionValidationError.toLong:
          return context.l10n.common_validation_description_to_long;
        case ApplicationDescriptionValidationError.toShort:
          return context.l10n.common_validation_description_to_short;
      }
    }
  }
}
