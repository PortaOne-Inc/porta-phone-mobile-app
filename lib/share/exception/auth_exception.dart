import 'common/base_exception.dart';

enum AuthState {
  userNotFount,
  wrongPassword,
  another,
}

class AuthException extends BaseException {
  final AuthState state;

  AuthException({
    required this.state,
    required super.message,
  });

  AuthException.noUser({
    this.state = AuthState.userNotFount,
    super.message = 'User not fount',
  });

  AuthException.wrongPassword({
    this.state = AuthState.wrongPassword,
    super.message = 'Wrong password',
  });

  AuthException.another({
    this.state = AuthState.another,
    required super.message,
  });
}
