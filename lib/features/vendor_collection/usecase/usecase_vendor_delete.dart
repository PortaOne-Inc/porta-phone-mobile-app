import 'dart:async';

import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseVendorDeleteTemplate {
  FutureOr<void> execute({required ApplicationModel model});
}
