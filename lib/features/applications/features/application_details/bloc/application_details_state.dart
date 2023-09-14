part of 'application_details_cubit.dart';

enum ApplicationDetailsStateStatus {
  initial,
  progress,
  error,
  success,
}

@freezed
class ApplicationDetailsState with _$ApplicationDetailsState {
  const factory ApplicationDetailsState({
    required ApplicationDetailsStateStatus status,
    @Default([]) List<ThemeModel> themes,
    ApplicationModel? application,
    BaseException? error,
  }) = ApplicationDetailsStateInitial;
}

extension ThemeCollectionStateGetters on ApplicationDetailsState {
  bool get isProgress => status == ApplicationDetailsStateStatus.progress;

  bool get isGoogleServicesAvailable =>
      application?.googleServices?.iosUrl != null && application?.googleServices?.androidUrl != null;

  bool get isApplicationHasDefaultThem => application?.theme != null;
}
