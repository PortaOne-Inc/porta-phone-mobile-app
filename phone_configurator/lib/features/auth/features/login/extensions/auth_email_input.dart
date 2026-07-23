import 'package:flutter/material.dart';

import 'package:webtrit_configurator/localization/localization.dart';

import '../models/auth_email_input.dart';

extension AuthEmailInputErrorL10n on AuthEmailInput {
  String? errorL10n(BuildContext context) {
    if (isValid) {
      return null;
    } else {
      switch (error!) {
        case EmailValidationError.blank:
          return context.l10n.validationBlankError;
        case EmailValidationError.invalid:
          return context.l10n.feature_auth_Input_invalid_email_address;
      }
    }
  }
}
