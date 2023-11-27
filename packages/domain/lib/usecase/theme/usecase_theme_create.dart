import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:material_color_utilities/scheme/scheme.dart';

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
    final scheme = colorsScheme?.value != null ? Scheme.light(colorsScheme!.value) : null;

    colorScheme = ColorSchemeModel(
      primary: Color(scheme?.primary ?? 0xFFF95A14),
      onPrimary: Color(scheme?.onPrimary ?? 0xFFFFFFFF),
      secondary: Color(scheme?.secondary ?? 0xFF123752),
      secondaryContainer: Color(scheme?.secondaryContainer ?? 0xFFEEF3F6),
      onSecondaryContainer: Color(scheme?.onSecondaryContainer ?? 0xFF1F618F),
      tertiary: Color(scheme?.tertiary ?? 0xFF75B943),
      error: Color(scheme?.error ?? 0xFFE74C3C),
      outline: Color(scheme?.outline ?? 0xFFFFFFFF),
      background: Color(scheme?.background ?? 0xFFFFFFFF),
      onBackground: Color(scheme?.onBackground ?? 0xFF30302F),
      surface: Color(scheme?.surface ?? 0xFFEEF3F6),
      onSurface: Color(scheme?.onSurface ?? 0xFF30302F),
      gradientTabColor: [
        Color(scheme?.primary ?? 0xff5CACE3),
        Color(scheme?.onSurface ?? 0xff123752),
      ],
    );

    final newTheme = themeModel.copyWith(colors: themeModel.colors == null ? colorScheme : null);
    final theme = await _themeRepository.createTheme(applicationId, mapper.mapToDto(newTheme)!);
    return mapper.mapToModel(theme)!;
  }
}
