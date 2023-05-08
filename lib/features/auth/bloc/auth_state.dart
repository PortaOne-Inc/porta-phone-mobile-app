part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
  }) = _AuthState;

  factory AuthState.progress({
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
  }) = AuthStateProgress;

  factory AuthState.success({
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
  }) = AuthStateSuccess;

  factory AuthState.validation({
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
  }) = AuthStateValidation;

  factory AuthState.error({
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
    AuthException? error,
  }) = AuthStateError;
}

extension _StateCopyWith on AuthState {
  AuthState copyWithValidate({
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
  }) {
    return AuthState.validation(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
    );
  }

  AuthState copyWithProgress({
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
  }) {
    return AuthState.progress(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
    );
  }

  AuthState copyWithSuccess({
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
  }) {
    return AuthState.success(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
    );
  }

  AuthState copyWithError({
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
    required AuthException failure,
  }) {
    return AuthState.error(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
      error: failure,
    );
  }
}
