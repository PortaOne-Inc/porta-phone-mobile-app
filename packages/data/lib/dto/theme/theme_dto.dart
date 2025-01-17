import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:webtrit_appearance_theme/models/models.dart';

export 'package:webtrit_appearance_theme/models/models.dart';

part 'theme_dto.freezed.dart';

part 'theme_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ThemeDTO with _$ThemeDTO {
  const factory ThemeDTO({
    String? id,
    String? name,
    @Default(ColorSchemeConfig()) ColorSchemeConfig colorSchemeConfig,
    @Default(ThemeWidgetConfig()) ThemeWidgetConfig themeWidgetConfig,
    @Default(ThemePageConfig()) ThemePageConfig themePageConfig,
    @Default(AppConfig()) AppConfig appConfig,
  }) = _ThemeDTO;

  const ThemeDTO._();

  factory ThemeDTO.fromJson(Map<String, Object?> json) => _$ThemeDTOFromJson(json);

  factory ThemeDTO.fromJsonString(String stringJson) =>
      _$ThemeDTOFromJson(jsonDecode(stringJson) as Map<String, dynamic>);
}
