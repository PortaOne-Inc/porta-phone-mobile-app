import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_auth_sign_in.dart';

@Injectable(as: UsecaseAuthSignIn)
class UsecaseAuthSignInImpl extends UsecaseAuthSignIn {
  UsecaseAuthSignInImpl({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  FutureOr execute({
    required String email,
    required String password,
  }) {
    return authRepository.login(email, password);
  }
}
