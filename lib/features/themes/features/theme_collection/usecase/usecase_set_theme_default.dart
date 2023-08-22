import 'dart:async';

import 'package:webtrit_configurator/core/core.dart';

abstract class UseCaseSetThemeDefault {
  FutureOr<ApplicationModel> execute({
    required String applicationId,
    required String themeId,
  });
}
