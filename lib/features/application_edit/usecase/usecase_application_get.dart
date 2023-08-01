import 'dart:async';

import 'package:webtrit_configurator/core/core.dart';

abstract class UsecaseApplicationGet {
  FutureOr<ApplicationModel> execute({
    required String id,
  });
}
