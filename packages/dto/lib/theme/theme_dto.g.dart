// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThemeDTOImpl _$$ThemeDTOImplFromJson(Map<String, dynamic> json) =>
    _$ThemeDTOImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      fontFamily: json['fontFamily'] as String?,
      images: json['images'] == null
          ? null
          : ImageCollectionDTO.fromJson(json['images'] as Map<String, dynamic>),
      colors: json['colors'] == null
          ? null
          : ColorDTO.fromJson(json['colors'] as Map<String, dynamic>),
      texts: json['texts'] == null
          ? null
          : TextsDTO.fromJson(json['texts'] as Map<String, dynamic>),
      style: json['style'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ThemeDTOImplToJson(_$ThemeDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fontFamily': instance.fontFamily,
      'images': instance.images,
      'colors': instance.colors,
      'texts': instance.texts,
      'style': instance.style,
    };
