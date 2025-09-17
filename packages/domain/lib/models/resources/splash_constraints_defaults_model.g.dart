// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_constraints_defaults_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SplashConstraintsDefaultsSliceModelImpl
    _$$SplashConstraintsDefaultsSliceModelImplFromJson(
            Map<String, dynamic> json) =>
        _$SplashConstraintsDefaultsSliceModelImpl(
          fullSizeDp: (json['fullSizeDp'] as num).toDouble(),
          maskDiameterDp: (json['maskDiameterDp'] as num).toDouble(),
          toleranceDp: (json['toleranceDp'] as num).toDouble(),
        );

Map<String, dynamic> _$$SplashConstraintsDefaultsSliceModelImplToJson(
        _$SplashConstraintsDefaultsSliceModelImpl instance) =>
    <String, dynamic>{
      'fullSizeDp': instance.fullSizeDp,
      'maskDiameterDp': instance.maskDiameterDp,
      'toleranceDp': instance.toleranceDp,
    };

_$SplashConstraintsDefaultsModelImpl
    _$$SplashConstraintsDefaultsModelImplFromJson(Map<String, dynamic> json) =>
        _$SplashConstraintsDefaultsModelImpl(
          withBackground: SplashConstraintsDefaultsSliceModel.fromJson(
              json['withBackground'] as Map<String, dynamic>),
          withoutBackground: SplashConstraintsDefaultsSliceModel.fromJson(
              json['withoutBackground'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$SplashConstraintsDefaultsModelImplToJson(
        _$SplashConstraintsDefaultsModelImpl instance) =>
    <String, dynamic>{
      'withBackground': instance.withBackground,
      'withoutBackground': instance.withoutBackground,
    };
