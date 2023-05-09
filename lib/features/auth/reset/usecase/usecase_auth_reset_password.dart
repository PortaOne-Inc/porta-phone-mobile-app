import 'dart:async';

abstract class UsecaseAuthResetPassword {
  FutureOr<void> execute({
    required String email,
  });
}
