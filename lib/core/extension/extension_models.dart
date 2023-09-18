import 'package:domain/domain.dart';

import 'package:flutter/material.dart';

import 'dart:convert';

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
    ThemeSvgAsset primarySvg = images.primaryOnboardingLogo.toThemeSvgAsset();
    ThemeSvgAsset secondarySvg = images.secondaryOnboardingLogo.toThemeSvgAsset();
    return ThemeSettings(
      seedColor: colors?.primary ?? Colors.transparent,
      lightColorSchemeOverride: ColorSchemeOverride(
        primary: colors?.primary,
        onPrimary: colors?.onPrimary,
        primaryContainer: colors?.primaryContainer,
        onPrimaryContainer: colors?.onPrimaryContainer,
        secondary: colors?.secondary,
        onSecondary: colors?.onSecondary,
        secondaryContainer: colors?.secondaryContainer,
        onSecondaryContainer: colors?.onSecondaryContainer,
        tertiary: colors?.tertiary,
        onTertiary: colors?.onTertiary,
        tertiaryContainer: colors?.tertiaryContainer,
        error: colors?.error,
        onError: colors?.onError,
        errorContainer: colors?.errorContainer,
        onErrorContainer: colors?.onErrorContainer,
        outline: colors?.outline,
        outlineVariant: colors?.outlineVariant,
        background: colors?.background,
        onBackground: colors?.onBackground,
        surface: colors?.surface,
        onSurface: colors?.onSurface,
        surfaceVariant: colors?.surfaceVariant,
        onSurfaceVariant: colors?.onSurfaceVariant,
        inverseSurface: colors?.inverseSurface,
        shadow: colors?.shadow,
        scrim: colors?.scrim,
        surfaceTint: colors?.surfaceTint,
      ),
      //TODO: Add possibility to add null
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
