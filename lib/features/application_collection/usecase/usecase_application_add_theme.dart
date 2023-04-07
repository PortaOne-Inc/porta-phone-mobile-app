import 'dart:async';

import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseApplicationAddTheme {
  FutureOr<void> execute({required String applicationID, required ThemeModel themeModel});
}
