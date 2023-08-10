import 'dart:async';

import 'package:webtrit_configurator/core/core.dart';

abstract class UsecaseApplicationGetAll {
  FutureOr<List<ApplicationModel>> execute({void argument});
}
