
import 'dart:ui';

import 'package:flutter/material.dart';

typedef GoogleFontStyle = TextStyle? Function(
    {Paint? background,
    Color? backgroundColor,
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    List<FontFeature>? fontFeatures,
    double? fontSize,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    Paint? foreground,
    double? height,
    double? letterSpacing,
    Locale? locale,
    List<Shadow>? shadows,
    TextBaseline? textBaseline,
    TextStyle? textStyle,
    double? wordSpacing});

class GoogleStyle {
  final GoogleFontStyle style;
  final String name;

  GoogleStyle(
    this.name,
    this.style,
  );
}
