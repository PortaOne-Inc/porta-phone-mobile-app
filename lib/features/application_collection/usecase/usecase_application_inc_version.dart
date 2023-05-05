import 'dart:async';

import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseApplicationIncVersion {
  FutureOr<ApplicationModel> execute({required String applicationId});
}
