import 'dart:async';

import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseApplicationCreate {
  FutureOr<ApplicationModel> execute({required ApplicationModel argument});
}
