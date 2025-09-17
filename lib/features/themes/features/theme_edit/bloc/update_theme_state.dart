part of 'update_theme_cubit.dart';

enum ThemePropertyStatus { progress, validation, success, error }

enum ThemeComponents { widgets, pages, colors, navigation }

@freezed
class UpdateThemeState with _$UpdateThemeState {
  factory UpdateThemeState({
    required AppConfig appConfig,
    required ColorSchemeConfig colorSchemeConfig,
    required ThemeWidgetConfig themeWidgetConfig,
    required ThemePageConfig themePageConfig,
    @Default(BrightnessVariant.light) BrightnessVariant selectedVariant,
    @Default(<AssetModel>[]) List<AssetModel> assets,
    @Default(<EmbeddedResourceModel>[]) List<EmbeddedResourceModel> embeds,
    @Default(<ThemeComponents>[]) List<ThemeComponents> loadedComponents,
    ApplicationModel? applicationModel,
    ThemeModel? theme,
    FeatureAccessModel? featureAccessModel,
    ThemePropertyStatus? status,
    ColorSchemeModel? colorSchemeModel,
    Exception? error,
  }) = _UpdateThemeState;

  const UpdateThemeState._();

  bool get isProgress {
    final allCount = ThemeComponents.values.length;
    final loadedCount = loadedComponents.toSet().length;
    return status == ThemePropertyStatus.progress || loadedCount < allCount;
  }

  bool get isHasError => status == ThemePropertyStatus.error;

  List<SchemeColor> get colorsScheme => themeSettings.lightSchemeColors;



  ThemeSettings get themeSettings {
    return ThemeSettings(
      lightColorSchemeConfig: colorSchemeConfig,
      themeWidgetLightConfig: themeWidgetConfig,
      themePageLightConfig: themePageConfig,
    );
  }

  String loadingStatusText() {
    final total = ThemeComponents.values.length;
    final loaded = loadedComponents.toSet();
    final done = loaded.length;

    final parts = ThemeComponents.values.map((c) {
      final isLoaded = loaded.contains(c);
      final label = _componentLabel(c);
      final mark = isLoaded ? '✓' : '…';
      return '$label $mark';
    }).join(' • ');

    if (isHasError) {
      return 'Failed to load ($done/$total): $parts';
    }

    final prefix = (done >= total) ? 'Loaded' : 'Loading';
    return '$prefix ($done/$total): $parts';
  }

  String _componentLabel(ThemeComponents c) {
    switch (c) {
      case ThemeComponents.colors:
        return 'Colors';
      case ThemeComponents.pages:
        return 'Pages';
      case ThemeComponents.widgets:
        return 'Widgets';
      case ThemeComponents.navigation:
        return 'Navigation';
    }
  }
}
