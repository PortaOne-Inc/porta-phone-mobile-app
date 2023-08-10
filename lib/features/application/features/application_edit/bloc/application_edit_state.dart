part of 'application_edit_cubit.dart';

@freezed
class ApplicationEditState with _$ApplicationEditState {
  ApplicationEditState._();

  factory ApplicationEditState({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) = _ApplicationEditState;

  factory ApplicationEditState.progress({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) = ApplicationEditStateProgress;

  factory ApplicationEditState.init({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) = ApplicationEditStateInit;

  factory ApplicationEditState.success({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) = ApplicationEditStateSuccess;

  factory ApplicationEditState.validation({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) = ApplicationEditStateValidation;

  factory ApplicationEditState.error({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
    Exception? exception,
  }) = ApplicationEditStateError;
}

extension _StateCopyWith on ApplicationEditState {
  ApplicationEditState copyWithValidation({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) {
    return ApplicationEditState.validation(
      nameInput: nameInput ?? this.nameInput,
      applicationIdentifierInput: applicationIdentifierInput ?? this.applicationIdentifierInput,
    );
  }

  ApplicationEditState copyWithProgress({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) {
    return ApplicationEditState.progress(
      nameInput: nameInput ?? this.nameInput,
      applicationIdentifierInput: applicationIdentifierInput ?? this.applicationIdentifierInput,
    );
  }

  ApplicationEditState copyWithSuccess({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) {
    return ApplicationEditState.success(
      nameInput: nameInput ?? this.nameInput,
      applicationIdentifierInput: applicationIdentifierInput ?? this.applicationIdentifierInput,
    );
  }

  ApplicationEditState copyWithError({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
    BaseException? exception,
  }) {
    return ApplicationEditState.error(
        nameInput: nameInput ?? this.nameInput,
        applicationIdentifierInput: applicationIdentifierInput ?? this.applicationIdentifierInput,
        exception: exception);
  }
}
