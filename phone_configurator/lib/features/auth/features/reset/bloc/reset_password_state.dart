part of 'reset_password_cubit.dart';

@freezed
sealed class ResetPasswordState with _$ResetPasswordState {
  factory ResetPasswordState({AuthEmailInput? emailInput}) =
      _ResetPasswordState;

  factory ResetPasswordState.progress({AuthEmailInput? emailInput}) =
      ResetPasswordStateProgress;

  factory ResetPasswordState.success({AuthEmailInput? emailInput}) =
      ResetPasswordStateSuccess;

  factory ResetPasswordState.validation({AuthEmailInput? emailInput}) =
      ResetPasswordStateValidation;

  factory ResetPasswordState.error({
    AuthEmailInput? emailInput,
    AuthException? error,
  }) = ResetPasswordStateError;
}

extension _StateCopyWith on ResetPasswordState {
  ResetPasswordState copyWithValidate({AuthEmailInput? emailInput}) {
    return ResetPasswordState.validation(
      emailInput: emailInput ?? this.emailInput,
    );
  }

  ResetPasswordState copyWithProgress({AuthEmailInput? emailInput}) {
    return ResetPasswordState.progress(
      emailInput: emailInput ?? this.emailInput,
    );
  }

  ResetPasswordState copyWithSuccess({AuthEmailInput? emailInput}) {
    return ResetPasswordState.success(
      emailInput: emailInput ?? this.emailInput,
    );
  }

  ResetPasswordState copyWithError({
    required AuthException failure,
    AuthEmailInput? emailInput,
  }) {
    return ResetPasswordState.error(
      emailInput: emailInput ?? this.emailInput,
      error: failure,
    );
  }
}
