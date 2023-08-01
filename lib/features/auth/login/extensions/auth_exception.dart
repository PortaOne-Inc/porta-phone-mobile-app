import 'package:flutter/material.dart';

import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/share/exception/auth_exception.dart';

extension AuthExceptionMessageL10n on AuthException {
  String errorL10n(BuildContext context) {
    switch (state) {
      case AuthState.userNotFount:
        return context.l10n.feature_authorization_exception_user_not_fount;
      case AuthState.wrongPassword:
        return context.l10n.feature_authorization_exception_wrong_password;
      case AuthState.another:
        return message;
    }
  }
}
