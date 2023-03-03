// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ThemeDTO _$$_ThemeDTOFromJson(Map<String, dynamic> json) => _$_ThemeDTO(
      id: json['id'] as String?,
      textStyles: json['textStyles'] == null
          ? null
          : TextStyleCollectionDTO.fromJson(
              json['textStyles'] as Map<String, dynamic>),
      commonConfig: json['commonConfig'] == null
          ? null
          : ThemeCommonDTO.fromJson(
              json['commonConfig'] as Map<String, dynamic>),
      images: json['images'] == null
          ? null
          : ImageCollectionDTO.fromJson(json['images'] as Map<String, dynamic>),
      colors: json['colors'] == null
          ? null
          : ColorDTO.fromJson(json['colors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ThemeDTOToJson(_$_ThemeDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'textStyles': instance.textStyles,
      'commonConfig': instance.commonConfig,
      'images': instance.images,
      'colors': instance.colors,
    };
