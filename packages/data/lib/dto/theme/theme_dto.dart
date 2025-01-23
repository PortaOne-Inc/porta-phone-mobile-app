import 'dart:convert';
import 'dart:typed_data';

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
    @Default([]) List<ThemeAssetDto> assets,
  }) = _ThemeDTO;

  const ThemeDTO._();

  factory ThemeDTO.fromJson(Map<String, Object?> json) => _$ThemeDTOFromJson(json);

  factory ThemeDTO.fromJsonString(String stringJson) =>
      _$ThemeDTOFromJson(jsonDecode(stringJson) as Map<String, dynamic>);
}

@Freezed(makeCollectionsUnmodifiable: false)
class ThemeAssetDto with _$ThemeAssetDto {
  const factory ThemeAssetDto({
    required int id,
    required String name,
    @Default('') String description,
    @Uint8ListConverter() Uint8List? file,
  }) = _ThemeAssetDto;

  factory ThemeAssetDto.fromJson(Map<String, dynamic> json) => _$ThemeAssetDtoFromJson(json);
}

/// Custom converter for Uint8List
class Uint8ListConverter implements JsonConverter<Uint8List?, String?> {
  const Uint8ListConverter();

  @override
  Uint8List? fromJson(String? json) {
    if (json == null) return null;
    return base64Decode(json);
  }

  @override
  String? toJson(Uint8List? object) {
    if (object == null) return null;
    return base64Encode(object);
  }
}
