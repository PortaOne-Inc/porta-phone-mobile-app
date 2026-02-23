import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../repository/repository.dart';

abstract class SignInAuthUsecase {
  Future<void> execute({required String email, required String password});
}

@Injectable(as: SignInAuthUsecase)
class SignInAuthUsecaseHandler extends SignInAuthUsecase {
  SignInAuthUsecaseHandler({required this.authRepository});

  final AuthRepository authRepository;

  @override
  Future<void> execute({required String email, required String password}) {
    return authRepository.login(email, password);
  }
}
