part of 'theme_collection_cubit.dart';

@freezed
class ThemeCollectionState with _$ThemeCollectionState {
  factory ThemeCollectionState({
    @Default([]) List<ThemeModel> themes,
  }) = _ThemeCollectionState;

  factory ThemeCollectionState.progress({
    @Default([]) List<ThemeModel> themes,
  }) = ThemeCollectionStateProgress;

  factory ThemeCollectionState.success({
    @Default([]) List<ThemeModel> themes,
  }) = ThemeCollectionStateSuccess;

  factory ThemeCollectionState.error({
    @Default([]) List<ThemeModel> themes,
    BaseException? error,
  }) = ThemeCollectionStateError;

  factory ThemeCollectionState.navigateToEditTheme({
    @Default([]) List<ThemeModel> themes,
    ThemeModel? theme,
    BaseException? error,
  }) = ThemeCollectionNavigateToEditTheme;
}

extension ThemeCollectionStateGetters on ThemeCollectionState {
  bool get isProgress => this is ThemeCollectionStateProgress;
}

extension _StateCopyWith on ThemeCollectionState {
  ThemeCollectionState copyWithProgress({
    List<ThemeModel>? themes,
  }) {
    return ThemeCollectionState.progress(
      themes: themes ?? this.themes,
    );
  }

  ThemeCollectionState copyWithNavigateToEditTheme({
    List<ThemeModel>? themes,
    ThemeModel? theme,
  }) {
    return ThemeCollectionState.navigateToEditTheme(
      themes: themes ?? this.themes,
      theme: theme,
    );
  }

  ThemeCollectionState copyWithSuccess({
    List<ThemeModel>? themes,
  }) {
    return ThemeCollectionState.success(
      themes: themes ?? this.themes,
    );
  }

  ThemeCollectionState copyWithError({
    List<ThemeModel>? themes,
    BaseException? error,
  }) {
    return ThemeCollectionState.error(
      themes: themes ?? this.themes,
      error: error,
    );
  }
}
