part of 'theme_collection_cubit.dart';

@freezed
class ThemeCollectionState with _$ThemeCollectionState {
  factory ThemeCollectionState({
    @Default([]) List<AppConfigurationModel> themes,
  }) = _ThemeCollectionState;

  factory ThemeCollectionState.progress({
    @Default([]) List<AppConfigurationModel> themes,
  }) = ThemeCollectionStateProgress;

  factory ThemeCollectionState.success({
    @Default([]) List<AppConfigurationModel> themes,
  }) = ThemeCollectionStateSuccess;

  factory ThemeCollectionState.error({
    @Default([]) List<AppConfigurationModel> themes,
    BaseException? error,
  }) = ThemeCollectionStateError;

  factory ThemeCollectionState.navigateToEditTheme({
    @Default([]) List<AppConfigurationModel> themes,
    AppConfigurationModel? theme,
    BaseException? error,
  }) = ThemeCollectionNavigateToEditTheme;
}

extension ThemeCollectionStateGetters on ThemeCollectionState {
  bool get isProgress => this is ThemeCollectionStateProgress;
}

extension _StateCopyWith on ThemeCollectionState {
  ThemeCollectionState copyWithProgress({
    List<AppConfigurationModel>? themes,
  }) {
    return ThemeCollectionState.progress(
      themes: themes ?? this.themes,
    );
  }

  ThemeCollectionState copyWithNavigateToEditTheme({
    List<AppConfigurationModel>? themes,
    AppConfigurationModel? theme,
  }) {
    return ThemeCollectionState.navigateToEditTheme(
      themes: themes ?? this.themes,
      theme: theme,
    );
  }

  ThemeCollectionState copyWithSuccess({
    List<AppConfigurationModel>? themes,
  }) {
    return ThemeCollectionState.success(
      themes: themes ?? this.themes,
    );
  }

  ThemeCollectionState copyWithError({
    List<AppConfigurationModel>? themes,
    BaseException? error,
  }) {
    return ThemeCollectionState.error(
      themes: themes ?? this.themes,
      error: error,
    );
  }
}
