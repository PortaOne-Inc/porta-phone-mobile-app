part of 'application_create_cubit.dart';

@freezed
class ApplicationCreateState with _$ApplicationCreateState {
  ApplicationCreateState._();

  factory ApplicationCreateState({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) = _ApplicationCreateState;

  factory ApplicationCreateState.progress({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) = ApplicationCreateStateProgress;

  factory ApplicationCreateState.success({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) = ApplicationCreateStateSuccess;

  factory ApplicationCreateState.validation({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) = ApplicationCreateStateValidation;

  factory ApplicationCreateState.error({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
    Exception? exception,
  }) = ApplicationCreateStateError;
}

extension _StateCopyWith on ApplicationCreateState {
  ApplicationCreateState copyWithValidation({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) {
    return ApplicationCreateState.validation(
      nameInput: nameInput ?? this.nameInput,
      applicationIdentifierInput: applicationIdentifierInput ?? this.applicationIdentifierInput,
    );
  }

  ApplicationCreateState copyWithProgress({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) {
    return ApplicationCreateState.progress(
      nameInput: nameInput ?? this.nameInput,
      applicationIdentifierInput: applicationIdentifierInput ?? this.applicationIdentifierInput,
    );
  }

  ApplicationCreateState copyWithSuccess({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) {
    return ApplicationCreateState.success(
      nameInput: nameInput ?? this.nameInput,
      applicationIdentifierInput: applicationIdentifierInput ?? this.applicationIdentifierInput,
    );
  }

  ApplicationCreateState copyWithError({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
    BaseException? exception,
  }) {
    return ApplicationCreateState.error(
        nameInput: nameInput ?? this.nameInput,
        applicationIdentifierInput: applicationIdentifierInput ?? this.applicationIdentifierInput,
        exception: exception);
  }
}
