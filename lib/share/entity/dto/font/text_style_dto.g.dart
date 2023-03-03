// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_style_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TextStyleDTO _$$_TextStyleDTOFromJson(Map<String, dynamic> json) =>
    _$_TextStyleDTO(
      name: json['name'] as String?,
      height: (json['height'] as num?)?.toDouble(),
      letterSpacing: (json['letterSpacing'] as num?)?.toDouble(),
      wordSpacing: (json['wordSpacing'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_TextStyleDTOToJson(_$_TextStyleDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'height': instance.height,
      'letterSpacing': instance.letterSpacing,
      'wordSpacing': instance.wordSpacing,
    };
