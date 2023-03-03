import 'package:flutter/material.dart';

class ButtonStyleText extends ThemeExtension<ButtonStyleText> {
  const ButtonStyleText({
    required this.neutral,
    required this.dangerous,
    required this.callStart,
    required this.callHangup,
    required this.callAction,
    required this.callActiveAction,
  });

  final ButtonStyle? neutral;
  final ButtonStyle? dangerous;
  final ButtonStyle? callStart;
  final ButtonStyle? callHangup;
  final ButtonStyle? callAction;
  final ButtonStyle? callActiveAction;

  @override
  ThemeExtension<ButtonStyleText> copyWith({
    ButtonStyle? neutral,
    ButtonStyle? dangerous,
    ButtonStyle? callStart,
    ButtonStyle? callHangup,
    ButtonStyle? callAction,
    ButtonStyle? callActiveAction,
  }) {
    return ButtonStyleText(
      neutral: neutral ?? this.neutral,
      dangerous: dangerous ?? this.dangerous,
      callStart: callStart ?? this.callStart,
      callHangup: callHangup ?? this.callHangup,
      callAction: callAction ?? this.callAction,
      callActiveAction: callActiveAction ?? this.callActiveAction,
    );
  }

  @override
  ThemeExtension<ButtonStyleText> lerp(ThemeExtension<ButtonStyleText>? other, double t) {
    if (other is! ButtonStyleText) {
      return this;
    }
    return ButtonStyleText(
      neutral: ButtonStyle.lerp(neutral, other.neutral, t),
      dangerous: ButtonStyle.lerp(dangerous, other.dangerous, t),
      callStart: ButtonStyle.lerp(callStart, other.callStart, t),
      callHangup: ButtonStyle.lerp(callHangup, other.callHangup, t),
      callAction: ButtonStyle.lerp(callAction, other.callAction, t),
      callActiveAction: ButtonStyle.lerp(callActiveAction, other.callActiveAction, t),
    );
  }
}
