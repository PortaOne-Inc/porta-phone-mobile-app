import 'dart:async';

import 'package:webtrit_configurator/core/core.dart';

abstract class UsecaseApplicationIncVersion {
  FutureOr<ApplicationModel> execute({
    required String applicationId,
  });
}
