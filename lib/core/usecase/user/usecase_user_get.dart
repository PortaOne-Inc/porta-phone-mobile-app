import 'dart:async';

import 'package:webtrit_configurator/core/core.dart';

abstract class UsecaseUserGet {
  Future<UserModel> execute();
}
