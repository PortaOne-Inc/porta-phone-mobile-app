import 'dart:async';

import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseThemeGetTemplate {
  FutureOr<AppConfigurationModel> execute({
    final String? primaryColor,
    final String? themeName,
  });
}
