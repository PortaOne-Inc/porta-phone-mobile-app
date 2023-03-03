import 'dart:async';

import 'package:webtrit_configurator/share/entity/models/models.dart';

abstract class UsecaseUserGet {
  Future<UserModel> execute();
}
