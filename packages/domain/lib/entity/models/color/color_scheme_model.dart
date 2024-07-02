import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_scheme_model.freezed.dart';

// TODO(Serdun): A lot of duplicate classes, try move all duplicate to common repo
@freezed
class ColorSchemeModel with _$ColorSchemeModel {
  const factory ColorSchemeModel({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? secondaryFixed,
    Color? secondaryFixedDim,
    Color? onSecondaryFixed,
    Color? onSecondaryFixedVariant,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? tertiaryFixed,
    Color? tertiaryFixedDim,
    Color? onTertiaryFixed,
    Color? onTertiaryFixedVariant,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? outline,
    Color? outlineVariant,
    Color? surface,
    Color? onSurface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? onSurfaceVariant,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? shadow,
    Color? scrim,
    Color? surfaceTint,
    List<Color>? gradientTabColor,
    LaunchModel? launch,
  }) = _ColorModel;

  const ColorSchemeModel._();

  List<Color> get asList => [
        if (primary != null) primary!,
        if (onPrimary != null) onPrimary!,
        if (primaryContainer != null) primaryContainer!,
        if (onPrimaryContainer != null) onPrimaryContainer!,
        if (primaryFixed != null) primaryFixed!,
        if (primaryFixedDim != null) primaryFixedDim!,
        if (onPrimaryFixed != null) onPrimaryFixed!,
        if (onPrimaryFixedVariant != null) onPrimaryFixedVariant!,
        if (secondary != null) secondary!,
        if (onSecondary != null) onSecondary!,
        if (secondaryContainer != null) secondaryContainer!,
        if (onSecondaryContainer != null) onSecondaryContainer!,
        if (secondaryFixed != null) secondaryFixed!,
        if (secondaryFixedDim != null) secondaryFixedDim!,
        if (onSecondaryFixed != null) onSecondaryFixed!,
        if (onSecondaryFixedVariant != null) onSecondaryFixedVariant!,
        if (tertiary != null) tertiary!,
        if (onTertiary != null) onTertiary!,
        if (tertiaryContainer != null) tertiaryContainer!,
        if (onTertiaryContainer != null) onTertiaryContainer!,
        if (tertiaryFixed != null) tertiaryFixed!,
        if (tertiaryFixedDim != null) tertiaryFixedDim!,
        if (onTertiaryFixed != null) onTertiaryFixed!,
        if (onTertiaryFixedVariant != null) onTertiaryFixedVariant!,
        if (error != null) error!,
        if (onError != null) onError!,
        if (errorContainer != null) errorContainer!,
        if (onErrorContainer != null) onErrorContainer!,
        if (outline != null) outline!,
        if (outlineVariant != null) outlineVariant!,
        if (surface != null) surface!,
        if (onSurface != null) onSurface!,
        if (surfaceDim != null) surfaceDim!,
        if (surfaceBright != null) surfaceBright!,
        if (surfaceContainerLowest != null) surfaceContainerLowest!,
        if (surfaceContainerLow != null) surfaceContainerLow!,
        if (surfaceContainer != null) surfaceContainer!,
        if (surfaceContainerHigh != null) surfaceContainerHigh!,
        if (surfaceContainerHighest != null) surfaceContainerHighest!,
        if (onSurfaceVariant != null) onSurfaceVariant!,
        if (inverseSurface != null) inverseSurface!,
        if (onInverseSurface != null) onInverseSurface!,
        if (inversePrimary != null) inversePrimary!,
        if (shadow != null) shadow!,
        if (scrim != null) scrim!,
        if (surfaceTint != null) surfaceTint!,
      ];

  bool get areAllFieldsFilled {
    return primary != null &&
        onPrimary != null &&
        primaryContainer != null &&
        onPrimaryContainer != null &&
        primaryFixed != null &&
        primaryFixedDim != null &&
        onPrimaryFixed != null &&
        onPrimaryFixedVariant != null &&
        secondary != null &&
        onSecondary != null &&
        secondaryContainer != null &&
        onSecondaryContainer != null &&
        secondaryFixed != null &&
        secondaryFixedDim != null &&
        onSecondaryFixed != null &&
        onSecondaryFixedVariant != null &&
        tertiary != null &&
        onTertiary != null &&
        tertiaryContainer != null &&
        onTertiaryContainer != null &&
        tertiaryFixed != null &&
        tertiaryFixedDim != null &&
        onTertiaryFixed != null &&
        onTertiaryFixedVariant != null &&
        error != null &&
        onError != null &&
        errorContainer != null &&
        onErrorContainer != null &&
        outline != null &&
        outlineVariant != null &&
        surface != null &&
        onSurface != null &&
        surfaceDim != null &&
        surfaceBright != null &&
        surfaceContainerLowest != null &&
        surfaceContainerLow != null &&
        surfaceContainer != null &&
        surfaceContainerHigh != null &&
        surfaceContainerHighest != null &&
        onSurfaceVariant != null &&
        inverseSurface != null &&
        inversePrimary != null &&
        shadow != null &&
        scrim != null &&
        surfaceTint != null;
  }
}

@freezed
class LaunchModel with _$LaunchModel {
  const factory LaunchModel({
    Color? adaptiveIconBackground,
    Color? splashBackground,
  }) = _LaunchModel;
}
