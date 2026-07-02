import 'common/base_exception.dart';

enum AuthStateEnum { invalidCredentials, another }

class AuthException extends BaseException {
  AuthException({required this.state, required super.message});

  /// Neutral credentials failure.
  ///
  /// Intentionally does not distinguish "wrong password" from "no such user" —
  /// revealing which one is wrong leaks account existence.
  AuthException.invalidCredentials({
    this.state = AuthStateEnum.invalidCredentials,
    super.message = 'Invalid credentials',
  });

  AuthException.another({required super.message, this.state = AuthStateEnum.another});

  final AuthStateEnum state;
}
