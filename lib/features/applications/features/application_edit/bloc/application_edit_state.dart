part of 'application_edit_cubit.dart';

enum ApplicationEditStatus { initial, loading, error, success }

@freezed
class ApplicationEditState with _$ApplicationEditState {
  const factory ApplicationEditState({
    @Default(ApplicationEditStatus.initial) ApplicationEditStatus status,
    ApplicationNameInput? nameInput,
    @Deprecated('will be removed, use android/ios instead') ApplicationIdentifierInput? applicationIdentifierInput,
    ApplicationIdentifierInput? androidPlatformIdInput,
    ApplicationIdentifierInput? iosPlatformIdInput,
    ApplicationTermsConditionsInput? applicationTermsConditionsInput,
    ApplicationCoreInput? applicationCoreInput,
    ApplicationBuildNameInput? androidBuildNameInput,
    ApplicationBuildNumberInput? androidBuildNumberInput,
    ApplicationBuildNameInput? iosBuildNameInput,
    ApplicationBuildNumberInput? iosBuildNumberInput,
    Exception? exception,
  }) = ApplicationEditStateInitial;
}

