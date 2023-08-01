import 'dart:async';

import 'package:webtrit_configurator/core/core.dart';

abstract class UsecaseApplicationEdit {
  FutureOr<ApplicationModel> execute({
    required ApplicationModel argument,
  });
}
