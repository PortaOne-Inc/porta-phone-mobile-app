part of 'application_details_cubit.dart';

enum ApplicationDetailsStateStatus {
  initial,
  progress,
  error,
  deleted,
  success,
}

@freezed
sealed class ApplicationDetailsState with _$ApplicationDetailsState {
  const factory ApplicationDetailsState({
    required ApplicationDetailsStateStatus status,
    @Default([]) List<ThemeModel> themes,
    ThemeModel? deleteTheme,
    ApplicationModel? application,
    ApplicationModel? deleteApplication,
    Object? error,
  }) = ApplicationDetailsStateInitial;

  const ApplicationDetailsState._();

  bool get isProgress => status == ApplicationDetailsStateStatus.progress;

  bool get isApplicationHasDefaultThem => application?.theme != null;
}
