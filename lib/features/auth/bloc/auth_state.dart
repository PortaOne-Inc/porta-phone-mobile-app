part of 'auth_cubit.dart';

@immutable
class AuthState {
  const AuthState(this.emailError, this.passwordError);

  final AuthEmailInput emailError;
  final AuthPasswordInput passwordError;

  AuthState copyWith({
    final AuthEmailInput? emailError,
    final AuthPasswordInput? passwordError,
  }) {
    return AuthState(
      emailError ?? this.emailError,
      passwordError ?? this.passwordError,
    );
  }
}

class AuthInit extends AuthState {
  const AuthInit() : super(const AuthEmailInput.dirty(), const AuthPasswordInput.dirty());
}

class AuthProgress extends AuthState {
  const AuthProgress() : super(const AuthEmailInput.pure(), const AuthPasswordInput.pure());
}

class AuthLoginSuccess extends AuthState {
  const AuthLoginSuccess() : super(const AuthEmailInput.pure(), const AuthPasswordInput.pure());
}

class AuthNotCaughtFailure extends AuthState {
  const AuthNotCaughtFailure(this.message) : super(const AuthEmailInput.pure(), const AuthPasswordInput.pure());
  final String message;
}

class AuthLoginUserNotFoundFailure extends AuthState {
  const AuthLoginUserNotFoundFailure() : super(const AuthEmailInput.pure(), const AuthPasswordInput.pure());
}

class AuthLoginUserWrongPasswordFailure extends AuthState {
  const AuthLoginUserWrongPasswordFailure() : super(const AuthEmailInput.pure(), const AuthPasswordInput.pure());
}

class AuthFailure extends AuthState {
  const AuthFailure(AuthEmailInput email, AuthPasswordInput password) : super(email, password);
}
