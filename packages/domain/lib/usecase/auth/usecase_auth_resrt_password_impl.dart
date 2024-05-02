import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../repository/repository.dart';
import 'usecase_auth_reset_password.dart';

@Injectable(as: UsecaseAuthResetPassword)
class UsecaseAuthResetPasswordImpl extends UsecaseAuthResetPassword {
  UsecaseAuthResetPasswordImpl({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  FutureOr<void> execute({
    required String email,
  }) {
    return authRepository.reset(email);
  }
}
