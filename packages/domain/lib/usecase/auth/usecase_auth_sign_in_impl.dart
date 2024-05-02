import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../repository/repository.dart';

import 'usecase_auth_sign_in.dart';

@Injectable(as: UsecaseAuthSignIn)
class UsecaseAuthSignInImpl extends UsecaseAuthSignIn {
  UsecaseAuthSignInImpl({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  FutureOr<void> execute({
    required String email,
    required String password,
  }) {
    return authRepository.login(email, password);
  }
}
