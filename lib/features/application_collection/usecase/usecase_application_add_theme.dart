import 'dart:async';

import 'package:webtrit_configurator/core/core.dart';

abstract class UsecaseApplicationAddTheme {
  FutureOr<void> execute({required String applicationID, required ThemeModel themeModel});
}
