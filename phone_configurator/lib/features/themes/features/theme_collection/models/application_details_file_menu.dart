import 'package:flutter/widgets.dart';

import 'package:webtrit_configurator/core/widgets/toolbars/toolbars.dart';
import 'package:webtrit_configurator/localization/localization.dart';

enum ApplicationDetailFile implements SubMenu {
  newApplication,
  editApplication,
  deleteApplication;

  @override
  String translate(BuildContext context) {
    switch (this) {
      case ApplicationDetailFile.newApplication:
        return context.l10n.feature_application_Toolbar_edit_file_new;
      case ApplicationDetailFile.editApplication:
        return context.l10n.feature_application_Toolbar_edit_file_edit;
      case ApplicationDetailFile.deleteApplication:
        return context.l10n.feature_application_Toolbar_edit_file_delete;
    }
  }
}
