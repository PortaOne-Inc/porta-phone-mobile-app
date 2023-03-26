import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_auth_log_out.dart';

@Injectable(as: UsecaseAuthLogOut)
class UsecaseAuthLogOutImpl extends UsecaseAuthLogOut {
  final AuthRepository authRepository;

  UsecaseAuthLogOutImpl({
    required this.authRepository,
  });

  @override
  FutureOr execute() {
    return authRepository.logout();
  }
}
