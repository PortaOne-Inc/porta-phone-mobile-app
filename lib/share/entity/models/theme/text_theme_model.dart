import 'package:flutter/material.dart';

class TextThemeModel {
  final String? fontFamily;
  final TextTheme textTheme;

  TextThemeModel({
    required this.fontFamily,
    required this.textTheme,
  });

  TextThemeModel copyWith({
    String? fontFamily,
    TextTheme? textTheme,
  }) {
    return TextThemeModel(
      fontFamily: fontFamily ?? this.fontFamily,
      textTheme: textTheme ?? this.textTheme,
    );
  }
}
