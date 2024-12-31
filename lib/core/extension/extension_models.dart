import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:domain/domain.dart';
import 'package:webtrit_configurator/app/theme/custom_color.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/gen/assets.gen.dart';

extension ImageModelExtension on ImageModel {
  ThemeSvgAsset toThemeSvgAsset() {
    if (isAvailable == true) {
      switch (location) {
        case ImageLocation.network:
          return ThemeNetworkSvgAsset(url!);
        case ImageLocation.memory:
          return data == null ? ThemeAssetSvgAsset(Assets.emptySvg) : ThemeMemorySvgAsset(base64.decode(data!));
        case ImageLocation.empty:
          return ThemeAssetSvgAsset(Assets.emptySvg);
      }
    } else {
      return ThemeAssetSvgAsset(Assets.emptySvg);
    }
  }
}

extension ThemeModelExtension on ThemeModel {
  ThemeSettings toThemeSettings() {
    final primarySvg = images.primaryOnboardingLogo.toThemeSvgAsset();
    final secondarySvg = images.secondaryOnboardingLogo.toThemeSvgAsset();
    final colorMap = colors?.colors ?? {};

    return ThemeSettings(
      seedColor: colors?.colors['primary']?.toColor() ?? Colors.transparent,
      lightColorSchemeOverride: ColorSchemeOverride(
        primary: colorMap['primary']?.toColor(),
        onPrimary: colorMap['onPrimary']?.toColor(),
        primaryContainer: colorMap['primaryContainer']?.toColor(),
        onPrimaryContainer: colorMap['onPrimaryContainer']?.toColor(),
        primaryFixed: colorMap['primaryFixed']?.toColor(),
        primaryFixedDim: colorMap['primaryFixedDim']?.toColor(),
        onPrimaryFixed: colorMap['onPrimaryFixed']?.toColor(),
        onPrimaryFixedVariant: colorMap['onPrimaryFixedVariant']?.toColor(),
        secondary: colorMap['secondary']?.toColor(),
        onSecondary: colorMap['onSecondary']?.toColor(),
        secondaryContainer: colorMap['secondaryContainer']?.toColor(),
        onSecondaryContainer: colorMap['onSecondaryContainer']?.toColor(),
        secondaryFixed: colorMap['secondaryFixed']?.toColor(),
        secondaryFixedDim: colorMap['secondaryFixedDim']?.toColor(),
        onSecondaryFixed: colorMap['onSecondaryFixed']?.toColor(),
        onSecondaryFixedVariant: colorMap['onSecondaryFixedVariant']?.toColor(),
        tertiary: colorMap['tertiary']?.toColor(),
        onTertiary: colorMap['onTertiary']?.toColor(),
        tertiaryContainer: colorMap['tertiaryContainer']?.toColor(),
        onTertiaryContainer: colorMap['onTertiaryContainer']?.toColor(),
        tertiaryFixed: colorMap['tertiaryFixed']?.toColor(),
        tertiaryFixedDim: colorMap['tertiaryFixedDim']?.toColor(),
        onTertiaryFixed: colorMap['onTertiaryFixed']?.toColor(),
        onTertiaryFixedVariant: colorMap['onTertiaryFixedVariant']?.toColor(),
        error: colorMap['error']?.toColor(),
        onError: colorMap['onError']?.toColor(),
        errorContainer: colorMap['errorContainer']?.toColor(),
        onErrorContainer: colorMap['onErrorContainer']?.toColor(),
        outline: colorMap['outline']?.toColor(),
        outlineVariant: colorMap['outlineVariant']?.toColor(),
        surface: colorMap['surface']?.toColor(),
        onSurface: colorMap['onSurface']?.toColor(),
        surfaceDim: colorMap['surfaceDim']?.toColor(),
        surfaceBright: colorMap['surfaceBright']?.toColor(),
        surfaceContainerLowest: colorMap['surfaceContainerLowest']?.toColor(),
        surfaceContainerLow: colorMap['surfaceContainerLow']?.toColor(),
        surfaceContainer: colorMap['surfaceContainer']?.toColor(),
        surfaceContainerHigh: colorMap['surfaceContainerHigh']?.toColor(),
        surfaceContainerHighest: colorMap['surfaceContainerHighest']?.toColor(),
        onSurfaceVariant: colorMap['onSurfaceVariant']?.toColor(),
        inverseSurface: colorMap['inverseSurface']?.toColor(),
        onInverseSurface: colorMap['onInverseSurface']?.toColor(),
        inversePrimary: colorMap['inversePrimary']?.toColor(),
        shadow: colorMap['shadow']?.toColor(),
        scrim: colorMap['scrim']?.toColor(),
        surfaceTint: colorMap['surfaceTint']?.toColor(),
      ),
      //TODO(Serdun): FIx
      // primaryGradientColors: toCustomColorGradientCollection(),
      fontFamily: fontFamily,
      primaryOnboardingLogo: primarySvg,
      secondaryOnboardingLogo: secondarySvg,
      primaryGradientColors: [],
    );
  }

// List<CustomColor> toCustomColorGradientCollection() {
//   const emptyGradient = <Color>[Colors.transparent, Colors.transparent];
//   final isEnoughGradientColor = (colorGradientCollection ?? []).length < 2;
//   final colors = isEnoughGradientColor ? emptyGradient : colorGradientCollection;
//   return colors!.map((color) => CustomColor(color: color, blend: false)).toList();
// }
}
