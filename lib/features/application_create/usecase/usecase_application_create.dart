import 'dart:async';

import 'package:webtrit_configurator/core/core.dart';

abstract class UsecaseApplicationCreate {
  FutureOr<ApplicationModel> execute({required ApplicationModel argument});
}
