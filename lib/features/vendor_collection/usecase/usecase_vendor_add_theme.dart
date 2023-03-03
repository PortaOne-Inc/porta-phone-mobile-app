import 'dart:async';

import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseVendorAddTheme {
  FutureOr<void> execute({required String applicationID, required ThemeModel themeModel});
}
