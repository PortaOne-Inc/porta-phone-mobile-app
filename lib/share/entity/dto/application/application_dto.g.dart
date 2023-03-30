// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApplicationDTO _$$_ApplicationDTOFromJson(Map<String, dynamic> json) =>
    _$_ApplicationDTO(
      theme: json['theme'] == null
          ? null
          : ThemeDTO.fromJson(json['theme'] as Map<String, dynamic>),
      name: json['name'] as String?,
      platformIdentifier: json['platformIdentifier'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_ApplicationDTOToJson(_$_ApplicationDTO instance) =>
    <String, dynamic>{
      'theme': instance.theme,
      'name': instance.name,
      'platformIdentifier': instance.platformIdentifier,
      'id': instance.id,
    };
