import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/core/core.dart';

import 'usecase_auth_is_logged_in.dart';

@Injectable(as: UsecaseAuthIsLoggedIn)
class UsecaseAuthIsLoggedInImpl extends UsecaseAuthIsLoggedIn {
  UsecaseAuthIsLoggedInImpl({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  FutureOr<bool> execute({void argument}) {
    return authRepository.isUserAuthorized();
  }
}
