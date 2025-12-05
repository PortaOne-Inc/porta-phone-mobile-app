part of 'application_create_cubit.dart';

enum ApplicationCreateStatus { initial, loading, error, success }

@freezed
sealed class ApplicationCreateState with _$ApplicationCreateState {
  const factory ApplicationCreateState({
    @Default(ApplicationCreateStatus.initial) ApplicationCreateStatus status,
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? androidPlatformIdInput,
    ApplicationIdentifierInput? iosPlatformIdInput,
    ApplicationBuildNameInput? androidBuildNameInput,
    ApplicationBuildNumberInput? androidBuildNumberInput,
    ApplicationBuildNameInput? iosBuildNameInput,
    ApplicationBuildNumberInput? iosBuildNumberInput,
    Exception? exception,
  }) = Initial;
}
