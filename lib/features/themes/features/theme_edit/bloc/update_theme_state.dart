part of 'update_theme_cubit.dart';

enum ThemePropertyStatus { progress, validation, success, error }

enum ThemePropertyScreens { property, importSvg }

@freezed
class UpdateThemeState with _$UpdateThemeState {
  factory UpdateThemeState({
    // ids
    required String applicationId,
    required String themeId,
    //
    ImageModel? launchImage,
    //
    ThemePropertyStatus? status,
    ApplicationModel? applicationModel,
    ThemeModel? theme,
    //
    @Default(ColorSchemeConfig()) ColorSchemeConfig colorSchemeConfig,
    @Default(ThemeWidgetConfig()) ThemeWidgetConfig themeWidgetConfig,
    @Default(ThemePageConfig()) ThemePageConfig themePageConfig,
    @Default(AppConfig()) AppConfig appConfig,
    @Default([]) List<ThemeAssetModel> assets,
    //
    @Default(ThemePropertyScreens.property) ThemePropertyScreens themePropertyScreens,
    ThemeNameInput? nameField,
    Exception? error,
  }) = _UpdateThemeState;

  const UpdateThemeState._();

  bool get isProgress => status == ThemePropertyStatus.progress;

  bool get isHasError => status == ThemePropertyStatus.error;

  ThemeSettings toThemeSettings() {
    return ThemeSettings(
      themeWidgetLightConfig: themeWidgetConfig.copyWIthUrlResources(),
      lightColorSchemeConfig: colorSchemeConfig,
      themePageLightConfig: themePageConfig.copyWIthUrlResources(),
    );
  }

  List<MapEntry<String, Color?>> get colorsScheme {
    final scheme = colorSchemeConfig.colorSchemeOverride;

    return scheme
        .toJson()
        .entries
        .map((entry) => MapEntry<String, Color?>(entry.key, (entry.value as String).toColor()))
        .toList();
  }
}
