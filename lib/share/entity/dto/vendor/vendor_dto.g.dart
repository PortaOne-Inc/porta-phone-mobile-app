// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApplicationDTO _$$_ApplicationDTOFromJson(Map<String, dynamic> json) =>
    _$_ApplicationDTO(
      theme: json['theme'] == null
          ? null
          : ThemeDTO.fromJson(json['theme'] as Map<String, dynamic>),
      title: json['title'] as String?,
      description: json['description'] as String?,
      androidIdentifier: json['androidIdentifier'] as String?,
      iosIdentifier: json['iosIdentifier'] as String?,
      uuid: json['uuid'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_ApplicationDTOToJson(_$_ApplicationDTO instance) =>
    <String, dynamic>{
      'theme': instance.theme,
      'title': instance.title,
      'description': instance.description,
      'androidIdentifier': instance.androidIdentifier,
      'iosIdentifier': instance.iosIdentifier,
      'uuid': instance.uuid,
      'id': instance.id,
    };
