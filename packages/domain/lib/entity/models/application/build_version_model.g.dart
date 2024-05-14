// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BuildVersionModelImpl _$$BuildVersionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BuildVersionModelImpl(
      buildName: json['buildName'] as String?,
      buildNumber: (json['buildNumber'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BuildVersionModelImplToJson(
        _$BuildVersionModelImpl instance) =>
    <String, dynamic>{
      'buildName': instance.buildName,
      'buildNumber': instance.buildNumber,
    };
