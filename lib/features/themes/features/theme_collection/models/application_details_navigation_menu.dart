import 'package:flutter/widgets.dart';

import 'package:webtrit_configurator/core/widgets/toolbars/toolbars.dart';
import 'package:webtrit_configurator/localization/localization.dart';

enum ApplicationDetailNavigate implements SubMenu {
  application,
  translations;

  @override
  String translate(BuildContext context) {
    switch (this) {
      case ApplicationDetailNavigate.application:
        return context.l10n.feature_application_Toolbar_edit_navigate_new;
      case ApplicationDetailNavigate.translations:
        return context
            .l10n
            .feature_application_Toolbar_edit_navigate_translations;
    }
  }
}
