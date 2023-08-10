part of 'application_edit_cubit.dart';

enum ApplicationEditStatus { initial, loading, error, success }

@freezed
class ApplicationEditState with _$ApplicationEditState {
  const factory ApplicationEditState({
    @Default(ApplicationEditStatus.initial) ApplicationEditStatus status,
    ApplicationModel? applicationModel,
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
    Uint8List? androidGoogleServices,
    Uint8List? iosGoogleServices,
    Exception? exception,
  }) = ApplicationEditStateInitial;
}

extension ApplicationEditStateExtension on ApplicationEditState {
  get isAndroidGoogleServiceSelected =>
      androidGoogleServices != null || applicationModel?.googleServices?.androidUrl != null;

  get isIosGoogleServiceSelected => androidGoogleServices != null || applicationModel?.googleServices?.iosUrl != null;
}
