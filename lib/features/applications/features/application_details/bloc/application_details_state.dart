part of 'application_details_cubit.dart';

enum ApplicationDetailsStateStatus {
  initial,
  progress,
  error,
  deleted,
  success,
  deployConfirm,
  deploySuccess,
}

@freezed
class ApplicationDetailsState with _$ApplicationDetailsState {
  const factory ApplicationDetailsState({
    required ApplicationDetailsStateStatus status,
    required ApplicationDeploy applicationDeploy,
    @Default([]) List<ThemeModel> themes,
    ThemeModel? deleteTheme,
    ApplicationModel? application,
    ApplicationModel? deleteApplication,
    Object? error,
  }) = ApplicationDetailsStateInitial;

  const ApplicationDetailsState._();
}

extension ThemeCollectionStateGetters on ApplicationDetailsState {
  bool get isProgress => status == ApplicationDetailsStateStatus.progress;

  bool get isGoogleServicesAvailable =>
      application?.googleServices?.iosUrl != null && application?.googleServices?.androidUrl != null;

  bool get isApplicationHasDefaultThem => application?.theme != null;
}
