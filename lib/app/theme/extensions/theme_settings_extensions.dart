import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../configurator_theme_settings.dart';

extension ThemeSettingsExtensions on ConfiguratorThemeSettings {
  /// Builds a [ColorScheme] for the given brightness.
  ColorScheme _buildColorScheme(Brightness brightness, Color? targetColor) {
    final isLight = brightness == Brightness.light;
    final override = isLight
        ? lightColorSchemeOverride
        : darkColorSchemeOverride;
    if (override == null) {
      throw Exception('Color scheme override must not be null.');
    }
    return override.toColorScheme(brightness: brightness);
  }

  /// Retrieves a [TextTheme] with Google Fonts applied.
  TextTheme? _buildTextTheme(Brightness brightness) {
    final fontFamily = this.fontFamily;
    if (fontFamily == null) return null;

    final baseTheme = brightness == Brightness.light
        ? ThemeData.light()
        : ThemeData.dark();
    return GoogleFonts.getTextTheme(fontFamily, baseTheme.textTheme);
  }

  /// Generates a [ThemeData] for the specified brightness.
  ThemeData _buildThemeData(Brightness brightness, [Color? targetColor]) {
    final scheme = _buildColorScheme(brightness, targetColor);
    return ThemeData.from(
      colorScheme: scheme,
      textTheme: _buildTextTheme(brightness),
      useMaterial3: true,
    ).copyWith(
      primaryColorLight: scheme.primary,
      primaryColorDark: scheme.primary,
      unselectedWidgetColor: scheme.onSurface,
      scaffoldBackgroundColor: scheme.surfaceContainer,
      cardTheme: CardThemeData(color: scheme.surface, elevation: 2),
      tabBarTheme: TabBarThemeData(indicatorColor: scheme.tertiary),
    );
  }

  /// Generates a light [ThemeData].
  ThemeData light([Color? targetColor]) =>
      _buildThemeData(Brightness.light, targetColor);

  /// Generates a dark [ThemeData].
  ThemeData dark([Color? targetColor]) =>
      _buildThemeData(Brightness.dark, targetColor);
}
