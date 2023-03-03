import 'package:flutter/material.dart';

class DecorationInput extends ThemeExtension<DecorationInput> {
  const DecorationInput({
    required this.search,
    required this.keypad,
  });

  final InputDecoration? search;
  final InputDecoration? keypad;

  @override
  ThemeExtension<DecorationInput> copyWith({
    InputDecoration? search,
    InputDecoration? keypad,
  }) {
    return DecorationInput(
      search: search ?? this.search,
      keypad: keypad ?? this.keypad,
    );
  }

  @override
  ThemeExtension<DecorationInput> lerp(ThemeExtension<DecorationInput>? other, double t) {
    if (other is! DecorationInput) {
      return this;
    }
    return DecorationInput(
      search: t < 0.5 ? search : other.search,
      keypad: t < 0.5 ? keypad : other.keypad,
    );
  }
}
