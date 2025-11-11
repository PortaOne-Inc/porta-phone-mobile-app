// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_version_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BuildVersionDTO _$BuildVersionDTOFromJson(Map<String, dynamic> json) =>
    _BuildVersionDTO(
      buildName: json['buildName'] as String?,
      buildNumber: (json['buildNumber'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BuildVersionDTOToJson(_BuildVersionDTO instance) =>
    <String, dynamic>{
      'buildName': instance.buildName,
      'buildNumber': instance.buildNumber,
    };
