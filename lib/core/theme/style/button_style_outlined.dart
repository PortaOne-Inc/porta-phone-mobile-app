import 'package:flutter/material.dart';

class ButtonStyleOutlined extends ThemeExtension<ButtonStyleOutlined> {
  const ButtonStyleOutlined({
    required this.neutral,
  });

  final ButtonStyle? neutral;

  @override
  ThemeExtension<ButtonStyleOutlined> copyWith({
    ButtonStyle? neutral,
  }) {
    return ButtonStyleOutlined(
      neutral: neutral ?? this.neutral,
    );
  }

  @override
  ThemeExtension<ButtonStyleOutlined> lerp(ThemeExtension<ButtonStyleOutlined>? other, double t) {
    if (other is! ButtonStyleOutlined) {
      return this;
    }
    return ButtonStyleOutlined(
      neutral: ButtonStyle.lerp(neutral, other.neutral, t),
    );
  }
}
