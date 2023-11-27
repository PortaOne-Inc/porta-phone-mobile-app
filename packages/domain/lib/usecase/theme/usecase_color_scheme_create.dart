import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:material_color_utilities/scheme/scheme.dart';

import 'package:dto/dto.dart';
import 'package:domain/domain.dart';

abstract class UsecaseColorSchemeCreate {
  Future<ColorSchemeModel> execute({
    Color? colorsScheme,
  });
}

@Injectable(as: UsecaseColorSchemeCreate)
class UsecaseColorSchemeCreateImpl implements UsecaseColorSchemeCreate {
  UsecaseColorSchemeCreateImpl();

  @override
  Future<ColorSchemeModel> execute({
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

    return colorScheme;
  }
}
