part of 'application_create_cubit.dart';

enum ApplicationCreateStatus { initial, loading, error, success }

@freezed
class ApplicationCreateState with _$ApplicationCreateState {
  const factory ApplicationCreateState({
    @Default(ApplicationCreateStatus.initial) ApplicationCreateStatus status,
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? androidPlatformIdInput,
    ApplicationIdentifierInput? iosPlatformIdInput,
    ApplicationTermsConditionsInput? applicationTermsConditionsInput,
    ApplicationCoreInput? applicationCoreInput,
    ApplicationBuildNameInput? androidBuildNameInput,
    ApplicationBuildNumberInput? androidBuildNumberInput,
    ApplicationBuildNameInput? iosBuildNameInput,
    ApplicationBuildNumberInput? iosBuildNumberInput,
    Uint8List? androidGoogleServices,
    Uint8List? iosGoogleServices,
    Exception? exception,
  }) = Initial;
}
