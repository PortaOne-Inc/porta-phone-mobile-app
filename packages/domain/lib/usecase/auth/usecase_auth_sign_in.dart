import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../repository/repository.dart';

abstract class UsecaseAuthSignIn {
  Future<void> execute({
    required String email,
    required String password,
  });
}

@Injectable(as: UsecaseAuthSignIn)
class UsecaseAuthSignInImpl extends UsecaseAuthSignIn {
  UsecaseAuthSignInImpl({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<void> execute({
    required String email,
    required String password,
  }) {
    return authRepository.login(email, password);
  }
}
