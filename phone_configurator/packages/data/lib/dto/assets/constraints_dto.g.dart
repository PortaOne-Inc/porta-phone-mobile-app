// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constraints_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlatformConstraintsDto _$PlatformConstraintsDtoFromJson(
  Map<String, dynamic> json,
) => _PlatformConstraintsDto(
  sizeDp: (json['sizeDp'] as num?)?.toDouble(),
  safeZoneDp: (json['safeZoneDp'] as num?)?.toDouble(),
  toleranceDp: (json['toleranceDp'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PlatformConstraintsDtoToJson(
  _PlatformConstraintsDto instance,
) => <String, dynamic>{
  'sizeDp': instance.sizeDp,
  'safeZoneDp': instance.safeZoneDp,
  'toleranceDp': instance.toleranceDp,
};

_ConstraintsDto _$ConstraintsDtoFromJson(
  Map<String, dynamic> json,
) => _ConstraintsDto(
  androidLegacy: json['androidLegacy'] == null
      ? null
      : PlatformConstraintsDto.fromJson(
          json['androidLegacy'] as Map<String, dynamic>,
        ),
  androidAdaptive: json['androidAdaptive'] == null
      ? null
      : PlatformConstraintsDto.fromJson(
          json['androidAdaptive'] as Map<String, dynamic>,
        ),
  ios: json['ios'] == null
      ? null
      : PlatformConstraintsDto.fromJson(json['ios'] as Map<String, dynamic>),
  web: json['web'] == null
      ? null
      : PlatformConstraintsDto.fromJson(json['web'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ConstraintsDtoToJson(_ConstraintsDto instance) =>
    <String, dynamic>{
      'androidLegacy': instance.androidLegacy,
      'androidAdaptive': instance.androidAdaptive,
      'ios': instance.ios,
      'web': instance.web,
    };
