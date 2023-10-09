part of 'application_edit_cubit.dart';

enum ApplicationEditStatus { initial, loading, error, success }

@freezed
class ApplicationEditState with _$ApplicationEditState {
  const factory ApplicationEditState({
    @Default(ApplicationEditStatus.initial) ApplicationEditStatus status,
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
    ApplicationCoreInput? applicationCoreInput,
    Uint8List? androidGoogleServices,
    Uint8List? iosGoogleServices,
    String? androidGoogleServicesUrl,
    String? iosGoogleServicesUrl,
    Exception? exception,
  }) = ApplicationEditStateInitial;
}

extension ApplicationEditStateExtension on ApplicationEditState {
  get isAndroidGoogleServiceSelected => androidGoogleServices != null || androidGoogleServicesUrl != null;

  get isIosGoogleServiceSelected => iosGoogleServices != null || iosGoogleServicesUrl != null;
}
