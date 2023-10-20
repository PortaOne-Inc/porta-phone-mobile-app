import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_scheme_model.freezed.dart';

@freezed
class ColorSchemeModel with _$ColorSchemeModel {
  const ColorSchemeModel._();

  const factory ColorSchemeModel({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? error,
    Color? outline,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    List<Color>? gradientTabColor,
    LaunchModel? launch,
  }) = _ColorModel;

  List<Color> get asList => [
        if (primary != null) primary!,
        if (onPrimary != null) onPrimary!,
        if (secondary != null) secondary!,
        if (secondaryContainer != null) secondaryContainer!,
        if (onSecondaryContainer != null) onSecondaryContainer!,
        if (tertiary != null) tertiary!,
        if (error != null) error!,
        if (outline != null) outline!,
        if (background != null) background!,
        if (onBackground != null) onBackground!,
        if (surface != null) surface!,
        if (onSurface != null) onSurface!,
      ];

  bool get areAllFieldsFilled {
    return primary != null &&
        onPrimary != null &&
        secondary != null &&
        secondaryContainer != null &&
        onSecondaryContainer != null &&
        tertiary != null &&
        error != null &&
        outline != null &&
        background != null &&
        onBackground != null &&
        surface != null &&
        onSurface != null;
  }
}

@freezed
class LaunchModel with _$LaunchModel {
  const factory LaunchModel({
    Color? adaptiveIconBackground,
    Color? splashBackground,
  }) = _LaunchModel;
}
