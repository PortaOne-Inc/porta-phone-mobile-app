// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$$ThemeDTOImplToJson(_$ThemeDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applicationId': instance.applicationId,
      'name': instance.name,
      'colorSchemeConfig': instance.colorSchemeConfig,
      'themeWidgetConfig': instance.themeWidgetConfig,
      'themePageConfig': instance.themePageConfig,
      'appConfig': instance.appConfig,
      'launchAssets': instance.launchAssets,
      'splashAssets': instance.splashAssets,
      'assets': instance.assets,
    };

_$ThemeAssetDtoImpl _$$ThemeAssetDtoImplFromJson(Map<String, dynamic> json) =>
    _$ThemeAssetDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      url: json['url'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$ThemeAssetDtoImplToJson(_$ThemeAssetDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'type': instance.type,
    };
