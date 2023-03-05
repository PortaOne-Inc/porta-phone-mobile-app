import 'dart:async';

import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseThemeGetTemplate {
  FutureOr<ThemeModel> execute({final int? primaryColor, final String? themeName});
}
