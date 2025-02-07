part of 'application_details_cubit.dart';

enum ApplicationDetailsStateStatus {
  initial,
  progress,
  error,
  deleted,
  success,
}

@freezed
class ApplicationDetailsState with _$ApplicationDetailsState {
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

  ApplicationDetailsState copyWithVersions({
    BuildVersionModel? android,
    BuildVersionModel? ios,
  }) {
    return copyWith(
      application: application?.copyWith(
        androidVersion: android ?? application?.androidVersion,
        iosVersion: ios ?? application?.iosVersion,
      ),
    );
  }
}
