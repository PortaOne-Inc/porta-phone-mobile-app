part of 'application_create_cubit.dart';

enum ApplicationCreateStatus { initial, loading, error, success }

@freezed
class ApplicationCreateState with _$ApplicationCreateState {
  const factory ApplicationCreateState({
    @Default(ApplicationCreateStatus.initial) ApplicationCreateStatus status,
    ApplicationNameInput? nameInput,
    @Deprecated('will be removed, use android/ios instead') ApplicationIdentifierInput? applicationIdentifierInput,
    ApplicationIdentifierInput? androidPlatformIdInput,
    ApplicationIdentifierInput? iosPlatformIdInput,
    ApplicationTermsConditionsInput? applicationTermsConditionsInput,
    ApplicationCoreInput? applicationCoreInput,
    Uint8List? androidGoogleServices,
    Uint8List? iosGoogleServices,
    Exception? exception,
  }) = Initial;
}
