import 'dart:async';

import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseThemeGetAll {
  FutureOr<List<AppConfigurationModel>> execute({
    required String applicationId,
    int? countThemes,
  });
}
