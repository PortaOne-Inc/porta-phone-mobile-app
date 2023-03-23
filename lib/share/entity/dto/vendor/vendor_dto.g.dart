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
      applicationIdentifier: json['applicationIdentifier'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_ApplicationDTOToJson(_$_ApplicationDTO instance) =>
    <String, dynamic>{
      'theme': instance.theme,
      'title': instance.title,
      'applicationIdentifier': instance.applicationIdentifier,
      'id': instance.id,
    };
