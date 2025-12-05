part of 'application_edit_cubit.dart';

enum ApplicationEditStatus { initial, loading, error, success, finish }

@freezed
sealed class ApplicationEditState with _$ApplicationEditState {
  const factory ApplicationEditState({
    @Default(ApplicationEditStatus.initial) ApplicationEditStatus status,
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? androidPlatformIdInput,
    ApplicationIdentifierInput? iosPlatformIdInput,
    ApplicationBuildNameInput? androidBuildNameInput,
    ApplicationBuildNumberInput? androidBuildNumberInput,
    ApplicationBuildNameInput? iosBuildNameInput,
    ApplicationBuildNumberInput? iosBuildNumberInput,
    Exception? exception,
  }) = ApplicationEditStateInitial;
}
