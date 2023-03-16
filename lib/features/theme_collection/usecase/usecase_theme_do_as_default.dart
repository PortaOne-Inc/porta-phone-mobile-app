import 'dart:async';

import 'package:webtrit_configurator/share/share.dart';

abstract class SetThemeForApplicationUseCase {
  FutureOr<void> execute({
    required String applicationID,
    required AppConfigurationModel themeModel,
  });
}
