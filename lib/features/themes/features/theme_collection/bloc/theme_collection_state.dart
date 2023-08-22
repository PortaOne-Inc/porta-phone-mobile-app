part of 'theme_collection_cubit.dart';

enum ThemeCollectionStateStatus {
  initial,
  progress,
  error,
  success,
}

@freezed
class ThemeCollectionState with _$ThemeCollectionState {
  const factory ThemeCollectionState({
    required ThemeCollectionStateStatus status,
    @Default([]) List<ThemeModel> themes,
    ApplicationModel? application,
    BaseException? error,
  }) = ThemeCollectionStateInitial;
}

extension ThemeCollectionStateGetters on ThemeCollectionState {
  bool get isProgress => status == ThemeCollectionStateStatus.progress;

  bool get isGoogleServicesAvailable =>
      application?.googleServices?.iosUrl != null && application?.googleServices?.androidUrl != null;

  bool get isApplicationHasDefaultThem => application?.theme != null;
}
// @freezed
// class ThemeCollectionState with _$ThemeCollectionState {
//   factory ThemeCollectionState({
//     @Default([]) List<ThemeModel> themes,
//   }) = _ThemeCollectionState;
//
//   factory ThemeCollectionState.progress({
//     @Default([]) List<ThemeModel> themes,
//   }) = ThemeCollectionStateProgress;
//
//   factory ThemeCollectionState.success({
//     @Default([]) List<ThemeModel> themes,
//   }) = ThemeCollectionStateSuccess;
//
//   factory ThemeCollectionState.error({
//     @Default([]) List<ThemeModel> themes,
//     BaseException? error,
//   }) = ThemeCollectionStateError;
//
//   factory ThemeCollectionState.navigateToEditTheme({
//     @Default([]) List<ThemeModel> themes,
//     ThemeModel? theme,
//     BaseException? error,
//   }) = ThemeCollectionNavigateToEditTheme;
// }
//

//
// extension _StateCopyWith on ThemeCollectionState {
//   ThemeCollectionState copyWithProgress({
//     List<ThemeModel>? themes,
//   }) {
//     return ThemeCollectionState.progress(
//       themes: themes ?? this.themes,
//     );
//   }
//
//   ThemeCollectionState copyWithNavigateToEditTheme({
//     List<ThemeModel>? themes,
//     ThemeModel? theme,
//   }) {
//     return ThemeCollectionState.navigateToEditTheme(
//       themes: themes ?? this.themes,
//       theme: theme,
//     );
//   }
//
//   ThemeCollectionState copyWithSuccess({
//     List<ThemeModel>? themes,
//   }) {
//     return ThemeCollectionState.success(
//       themes: themes ?? this.themes,
//     );
//   }
//
//   ThemeCollectionState copyWithError({
//     List<ThemeModel>? themes,
//     BaseException? error,
//   }) {
//     return ThemeCollectionState.error(
//       themes: themes ?? this.themes,
//       error: error,
//     );
//   }
// }
