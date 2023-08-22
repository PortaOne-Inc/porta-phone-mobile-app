import 'dart:async';

import 'package:webtrit_configurator/core/core.dart';

abstract class UseCaseSetThemeDefault {
  Future<ApplicationModel> execute({
    required String applicationId,
    required String themeId,
  });
}
