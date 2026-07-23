part of 'login_cubit.dart';

@freezed
sealed class LoginState with _$LoginState {
  factory LoginState({
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
  }) = _AuthState;

  factory LoginState.progress({
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
  }) = AuthStateProgress;

  factory LoginState.success({
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
  }) = AuthStateSuccess;

  factory LoginState.validation({
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
  }) = AuthStateValidation;

  factory LoginState.error({
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
    AuthException? error,
  }) = AuthStateError;
}

extension _StateCopyWith on LoginState {
  LoginState copyWithValidate({
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
  }) {
    return LoginState.validation(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
    );
  }

  LoginState copyWithProgress({
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
  }) {
    return LoginState.progress(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
    );
  }

  LoginState copyWithSuccess({
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
  }) {
    return LoginState.success(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
    );
  }

  LoginState copyWithError({
    required AuthException failure,
    AuthEmailInput? emailInput,
    AuthPasswordInput? passwordInput,
  }) {
    return LoginState.error(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
      error: failure,
    );
  }
}
