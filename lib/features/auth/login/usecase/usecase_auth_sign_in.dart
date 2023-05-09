import 'dart:async';

abstract class UsecaseAuthSignIn {
  FutureOr<void> execute({
    required String email,
    required String password,
  });
}
