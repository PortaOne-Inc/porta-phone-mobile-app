part of 'configurator_cubit.dart';

abstract class ConfiguratorEvent {
  const ConfiguratorEvent();
}

@Freezed(copyWith: false)
class ReplaceColorSchemeEvent with _$ReplaceColorSchemeEvent implements ConfiguratorEvent {
  const factory ReplaceColorSchemeEvent(ColorSchemeModel colorScheme) = _ReplaceColorSchemeEvent;
}

@Freezed(copyWith: false)
class GetThemeEvent with _$GetThemeEvent implements ConfiguratorEvent {
  const factory GetThemeEvent() = _GetThemeEvent;
}

@Freezed(copyWith: false)
class DownloadThemeEvent with _$DownloadThemeEvent implements ConfiguratorEvent {
  const factory DownloadThemeEvent() = _DownloadThemeEvent;
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
class UpdatePreviewScreen with _$UpdatePreviewScreen implements ConfiguratorEvent {
  const factory UpdatePreviewScreen(
    ThemePreviewScreen themePreviewScreen,
  ) = _UpdatePreviewScreen;
}

@Freezed(copyWith: false)
class UpdatePropertyStateScreen with _$UpdatePropertyStateScreen implements ConfiguratorEvent {
  const factory UpdatePropertyStateScreen(
    ThemePropertyScreens propertyStateScreen,
  ) = _UpdatePropertyStateScreen;
}

@Freezed(copyWith: false)
class FocusScreenEvent with _$FocusScreenEvent implements ConfiguratorEvent {
  const factory FocusScreenEvent(int position) = _FocusScreenEvent;
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

  const factory UpdateThemeSchemeEvent.updateInAppImages(ImageSchemeModel? image) = _UpdateThemeSchemeImagesEvent;

  const factory UpdateThemeSchemeEvent.updateSystemAssetsImages(SystemAssetsModel? image) =
      _UpdateSystemAssetsImagesEvent;
}

@Freezed(copyWith: false)
class ThemeDraftSchemeEvent with _$ThemeDraftSchemeEvent implements ConfiguratorEvent {
  const factory ThemeDraftSchemeEvent.enableDraftTheme() = _UpdateThemeMoveDraftThemToCurrentEvent;

  const factory ThemeDraftSchemeEvent.disableDraftTheme() = _UpdateThememoveDraftThemToCurrentEnt;
}
