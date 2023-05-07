import 'dart:async';

import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseApplicationDeleteTemplate {
  FutureOr<void> execute({required String applicationId});
}
