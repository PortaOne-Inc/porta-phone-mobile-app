// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BuildVersionModel _$BuildVersionModelFromJson(Map<String, dynamic> json) =>
    _BuildVersionModel(
      buildName: json['buildName'] as String?,
      buildNumber: (json['buildNumber'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BuildVersionModelToJson(_BuildVersionModel instance) =>
    <String, dynamic>{
      'buildName': instance.buildName,
      'buildNumber': instance.buildNumber,
    };
