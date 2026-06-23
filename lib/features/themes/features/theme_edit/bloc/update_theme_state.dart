part of 'update_theme_cubit.dart';

enum ThemePropertyStatus { progress, validation, success, error }

enum SyncStatus { idle, syncing, synced, failed, conflict, partiallyFailed }

enum ThemeComponents { widgets, pages, colors, navigation, embeds }

enum ConfigSyncResult { pending, success, failed, conflict }

@freezed
abstract class SyncDetail with _$SyncDetail {
  const factory SyncDetail({
    @Default(ConfigSyncResult.pending) ConfigSyncResult featureAccess,
    @Default(ConfigSyncResult.pending) ConfigSyncResult colorScheme,
    @Default(ConfigSyncResult.pending) ConfigSyncResult pageConfig,
    @Default(ConfigSyncResult.pending) ConfigSyncResult widgetConfig,
  }) = _SyncDetail;

  const SyncDetail._();

  bool get hasFailures =>
      featureAccess == ConfigSyncResult.failed ||
      colorScheme == ConfigSyncResult.failed ||
      pageConfig == ConfigSyncResult.failed ||
      widgetConfig == ConfigSyncResult.failed;

  bool get hasConflicts =>
      featureAccess == ConfigSyncResult.conflict ||
      colorScheme == ConfigSyncResult.conflict ||
      pageConfig == ConfigSyncResult.conflict ||
      widgetConfig == ConfigSyncResult.conflict;

  bool get allSucceeded =>
      featureAccess == ConfigSyncResult.success &&
      colorScheme == ConfigSyncResult.success &&
      pageConfig == ConfigSyncResult.success &&
      widgetConfig == ConfigSyncResult.success;

  List<String> get failedNames => [
    if (featureAccess == ConfigSyncResult.failed) 'Feature access',
    if (colorScheme == ConfigSyncResult.failed) 'Color scheme',
    if (pageConfig == ConfigSyncResult.failed) 'Page config',
    if (widgetConfig == ConfigSyncResult.failed) 'Widget config',
  ];

  List<String> get conflictNames => [
    if (featureAccess == ConfigSyncResult.conflict) 'Feature access',
    if (colorScheme == ConfigSyncResult.conflict) 'Color scheme',
    if (pageConfig == ConfigSyncResult.conflict) 'Page config',
    if (widgetConfig == ConfigSyncResult.conflict) 'Widget config',
  ];
}

@freezed
abstract class UpdateThemeState with _$UpdateThemeState {
  factory UpdateThemeState({
    required AppConfig appConfig,
    required ColorSchemeConfig colorSchemeConfig,
    required ThemeWidgetConfig themeWidgetConfig,
    required ThemePageConfig themePageConfig,
    @Default(BrightnessVariant.light) BrightnessVariant selectedVariant,
    @Default(<AssetModel>[]) List<AssetModel> assets,
    @Default(<EmbeddedResourceModel>[]) List<EmbeddedResourceModel> embeddedResources,
    @Default(<ThemeComponents>[]) List<ThemeComponents> loadedComponents,
    @Default(kDefaultPreviewCapabilities) List<String> previewCapabilities,
    @Default(kDefaultPreviewCoreVersion) String previewCoreVersion,
    ApplicationModel? applicationModel,
    ThemeModel? theme,
    FeatureAccessModel? featureAccessModel,
    ThemePropertyStatus? status,
    @Default(SyncStatus.idle) SyncStatus syncStatus,
    @Default(SyncDetail()) SyncDetail syncDetail,
    ColorSchemeModel? colorSchemeModel,
    Exception? error,
    String? errorSource,
  }) = _UpdateThemeState;

  const UpdateThemeState._();

  bool get isProgress {
    final allCount = ThemeComponents.values.length;
    final loadedCount = loadedComponents.toSet().length;
    return status == ThemePropertyStatus.progress || loadedCount < allCount;
  }

  bool get isHasError => status == ThemePropertyStatus.error;

  List<SchemeColor> get colorsScheme {
    if (selectedVariant == BrightnessVariant.dark) {
      return themeSettings.darkSchemeColors;
    }
    return themeSettings.lightSchemeColors;
  }

  ThemeSettings get themeSettings {
    if (selectedVariant == BrightnessVariant.dark) {
      return ThemeSettings(
        darkColorSchemeConfig: colorSchemeConfig,
        themeWidgetDarkConfig: themeWidgetConfig,
        themePageDarkConfig: themePageConfig,
      );
    } else {
      return ThemeSettings(
        lightColorSchemeConfig: colorSchemeConfig,
        themeWidgetLightConfig: themeWidgetConfig,
        themePageLightConfig: themePageConfig,
      );
    }
  }

  String loadingStatusText() {
    final total = ThemeComponents.values.length;
    final loaded = loadedComponents.toSet();
    final done = loaded.length;

    final parts = ThemeComponents.values
        .map((c) {
          final isLoaded = loaded.contains(c);
          final label = _componentLabel(c);
          final mark = isLoaded ? '✓' : '…';
          return '$label $mark';
        })
        .join(' • ');

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
      case ThemeComponents.embeds:
        return 'Embedded pages';
    }
  }
}
