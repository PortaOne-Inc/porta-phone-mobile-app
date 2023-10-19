import 'package:flutter/widgets.dart';

import 'package:webtrit_configurator/core/widgets/toolbars/toolbars.dart';
import 'package:webtrit_configurator/localization/l10n/l10n.dart';

enum ApplicationDetailNavigate implements SubMenu {
  application;

  @override
  String translate(BuildContext context) {
    switch (this) {
      case ApplicationDetailNavigate.application:
        return context.l10n.feature_application_Toolbar_edit_navigate_new;
    }
  }
}
