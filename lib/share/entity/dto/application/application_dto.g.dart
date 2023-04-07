// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApplicationDTO _$$_ApplicationDTOFromJson(Map<String, dynamic> json) =>
    _$_ApplicationDTO(
      id: json['id'] as String?,
      name: json['name'] as String?,
      platformIdentifier: json['platformIdentifier'] as String?,
      theme: json['theme'] as String?,
    );

Map<String, dynamic> _$$_ApplicationDTOToJson(_$_ApplicationDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'platformIdentifier': instance.platformIdentifier,
      'theme': instance.theme,
    };
