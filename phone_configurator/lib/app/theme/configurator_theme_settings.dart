import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'custom_color.dart';

part 'configurator_theme_settings.freezed.dart';

part 'configurator_theme_settings.g.dart';

@freezed
sealed class ConfiguratorThemeSettings with _$ConfiguratorThemeSettings {
  // ignore: invalid_annotation_target
  @themeJsonSerializable
  const factory ConfiguratorThemeSettings({
    required Color seedColor,
    ConfiguratorColorSchemeOverride? lightColorSchemeOverride,
    ConfiguratorColorSchemeOverride? darkColorSchemeOverride,
    String? fontFamily,
  }) = _ConfiguratorThemeSettings;

  factory ConfiguratorThemeSettings.fromJson(Map<String, dynamic> json) =>
      _$ConfiguratorThemeSettingsFromJson(json);
}

@freezed
sealed class ConfiguratorColorSchemeOverride
    with _$ConfiguratorColorSchemeOverride {
  // ignore: invalid_annotation_target
  @themeJsonSerializable
  const factory ConfiguratorColorSchemeOverride({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? secondaryFixed,
    Color? secondaryFixedDim,
    Color? onSecondaryFixed,
    Color? onSecondaryFixedVariant,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? tertiaryFixed,
    Color? tertiaryFixedDim,
    Color? onTertiaryFixed,
    Color? onTertiaryFixedVariant,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? outline,
    Color? outlineVariant,
    Color? surface,
    Color? onSurface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? onSurfaceVariant,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? shadow,
    Color? scrim,
    Color? surfaceTint,
  }) = _ConfiguratorColorSchemeOverride;

  factory ConfiguratorColorSchemeOverride.fromJson(Map<String, dynamic> json) =>
      _$ConfiguratorColorSchemeOverrideFromJson(json);
}

extension ColorSchemeOverrideMapper on ConfiguratorColorSchemeOverride {
  ColorScheme toColorScheme({required Brightness brightness}) {
    return ColorScheme(
      brightness: brightness,
      primary: primary ?? Colors.blue,
      onPrimary: onPrimary ?? Colors.white,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      primaryFixed: primaryFixed,
      primaryFixedDim: primaryFixedDim,
      onPrimaryFixed: onPrimaryFixed,
      onPrimaryFixedVariant: onPrimaryFixedVariant,
      secondary: secondary ?? Colors.green,
      onSecondary: onSecondary ?? Colors.white,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      secondaryFixed: secondaryFixed,
      secondaryFixedDim: secondaryFixedDim,
      onSecondaryFixed: onSecondaryFixed,
      onSecondaryFixedVariant: onSecondaryFixedVariant,
      tertiary: tertiary ?? Colors.purple,
      onTertiary: onTertiary ?? Colors.white,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      tertiaryFixed: tertiaryFixed,
      tertiaryFixedDim: tertiaryFixedDim,
      onTertiaryFixed: onTertiaryFixed,
      onTertiaryFixedVariant: onTertiaryFixedVariant,
      error: error ?? Colors.red,
      onError: onError ?? Colors.white,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface ?? Colors.grey[200]!,
      onSurface: onSurface ?? Colors.black,
      surfaceDim: surfaceDim,
      surfaceBright: surfaceBright,
      surfaceContainerLowest: surfaceContainerLowest,
      surfaceContainerLow: surfaceContainerLow,
      surfaceContainer: surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh,
      surfaceContainerHighest: surfaceContainerHighest,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: onInverseSurface,
      inversePrimary: inversePrimary,
      surfaceTint: surfaceTint,
    );
  }
}
