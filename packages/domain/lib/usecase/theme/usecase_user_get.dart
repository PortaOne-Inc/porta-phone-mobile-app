import 'dart:async';

import 'package:domain/domain.dart';

abstract class UsecaseUserGet {
  Future<UserModel> execute();
}
