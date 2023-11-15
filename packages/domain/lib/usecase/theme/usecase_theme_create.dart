import 'dart:ui';

import 'package:injectable/injectable.dart';

import 'package:dto/dto.dart';
import 'package:domain/domain.dart';

abstract class UsecaseThemeCreate {
  Future<ThemeModel> execute({
    required String applicationId,
    required ThemeModel themeModel,
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
  }) async {
    // TODO: Move as static file to server
    ColorSchemeModel colorScheme = const ColorSchemeModel(
        primary: Color(0xFFF95A14),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color(0xFF123752),
        secondaryContainer: Color(0xFFEEF3F6),
        onSecondaryContainer: Color(0xFF1F618F),
        tertiary: Color(0xFF75B943),
        error: Color(0xFFE74C3C),
        outline: Color(0xFFFFFFFF),
        background: Color(0xFFFFFFFF),
        onBackground: Color(0xFF30302F),
        surface: Color(0xFFEEF3F6),
        onSurface: Color(0xFF30302F),
        gradientTabColor: [
          Color(0xff5CACE3),
          Color(0xff123752),
        ]);

    final newTheme = themeModel.copyWith(colors: themeModel.colors == null ? colorScheme : null);
    final theme = await _themeRepository.createTheme(applicationId, mapper.mapToDto(newTheme)!);
    return mapper.mapToModel(theme)!;
  }
}
