import 'dart:async';

import 'package:webtrit_configurator/core/core.dart';

abstract class UsecaseThemeGetAll {
  FutureOr<List<ThemeModel>> execute({
    required String applicationId,
    int? countThemes,
  });
}
