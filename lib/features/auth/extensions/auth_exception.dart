import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/localization/localization.dart';

extension AuthExceptionMessageL10n on AuthException {
  String errorL10n(BuildContext context) {
    switch (state) {
      case AuthStateEnum.invalidCredentials:
        return context.l10n.feature_authorization_exception_invalid_credentials;
      case AuthStateEnum.another:
        return message;
    }
  }
}
