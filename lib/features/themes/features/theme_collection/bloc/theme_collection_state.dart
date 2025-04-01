part of 'theme_collection_cubit.dart';

enum ThemeCollectionStateStatus {
  initial,
  progress,
  error,
  deleted,
  success,
}

@freezed
class ThemeCollectionState with _$ThemeCollectionState {
  const factory ThemeCollectionState({
    required ThemeCollectionStateStatus status,
    @Default([]) List<ThemeModel> themes,
    ThemeModel? deleteTheme,
    ApplicationModel? application,
    ApplicationModel? deleteApplication,
    Object? error,
  }) = ThemeCollectionInitial;

  const ThemeCollectionState._();

  bool get isProgress => status == ThemeCollectionStateStatus.progress;

  bool get isApplicationHasDefaultThem => application?.theme != null;

  ThemeCollectionState copyWithVersions({
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
