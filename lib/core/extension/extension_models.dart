import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

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
    return ThemeSettings(
      seedColor: colors?.primary ?? Colors.transparent,
      lightColorSchemeOverride: ColorSchemeOverride(
        primary: colors?.primary,
        onPrimary: colors?.onPrimary,
        primaryContainer: colors?.primaryContainer,
        onPrimaryContainer: colors?.onPrimaryContainer,
        primaryFixed: colors?.primaryFixed,
        primaryFixedDim: colors?.primaryFixedDim,
        onPrimaryFixed: colors?.onPrimaryFixed,
        onPrimaryFixedVariant: colors?.onPrimaryFixedVariant,
        secondary: colors?.secondary,
        onSecondary: colors?.onSecondary,
        secondaryContainer: colors?.secondaryContainer,
        onSecondaryContainer: colors?.onSecondaryContainer,
        secondaryFixed: colors?.secondaryFixed,
        secondaryFixedDim: colors?.secondaryFixedDim,
        onSecondaryFixed: colors?.onSecondaryFixed,
        onSecondaryFixedVariant: colors?.onSecondaryFixedVariant,
        tertiary: colors?.tertiary,
        onTertiary: colors?.onTertiary,
        tertiaryContainer: colors?.tertiaryContainer,
        onTertiaryContainer: colors?.onTertiaryContainer,
        tertiaryFixed: colors?.tertiaryFixed,
        tertiaryFixedDim: colors?.tertiaryFixedDim,
        onTertiaryFixed: colors?.onTertiaryFixed,
        onTertiaryFixedVariant: colors?.onTertiaryFixedVariant,
        error: colors?.error,
        onError: colors?.onError,
        errorContainer: colors?.errorContainer,
        onErrorContainer: colors?.onErrorContainer,
        outline: colors?.outline,
        outlineVariant: colors?.outlineVariant,
        surface: colors?.surface,
        onSurface: colors?.onSurface,
        surfaceDim: colors?.surfaceDim,
        surfaceBright: colors?.surfaceBright,
        surfaceContainerLowest: colors?.surfaceContainerLowest,
        surfaceContainerLow: colors?.surfaceContainerLow,
        surfaceContainer: colors?.surfaceContainer,
        surfaceContainerHigh: colors?.surfaceContainerHigh,
        surfaceContainerHighest: colors?.surfaceContainerHighest,
        onSurfaceVariant: colors?.onSurfaceVariant,
        inverseSurface: colors?.inverseSurface,
        onInverseSurface: colors?.onInverseSurface,
        inversePrimary: colors?.inversePrimary,
        shadow: colors?.shadow,
        scrim: colors?.scrim,
        surfaceTint: colors?.surfaceTint,
      ),
      primaryGradientColors: toCustomColorGradientCollection(),
      fontFamily: fontFamily,
      primaryOnboardingLogo: primarySvg,
      secondaryOnboardingLogo: secondarySvg,
    );
  }

  List<CustomColor> toCustomColorGradientCollection() {
    const emptyGradient = <Color>[Colors.transparent, Colors.transparent];
    final isEnoughGradientColor = (colorGradientCollection ?? []).length < 2;
    final colors = isEnoughGradientColor ? emptyGradient : colorGradientCollection;
    return colors!.map((color) => CustomColor(color: color, blend: false)).toList();
  }
}
