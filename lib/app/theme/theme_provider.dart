import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'custom_color.dart';
import 'theme_settings.dart';

class ThemeProvider extends InheritedWidget {
  const ThemeProvider({
    required this.settings,
    required super.child,
    super.key,
  });

  final ThemeSettings settings;

  Color custom(CustomColor custom) => custom.color;

  Color _source(Color? target) => target ?? settings.seedColor;

  /// Builds a [ColorScheme] for the given brightness
  ColorScheme _colorScheme(Brightness brightness, Color? targetColor) {
    final isLight = brightness == Brightness.light;
    final override = isLight ? settings.lightColorSchemeOverride : settings.darkColorSchemeOverride;
    return override!.toColorScheme(brightness: brightness);
  }

  /// Retrieves a [TextTheme] with Google Fonts applied
  TextTheme? _textTheme(Brightness brightness) {
    final fontFamily = settings.fontFamily;
    if (fontFamily == null) return null;

    final baseTheme = brightness == Brightness.light ? ThemeData.light() : ThemeData.dark();
    return GoogleFonts.getTextTheme(fontFamily, baseTheme.textTheme);
  }

  /// Generates a [ThemeData] for the specified brightness
  ThemeData _themeData(Brightness brightness, [Color? targetColor]) {
    final scheme = _colorScheme(brightness, targetColor);
    return ThemeData.from(
      colorScheme: scheme,
      textTheme: _textTheme(brightness),
      useMaterial3: true,
    ).copyWith(
      primaryColorLight: scheme.primary,
      primaryColorDark: scheme.primary,
      unselectedWidgetColor: scheme.onSurface,
      indicatorColor: scheme.tertiary,
      scaffoldBackgroundColor: scheme.surfaceContainer,
      cardTheme: CardTheme(
        color: scheme.surface,
        elevation: 2,
      ),
    );
  }

  ThemeData light([Color? targetColor]) => _themeData(Brightness.light, targetColor);

  ThemeData dark([Color? targetColor]) => _themeData(Brightness.dark, targetColor);

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant ThemeProvider oldWidget) {
    return oldWidget.settings != settings;
  }
}
