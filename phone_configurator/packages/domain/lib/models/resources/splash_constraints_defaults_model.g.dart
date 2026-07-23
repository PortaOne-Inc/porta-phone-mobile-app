// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_constraints_defaults_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SplashConstraintsDefaultsSliceModel
_$SplashConstraintsDefaultsSliceModelFromJson(Map<String, dynamic> json) =>
    _SplashConstraintsDefaultsSliceModel(
      fullSizeDp: (json['fullSizeDp'] as num).toDouble(),
      maskDiameterDp: (json['maskDiameterDp'] as num).toDouble(),
      toleranceDp: (json['toleranceDp'] as num).toDouble(),
    );

Map<String, dynamic> _$SplashConstraintsDefaultsSliceModelToJson(
  _SplashConstraintsDefaultsSliceModel instance,
) => <String, dynamic>{
  'fullSizeDp': instance.fullSizeDp,
  'maskDiameterDp': instance.maskDiameterDp,
  'toleranceDp': instance.toleranceDp,
};

_SplashConstraintsDefaultsModel _$SplashConstraintsDefaultsModelFromJson(
  Map<String, dynamic> json,
) => _SplashConstraintsDefaultsModel(
  withBackground: SplashConstraintsDefaultsSliceModel.fromJson(
    json['withBackground'] as Map<String, dynamic>,
  ),
  withoutBackground: SplashConstraintsDefaultsSliceModel.fromJson(
    json['withoutBackground'] as Map<String, dynamic>,
  ),
  android12: json['android12'] == null
      ? null
      : SplashConstraintsDefaultsSliceModel.fromJson(
          json['android12'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$SplashConstraintsDefaultsModelToJson(
  _SplashConstraintsDefaultsModel instance,
) => <String, dynamic>{
  'withBackground': instance.withBackground,
  'withoutBackground': instance.withoutBackground,
  'android12': instance.android12,
};
