import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import 'package:dto/dto.dart';
import 'package:domain/domain.dart';

abstract class UsecaseThemeCreate {
  Future<ThemeModel> execute({
    required String applicationId,
    required ThemeModel themeModel,
    Color? colorsScheme,
  });
}

@Injectable(as: UsecaseThemeCreate)
class UsecaseThemeCreateImpl implements UsecaseThemeCreate {
  UsecaseThemeCreateImpl(
    this._themeRepository,
    this.authRepository,
    this.mapper,
  );

  final AuthRepository authRepository;
  final ThemeRepository _themeRepository;
  final Mapper<ThemeDTO?, ThemeModel?> mapper;

  @override
  Future<ThemeModel> execute({
    required String applicationId,
    required ThemeModel themeModel,
    Color? colorsScheme,
  }) async {
    ColorSchemeModel colorScheme;
    DynamicScheme? scheme;
    if (colorsScheme != null) {
      final hct = Hct.fromInt(colorsScheme.value);
      scheme = DynamicScheme(
        sourceColorArgb: colorsScheme.value,
        variant: Variant.neutral,
        // Assuming a neutral variant
        isDark: false,
        primaryPalette: TonalPalette.of(hct.hue, 84),
        secondaryPalette: TonalPalette.of((hct.hue + 60) % 360, 16),
        tertiaryPalette: TonalPalette.of((hct.hue + 120) % 360, 32),
        neutralPalette: TonalPalette.of(hct.hue, 4),
        neutralVariantPalette: TonalPalette.of(hct.hue, 8),
      );
    }

    colorScheme = ColorSchemeModel(
      primary: Color(scheme?.primary ?? 0xFFF95A14),
      onPrimary: Color(scheme?.onPrimary ?? 0xFFFFFFFF),
      primaryContainer: Color(scheme?.primaryContainer ?? 0xFFFFE0D3),
      onPrimaryContainer: Color(scheme?.onPrimaryContainer ?? 0xFF6B2100),
      primaryFixed: Color(scheme?.primaryFixed ?? 0xFFFFAB99),
      primaryFixedDim: Color(scheme?.primaryFixedDim ?? 0xFFF57C5B),
      onPrimaryFixed: Color(scheme?.onPrimaryFixed ?? 0xFF5D1A00),
      onPrimaryFixedVariant: Color(scheme?.onPrimaryFixedVariant ?? 0xFFFFAB99),
      secondary: Color(scheme?.secondary ?? 0xFF123752),
      onSecondary: Color(scheme?.onSecondary ?? 0xFFFFFFFF),
      secondaryContainer: Color(scheme?.secondaryContainer ?? 0xFFEEF3F6),
      onSecondaryContainer: Color(scheme?.onSecondaryContainer ?? 0xFF1F618F),
      secondaryFixed: Color(scheme?.secondaryFixed ?? 0xFFA5C6E4),
      secondaryFixedDim: Color(scheme?.secondaryFixedDim ?? 0xFF6B95BD),
      onSecondaryFixed: Color(scheme?.onSecondaryFixed ?? 0xFF092D4A),
      onSecondaryFixedVariant: Color(scheme?.onSecondaryFixedVariant ?? 0xFFA5C6E4),
      tertiary: Color(scheme?.tertiary ?? 0xFF75B943),
      onTertiary: Color(scheme?.onTertiary ?? 0xFFFFFFFF),
      tertiaryContainer: Color(scheme?.tertiaryContainer ?? 0xFFE1F7C1),
      onTertiaryContainer: Color(scheme?.onTertiaryContainer ?? 0xFF2E5200),
      tertiaryFixed: Color(scheme?.tertiaryFixed ?? 0xFFB8E078),
      tertiaryFixedDim: Color(scheme?.tertiaryFixedDim ?? 0xFF8CC14E),
      onTertiaryFixed: Color(scheme?.onTertiaryFixed ?? 0xFF224400),
      onTertiaryFixedVariant: Color(scheme?.onTertiaryFixedVariant ?? 0xFFB8E078),
      error: Color(scheme?.error ?? 0xFFE74C3C),
      onError: Color(scheme?.onError ?? 0xFFFFFFFF),
      errorContainer: Color(scheme?.errorContainer ?? 0xFFF5B7B1),
      onErrorContainer: Color(scheme?.onErrorContainer ?? 0xFF8B1E13),
      outline: Color(scheme?.outline ?? 0xFFFFFFFF),
      outlineVariant: Color(scheme?.outlineVariant ?? 0xFFB3B3B3),
      surface: Color(scheme?.surface ?? 0xFFEEF3F6),
      onSurface: Color(scheme?.onSurface ?? 0xFF30302F),
      surfaceDim: Color(scheme?.surfaceDim ?? 0xFFDDE0E3),
      surfaceBright: Color(scheme?.surfaceBright ?? 0xFFFFFFFF),
      surfaceContainerLowest: Color(scheme?.surfaceContainerLowest ?? 0xFFF8FBFD),
      surfaceContainerLow: Color(scheme?.surfaceContainerLow ?? 0xFFF0F3F5),
      surfaceContainer: Color(scheme?.surfaceContainer ?? 0xFFEEF3F6),
      surfaceContainerHigh: Color(scheme?.surfaceContainerHigh ?? 0xFFE2E6E9),
      surfaceContainerHighest: Color(scheme?.surfaceContainerHighest ?? 0xFFDDE0E3),
      onSurfaceVariant: Color(scheme?.onSurfaceVariant ?? 0xFF494949),
      inverseSurface: Color(scheme?.inverseSurface ?? 0xFF2E2E2E),
      inversePrimary: Color(scheme?.inversePrimary ?? 0xFFFFAB99),
      shadow: Color(scheme?.shadow ?? 0xFF000000),
      scrim: Color(scheme?.scrim ?? 0xFF000000),
      surfaceTint: Color(scheme?.surfaceTint ?? 0xFFF95A14),
      gradientTabColor: [
        Color(scheme?.primary ?? 0xFF5CACE3),
        Color(scheme?.onSurface ?? 0xFF123752),
      ],
    );

    final newTheme = themeModel.copyWith(colors: themeModel.colors == null ? colorScheme : null);
    final theme = await _themeRepository.createTheme(applicationId, mapper.mapToDto(newTheme)!);
    return mapper.mapToModel(theme)!;
  }
}
