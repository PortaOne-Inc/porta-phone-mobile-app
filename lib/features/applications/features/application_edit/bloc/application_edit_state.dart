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
    Uint8List? androidGoogleServices,
    Uint8List? iosGoogleServices,
    String? androidGoogleServicesUrl,
    String? iosGoogleServicesUrl,
    Exception? exception,
  }) = ApplicationEditStateInitial;
}

extension ApplicationEditStateExtension on ApplicationEditState {
  bool get isAndroidGoogleServiceSelected => androidGoogleServices != null || androidGoogleServicesUrl != null;

  bool get isIosGoogleServiceSelected => iosGoogleServices != null || iosGoogleServicesUrl != null;
}
