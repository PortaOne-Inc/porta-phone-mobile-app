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
class GenerateColorSchemeByColorSeedEvent with _$GenerateColorSchemeByColorSeedEvent implements ConfiguratorEvent {
  const factory GenerateColorSchemeByColorSeedEvent(Color? color) = _GenerateColorSchemeByColorSeedEvent;
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

  const factory UpdateColorSchemeEvent.primaryContainer(Color? color) = _UpdateColorEventPrimaryContainer;

  const factory UpdateColorSchemeEvent.onPrimaryContainer(Color? color) = _UpdateColorEventOnPrimaryContainer;

  const factory UpdateColorSchemeEvent.primaryFixed(Color? color) = _UpdateColorEventPrimaryFixed;

  const factory UpdateColorSchemeEvent.primaryFixedDim(Color? color) = _UpdateColorEventPrimaryFixedDim;

  const factory UpdateColorSchemeEvent.onPrimaryFixed(Color? color) = _UpdateColorEventOnPrimaryFixed;

  const factory UpdateColorSchemeEvent.onPrimaryFixedVariant(Color? color) = _UpdateColorEventOnPrimaryFixedVariant;

  const factory UpdateColorSchemeEvent.secondary(Color? color) = _UpdateColorEventSecondary;

  const factory UpdateColorSchemeEvent.onSecondary(Color? color) = _UpdateColorEventOnSecondary;

  const factory UpdateColorSchemeEvent.secondaryContainer(Color? color) = _UpdateColorEventSecondaryContainer;

  const factory UpdateColorSchemeEvent.onSecondaryContainer(Color? color) = _UpdateColorEventOnSecondaryContainer;

  const factory UpdateColorSchemeEvent.secondaryFixed(Color? color) = _UpdateColorEventSecondaryFixed;

  const factory UpdateColorSchemeEvent.secondaryFixedDim(Color? color) = _UpdateColorEventSecondaryFixedDim;

  const factory UpdateColorSchemeEvent.onSecondaryFixed(Color? color) = _UpdateColorEventOnSecondaryFixed;

  const factory UpdateColorSchemeEvent.onSecondaryFixedVariant(Color? color) = _UpdateColorEventOnSecondaryFixedVariant;

  const factory UpdateColorSchemeEvent.tertiary(Color? color) = _UpdateColorEventTertiary;

  const factory UpdateColorSchemeEvent.onTertiary(Color? color) = _UpdateColorEventOnTertiary;

  const factory UpdateColorSchemeEvent.tertiaryContainer(Color? color) = _UpdateColorEventTertiaryContainer;

  const factory UpdateColorSchemeEvent.onTertiaryContainer(Color? color) = _UpdateColorEventOnTertiaryContainer;

  const factory UpdateColorSchemeEvent.tertiaryFixed(Color? color) = _UpdateColorEventTertiaryFixed;

  const factory UpdateColorSchemeEvent.tertiaryFixedDim(Color? color) = _UpdateColorEventTertiaryFixedDim;

  const factory UpdateColorSchemeEvent.onTertiaryFixed(Color? color) = _UpdateColorEventOnTertiaryFixed;

  const factory UpdateColorSchemeEvent.onTertiaryFixedVariant(Color? color) = _UpdateColorEventOnTertiaryFixedVariant;

  const factory UpdateColorSchemeEvent.error(Color? color) = _UpdateColorEventError;

  const factory UpdateColorSchemeEvent.onError(Color? color) = _UpdateColorEventOnError;

  const factory UpdateColorSchemeEvent.errorContainer(Color? color) = _UpdateColorEventErrorContainer;

  const factory UpdateColorSchemeEvent.onErrorContainer(Color? color) = _UpdateColorEventOnErrorContainer;

  const factory UpdateColorSchemeEvent.outline(Color? color) = _UpdateColorEventOutline;

  const factory UpdateColorSchemeEvent.outlineVariant(Color? color) = _UpdateColorEventOutlineVariant;

  const factory UpdateColorSchemeEvent.surface(Color? color) = _UpdateColorEventSurface;

  const factory UpdateColorSchemeEvent.onSurface(Color? color) = _UpdateColorEventOnSurface;

  const factory UpdateColorSchemeEvent.surfaceDim(Color? color) = _UpdateColorEventSurfaceDim;

  const factory UpdateColorSchemeEvent.surfaceBright(Color? color) = _UpdateColorEventSurfaceBright;

  const factory UpdateColorSchemeEvent.surfaceContainerLowest(Color? color) = _UpdateColorEventSurfaceContainerLowest;

  const factory UpdateColorSchemeEvent.surfaceContainerLow(Color? color) = _UpdateColorEventSurfaceContainerLow;

  const factory UpdateColorSchemeEvent.surfaceContainer(Color? color) = _UpdateColorEventSurfaceContainer;

  const factory UpdateColorSchemeEvent.surfaceContainerHigh(Color? color) = _UpdateColorEventSurfaceContainerHigh;

  const factory UpdateColorSchemeEvent.surfaceContainerHighest(Color? color) = _UpdateColorEventSurfaceContainerHighest;

  const factory UpdateColorSchemeEvent.onSurfaceVariant(Color? color) = _UpdateColorEventOnSurfaceVariant;

  const factory UpdateColorSchemeEvent.inverseSurface(Color? color) = _UpdateColorEventInverseSurface;

  const factory UpdateColorSchemeEvent.inversePrimary(Color? color) = _UpdateColorEventInversePrimary;

  const factory UpdateColorSchemeEvent.shadow(Color? color) = _UpdateColorEventShadow;

  const factory UpdateColorSchemeEvent.scrim(Color? color) = _UpdateColorEventScrim;

  const factory UpdateColorSchemeEvent.surfaceTint(Color? color) = _UpdateColorEventSurfaceTint;

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
