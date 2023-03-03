// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApplicationDTO _$$_ApplicationDTOFromJson(Map<String, dynamic> json) =>
    _$_ApplicationDTO(
      theme: json['theme'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      uuid: json['uuid'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_ApplicationDTOToJson(_$_ApplicationDTO instance) =>
    <String, dynamic>{
      'theme': instance.theme,
      'title': instance.title,
      'description': instance.description,
      'uuid': instance.uuid,
      'id': instance.id,
    };
