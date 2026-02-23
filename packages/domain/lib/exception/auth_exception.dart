import 'common/base_exception.dart';

enum AuthStateEnum { userNotFount, wrongPassword, another }

class AuthException extends BaseException {
  AuthException({required this.state, required super.message});

  AuthException.noUser({
    this.state = AuthStateEnum.userNotFount,
    super.message = 'User not fount',
  });

  AuthException.wrongPassword({
    this.state = AuthStateEnum.wrongPassword,
    super.message = 'Wrong password',
  });

  AuthException.another({
    required super.message,
    this.state = AuthStateEnum.another,
  });

  final AuthStateEnum state;
}
