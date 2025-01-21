// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThemeDTOImpl _$$ThemeDTOImplFromJson(Map<String, dynamic> json) =>
    _$ThemeDTOImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      colorSchemeConfig: json['colorSchemeConfig'] == null
          ? const ColorSchemeConfig()
          : ColorSchemeConfig.fromJson(
              json['colorSchemeConfig'] as Map<String, dynamic>),
      themeWidgetConfig: json['themeWidgetConfig'] == null
          ? const ThemeWidgetConfig()
          : ThemeWidgetConfig.fromJson(
              json['themeWidgetConfig'] as Map<String, dynamic>),
      themePageConfig: json['themePageConfig'] == null
          ? const ThemePageConfig()
          : ThemePageConfig.fromJson(
              json['themePageConfig'] as Map<String, dynamic>),
      appConfig: json['appConfig'] == null
          ? const AppConfig()
          : AppConfig.fromJson(json['appConfig'] as Map<String, dynamic>),
      assets: (json['assets'] as List<dynamic>?)
              ?.map((e) => ThemeAssetDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ThemeDTOImplToJson(_$ThemeDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'colorSchemeConfig': instance.colorSchemeConfig,
      'themeWidgetConfig': instance.themeWidgetConfig,
      'themePageConfig': instance.themePageConfig,
      'appConfig': instance.appConfig,
      'assets': instance.assets,
    };

_$ThemeAssetDtoImpl _$$ThemeAssetDtoImplFromJson(Map<String, dynamic> json) =>
    _$ThemeAssetDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      file: const Uint8ListConverter().fromJson(json['file'] as String?),
    );

Map<String, dynamic> _$$ThemeAssetDtoImplToJson(_$ThemeAssetDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'file': const Uint8ListConverter().toJson(instance.file),
    };
