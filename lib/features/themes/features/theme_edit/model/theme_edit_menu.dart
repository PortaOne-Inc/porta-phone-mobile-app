import 'package:flutter/widgets.dart';

import 'package:webtrit_configurator/core/widgets/toolbars/toolbars.dart';

enum ApplicationEditFile implements SubMenu {
  save,
  download;

  @override
  String translate(BuildContext context) {
    switch (this) {
      case ApplicationEditFile.save:
        return 'Save';
      case ApplicationEditFile.download:
        return 'Download';
    }
  }
}

enum ApplicationEditTheme implements SubMenu {
  preview,
  templates;

  @override
  String translate(BuildContext context) {
    switch (this) {
      case ApplicationEditTheme.templates:
        return 'Templates';
      case ApplicationEditTheme.preview:
        return 'Preview';
    }
  }
}
