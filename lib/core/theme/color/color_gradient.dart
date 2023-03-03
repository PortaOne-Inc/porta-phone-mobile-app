import 'package:flutter/material.dart';

class ColorGradient extends ThemeExtension<ColorGradient> {
  const ColorGradient({
    required this.tab,
  });

  final Gradient? tab;

  @override
  ThemeExtension<ColorGradient> copyWith({
    Gradient? tab,
  }) {
    return ColorGradient(
      tab: tab ?? this.tab,
    );
  }

  @override
  ThemeExtension<ColorGradient> lerp(ThemeExtension<ColorGradient>? other, double t) {
    if (other is! ColorGradient) {
      return this;
    }
    return ColorGradient(
      tab: Gradient.lerp(tab, other.tab, t),
    );
  }
}
