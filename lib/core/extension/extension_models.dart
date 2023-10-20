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
        secondary: colors?.secondary,
        secondaryContainer: colors?.secondaryContainer,
        onSecondaryContainer: colors?.onSecondaryContainer,
        tertiary: colors?.tertiary,
        error: colors?.error,
        outline: colors?.outline,
        background: colors?.background,
        onBackground: colors?.onBackground,
        surface: colors?.surface,
        onSurface: colors?.onSurface,
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
