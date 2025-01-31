part of 'update_theme_cubit.dart';

abstract class ConfiguratorEvent {
  const ConfiguratorEvent();
}

// NEW
@Freezed(copyWith: false)
class UpdateSchemeEvent with _$UpdateSchemeEvent implements ConfiguratorEvent {
  const factory UpdateSchemeEvent.colors(ColorSchemeConfig scheme) = _UpdateColorsEventChange;

  const factory UpdateSchemeEvent.components(ThemeWidgetConfig scheme) = _UpdateComponentsEventChange;

  const factory UpdateSchemeEvent.pages(ThemePageConfig scheme) = _UpdatePagesEventChange;

  const factory UpdateSchemeEvent.featureAccess(AppConfig scheme) = _UpdateAppConfigEventChange;

  const factory UpdateSchemeEvent.assets(List<ThemeAssetModel> scheme) = _UpdateAssetsEventChange;

  const factory UpdateSchemeEvent.launchAsset(ImageModel? image) = _UpdateImageModelEventChange;
}

// OLD

@Freezed(copyWith: false)
class ReplaceColorSchemeEvent with _$ReplaceColorSchemeEvent implements ConfiguratorEvent {
  const factory ReplaceColorSchemeEvent(ColorSchemeModel colorScheme) = _ReplaceColorSchemeEvent;
}

@Freezed(copyWith: false)
class GetThemeEvent with _$GetThemeEvent implements ConfiguratorEvent {
  const factory GetThemeEvent() = _GetThemeEvent;
}

@Freezed(copyWith: false)
class GetApplicationEvent with _$GetApplicationEvent implements ConfiguratorEvent {
  const factory GetApplicationEvent() = _GetApplicationEvent;
}

@Freezed(copyWith: false)
class UpdateThemeEvent with _$UpdateThemeEvent implements ConfiguratorEvent {
  const factory UpdateThemeEvent(ThemeModel? model) = _UpdateThemeEvent;
}

@Freezed(copyWith: false)
class UpdatePropertyStateScreen with _$UpdatePropertyStateScreen implements ConfiguratorEvent {
  const factory UpdatePropertyStateScreen(
    ThemePropertyScreens propertyStateScreen,
  ) = _UpdatePropertyStateScreen;
}

@Freezed(copyWith: false)
class UpdateColorSchemeEvent with _$UpdateColorSchemeEvent implements ConfiguratorEvent {
  const factory UpdateColorSchemeEvent.chane(String key, Color? color) = _UpdateColorEventChange;

  const factory UpdateColorSchemeEvent.gradientTab(List<Color> colors) = _UpdateColorEventGradientTab;

  const factory UpdateColorSchemeEvent.launchAdaptiveIconColor(Color? color) = _UpdateColorLaunchAdaptiveIcon;

  const factory UpdateColorSchemeEvent.launchSplashBackgroundColor(Color? color) =
      _UpdateColorEventLaunchSplashBackground;
}

@Freezed(copyWith: false)
class UpdateThemeSchemeEvent with _$UpdateThemeSchemeEvent implements ConfiguratorEvent {
  const factory UpdateThemeSchemeEvent.updateFont(String font) = _UpdateThemeSchemeFontEvent;

  const factory UpdateThemeSchemeEvent.updateTexts(TextsModel? textsModel) = _UpdateThemeSchemeTextsvent;
}
