import 'dart:async';

import 'package:webtrit_configurator/core/core.dart';

abstract class UsecaseThemeGetTemplate {
  FutureOr<ThemeModel> execute({
    final String? primaryColor,
    final String? themeName,
  });
}
