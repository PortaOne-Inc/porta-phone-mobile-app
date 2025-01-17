// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_version_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BuildVersionDTOImpl _$$BuildVersionDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$BuildVersionDTOImpl(
      buildName: json['buildName'] as String?,
      buildNumber: (json['buildNumber'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BuildVersionDTOImplToJson(
        _$BuildVersionDTOImpl instance) =>
    <String, dynamic>{
      'buildName': instance.buildName,
      'buildNumber': instance.buildNumber,
    };
