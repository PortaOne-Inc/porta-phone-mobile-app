import 'dart:async';

import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseThemeDeleteCreate {
  Future<void> execute({
    required String applicationId,
    required String themeId,
  });
}
