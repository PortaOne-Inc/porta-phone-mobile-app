part of 'application_create_cubit.dart';

enum ApplicationCreateStatus { initial, loading, error, success }

@freezed
class ApplicationCreateState with _$ApplicationCreateState {
  const factory ApplicationCreateState({
    @Default(ApplicationCreateStatus.initial) ApplicationCreateStatus status,
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
    ApplicationCoreInput? applicationCoreInput,
    Uint8List? androidGoogleServices,
    Uint8List? iosGoogleServices,
    Exception? exception,
  }) = Initial;
}
