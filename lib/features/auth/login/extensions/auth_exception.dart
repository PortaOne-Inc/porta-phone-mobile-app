import 'package:flutter/material.dart';

import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

extension AuthExceptionMessageL10n on AuthException {
  String errorL10n(BuildContext context) {
    switch (state) {
      case AuthStateEnum.userNotFount:
        return context.l10n.feature_authorization_exception_user_not_fount;
      case AuthStateEnum.wrongPassword:
        return context.l10n.feature_authorization_exception_wrong_password;
      case AuthStateEnum.another:
        return message;
    }
  }
}
