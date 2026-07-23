import 'package:flutter/widgets.dart';

import 'package:webtrit_configurator/core/widgets/toolbars/toolbars.dart';

enum ApplicationEditFile implements SubMenu {
  save;

  @override
  String translate(BuildContext context) {
    switch (this) {
      case ApplicationEditFile.save:
        return 'Save';
    }
  }
}

enum ApplicationEditTheme implements SubMenu {
  preview;

  @override
  String translate(BuildContext context) {
    switch (this) {
      case ApplicationEditTheme.preview:
        return 'Preview';
    }
  }
}
