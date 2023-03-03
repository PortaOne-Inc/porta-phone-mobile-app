import 'dart:async';

import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseVendorGetAll {
  FutureOr<List<ApplicationModel>> execute({void argument});
}
