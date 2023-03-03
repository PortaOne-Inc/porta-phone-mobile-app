import 'dart:async';

import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseVendorCreate {
  FutureOr<ApplicationModel> execute({required ApplicationModel argument});
}
