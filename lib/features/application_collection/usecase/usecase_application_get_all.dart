import 'dart:async';

import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseApplicationGetAll {
  FutureOr<List<ApplicationModel>> execute({void argument});
}
