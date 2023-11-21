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
  const factory UpdateColorSchemeEvent.primary(Color? color) = _UpdateColorEventPrimary;

  const factory UpdateColorSchemeEvent.onPrimary(Color? color) = _UpdateColorEventOnPrimary;

  const factory UpdateColorSchemeEvent.secondary(Color? color) = _UpdateColorEventSecondary;

  const factory UpdateColorSchemeEvent.secondaryContainer(Color? color) = _UpdateColorEventSecondaryContainer;

  const factory UpdateColorSchemeEvent.onSecondaryContainer(Color? color) = _UpdateColorEventOnSecondaryContainer;

  const factory UpdateColorSchemeEvent.tertiary(Color? color) = _UpdateColorEventTertiary;

  const factory UpdateColorSchemeEvent.error(Color? color) = _UpdateColorEventError;

  const factory UpdateColorSchemeEvent.outline(Color? color) = _UpdateColorEventOutline;

  const factory UpdateColorSchemeEvent.background(Color? color) = _UpdateColorEventBackground;

  const factory UpdateColorSchemeEvent.onBackground(Color? color) = _UpdateColorEventOnBackground;

  const factory UpdateColorSchemeEvent.surface(Color? color) = _UpdateColorEventSurface;

  const factory UpdateColorSchemeEvent.onSurface(Color? color) = _UpdateColorEventOnSurface;

  const factory UpdateColorSchemeEvent.gradientTab(List<Color> colors) = _UpdateColorEventGradientTab;

  const factory UpdateColorSchemeEvent.launchAdaptiveIconColor(Color? color) = _UpdateColorLaunchAdaptiveIcon;

  const factory UpdateColorSchemeEvent.launchSplashBackgroundColor(Color? color) =
      _UpdateColorEventlaunchSplashBackground;
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
