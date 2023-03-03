import 'package:flutter/material.dart';

class ButtonStyleElevated extends ThemeExtension<ButtonStyleElevated> {
  const ButtonStyleElevated({
    required this.primary,
    required this.neutral,
    required this.primaryOnDark,
    required this.neutralOnDark,
  });

  final ButtonStyle? primary;
  final ButtonStyle? neutral;
  final ButtonStyle? primaryOnDark;
  final ButtonStyle? neutralOnDark;

  @override
  ThemeExtension<ButtonStyleElevated> copyWith({
    ButtonStyle? primary,
    ButtonStyle? neutral,
    ButtonStyle? primaryOnDark,
    ButtonStyle? neutralOnDark,
  }) {
    return ButtonStyleElevated(
      primary: primary ?? this.primary,
      neutral: neutral ?? this.neutral,
      primaryOnDark: primaryOnDark ?? this.primaryOnDark,
      neutralOnDark: neutralOnDark ?? this.neutralOnDark,
    );
  }

  @override
  ThemeExtension<ButtonStyleElevated> lerp(ThemeExtension<ButtonStyleElevated>? other, double t) {
    if (other is! ButtonStyleElevated) {
      return this;
    }
    return ButtonStyleElevated(
      primary: ButtonStyle.lerp(primary, other.primary, t),
      neutral: ButtonStyle.lerp(neutral, other.neutral, t),
      primaryOnDark: ButtonStyle.lerp(primaryOnDark, other.primaryOnDark, t),
      neutralOnDark: ButtonStyle.lerp(neutralOnDark, other.neutralOnDark, t),
    );
  }
}
