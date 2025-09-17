// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constraints_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlatformConstraintsDtoImpl _$$PlatformConstraintsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PlatformConstraintsDtoImpl(
      sizeDp: (json['sizeDp'] as num?)?.toDouble(),
      safeZoneDp: (json['safeZoneDp'] as num?)?.toDouble(),
      toleranceDp: (json['toleranceDp'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PlatformConstraintsDtoImplToJson(
        _$PlatformConstraintsDtoImpl instance) =>
    <String, dynamic>{
      'sizeDp': instance.sizeDp,
      'safeZoneDp': instance.safeZoneDp,
      'toleranceDp': instance.toleranceDp,
    };

_$ConstraintsDtoImpl _$$ConstraintsDtoImplFromJson(Map<String, dynamic> json) =>
    _$ConstraintsDtoImpl(
      androidLegacy: json['androidLegacy'] == null
          ? null
          : PlatformConstraintsDto.fromJson(
              json['androidLegacy'] as Map<String, dynamic>),
      androidAdaptive: json['androidAdaptive'] == null
          ? null
          : PlatformConstraintsDto.fromJson(
              json['androidAdaptive'] as Map<String, dynamic>),
      ios: json['ios'] == null
          ? null
          : PlatformConstraintsDto.fromJson(
              json['ios'] as Map<String, dynamic>),
      web: json['web'] == null
          ? null
          : PlatformConstraintsDto.fromJson(
              json['web'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConstraintsDtoImplToJson(
        _$ConstraintsDtoImpl instance) =>
    <String, dynamic>{
      'androidLegacy': instance.androidLegacy,
      'androidAdaptive': instance.androidAdaptive,
      'ios': instance.ios,
      'web': instance.web,
    };
