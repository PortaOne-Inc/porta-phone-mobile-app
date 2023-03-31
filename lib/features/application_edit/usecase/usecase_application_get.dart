import 'dart:async';

import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseApplicationGet {
  FutureOr<ApplicationModel> execute({
    required String id,
  });
}
