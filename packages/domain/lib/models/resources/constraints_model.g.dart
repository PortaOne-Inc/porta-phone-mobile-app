// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constraints_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConstraintsModel _$ConstraintsModelFromJson(
  Map<String, dynamic> json,
) => _ConstraintsModel(
  androidLegacy: json['androidLegacy'] == null
      ? null
      : PlatformConstraintsModel.fromJson(
          json['androidLegacy'] as Map<String, dynamic>,
        ),
  androidAdaptive: json['androidAdaptive'] == null
      ? null
      : PlatformConstraintsModel.fromJson(
          json['androidAdaptive'] as Map<String, dynamic>,
        ),
  ios: json['ios'] == null
      ? null
      : PlatformConstraintsModel.fromJson(json['ios'] as Map<String, dynamic>),
  web: json['web'] == null
      ? null
      : PlatformConstraintsModel.fromJson(json['web'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ConstraintsModelToJson(_ConstraintsModel instance) =>
    <String, dynamic>{
      'androidLegacy': instance.androidLegacy,
      'androidAdaptive': instance.androidAdaptive,
      'ios': instance.ios,
      'web': instance.web,
    };

_PlatformConstraintsModel _$PlatformConstraintsModelFromJson(
  Map<String, dynamic> json,
) => _PlatformConstraintsModel(
  sizeDp: (json['sizeDp'] as num?)?.toDouble(),
  safeZoneDp: (json['safeZoneDp'] as num?)?.toDouble(),
  toleranceDp: (json['toleranceDp'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PlatformConstraintsModelToJson(
  _PlatformConstraintsModel instance,
) => <String, dynamic>{
  'sizeDp': instance.sizeDp,
  'safeZoneDp': instance.safeZoneDp,
  'toleranceDp': instance.toleranceDp,
};
