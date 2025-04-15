import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:webtrit_appearance_theme/models/models.dart';

import 'launch_assets_dto.dart';
import 'splash_assets_dto.dart';

export 'package:webtrit_appearance_theme/models/models.dart';

part 'theme_dto.freezed.dart';

part 'theme_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false, toJson: true)
class ThemeDTO with _$ThemeDTO {
  const factory ThemeDTO({
    String? id,
    String? applicationId,
    String? name,
    @Default(ColorSchemeConfig()) ColorSchemeConfig colorSchemeConfig,
    @Default(ThemeWidgetConfig()) ThemeWidgetConfig themeWidgetConfig,
    @Default(ThemePageConfig()) ThemePageConfig themePageConfig,
    @Default(AppConfig()) AppConfig appConfig,
    @Default(LaunchAssetsDto()) LaunchAssetsDto launchAssets,
    @Default(SplashAssetsDto()) SplashAssetsDto splashAssets,
    @Default([]) List<ThemeAssetDto> assets,
  }) = _ThemeDTO;

  factory ThemeDTO.fromJson(Map<String, Object?> json) {
    return ThemeDTO(
      id: json['id'] as String?,
      applicationId: json['applicationId'] as String?,
      name: json['name'] as String?,
      colorSchemeConfig: _safeParse(json['colorSchemeConfig'], ColorSchemeConfig.fromJson, const ColorSchemeConfig()),
      themeWidgetConfig: _safeParse(json['themeWidgetConfig'], ThemeWidgetConfig.fromJson, const ThemeWidgetConfig()),
      themePageConfig: _safeParse(json['themePageConfig'], ThemePageConfig.fromJson, const ThemePageConfig()),
      appConfig: _safeParse(json['appConfig'], AppConfig.fromJson, const AppConfig()),
      launchAssets: _safeParse(json['launchAssets'], LaunchAssetsDto.fromJson, const LaunchAssetsDto()),
      splashAssets: _safeParse(json['splashAssets'], SplashAssetsDto.fromJson, const SplashAssetsDto()),
      assets: (json['assets'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(ThemeAssetDto.fromJson)
          .toList(),
    );
  }

  // factory ThemeDTO.fromJsonString(String stringJson) =>
  //     _$ThemeDTOFromJson(jsonDecode(stringJson) as Map<String, dynamic>);

  const ThemeDTO._();

  // factory ThemeDTO.fromJson(Map<String, Object?> json) => _$ThemeDTOFromJson(json);

  static T _safeParse<T>(dynamic json, T Function(Map<String, dynamic>) fromJson, T defaultValue) {
    try {
      if (json is Map<String, dynamic>) {
        return fromJson(json);
      }
    } catch (_) {}
    return defaultValue;
  }
}

@Freezed(makeCollectionsUnmodifiable: false)
class ThemeAssetDto with _$ThemeAssetDto {
  const factory ThemeAssetDto({
    required int id,
    required String name,
    @Default('') String description,
    String? url,
    String? type,
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
