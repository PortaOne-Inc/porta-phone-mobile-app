// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SplashSourceImpl _$$SplashSourceImplFromJson(Map<String, dynamic> json) =>
    _$SplashSourceImpl(
      foregroundAssetId: json['foregroundAssetId'] as String?,
      backgroundAssetId: json['backgroundAssetId'] as String?,
      backgroundColorHex: json['backgroundColorHex'] as String?,
    );

Map<String, dynamic> _$$SplashSourceImplToJson(_$SplashSourceImpl instance) =>
    <String, dynamic>{
      'foregroundAssetId': instance.foregroundAssetId,
      'backgroundAssetId': instance.backgroundAssetId,
      'backgroundColorHex': instance.backgroundColorHex,
    };

_$SplashAssetParamsImpl _$$SplashAssetParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SplashAssetParamsImpl(
      fit: $enumDecodeNullable(_$FitModelEnumMap, json['fit']),
      padding: (json['padding'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SplashAssetParamsImplToJson(
        _$SplashAssetParamsImpl instance) =>
    <String, dynamic>{
      'fit': _$FitModelEnumMap[instance.fit],
      'padding': instance.padding,
    };

const _$FitModelEnumMap = {
  FitModel.contain: 'contain',
  FitModel.cover: 'cover',
  FitModel.fill: 'fill',
  FitModel.none: 'none',
  FitModel.scaleDown: 'scaleDown',
  FitModel.fitWidth: 'fitWidth',
  FitModel.fitHeight: 'fitHeight',
};

_$SplashConstraintsValidationImpl _$$SplashConstraintsValidationImplFromJson(
        Map<String, dynamic> json) =>
    _$SplashConstraintsValidationImpl(
      compliant: json['compliant'] as bool,
      delta: (json['delta'] as num).toDouble(),
      message: json['message'] as String,
      tolerance: (json['tolerance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SplashConstraintsValidationImplToJson(
        _$SplashConstraintsValidationImpl instance) =>
    <String, dynamic>{
      'compliant': instance.compliant,
      'delta': instance.delta,
      'message': instance.message,
      'tolerance': instance.tolerance,
    };

_$SplashIconConstraintsImpl _$$SplashIconConstraintsImplFromJson(
        Map<String, dynamic> json) =>
    _$SplashIconConstraintsImpl(
      fullSize: (json['fullSize'] as num).toDouble(),
      maskDiameter: (json['maskDiameter'] as num).toDouble(),
      recommendedPadding: (json['recommendedPadding'] as num).toDouble(),
      validation: SplashConstraintsValidation.fromJson(
          json['validation'] as Map<String, dynamic>),
      mode: $enumDecodeNullable(_$SplashModeEnumMap, json['mode']),
      recommendationBasis: json['recommendationBasis'] as String?,
    );

Map<String, dynamic> _$$SplashIconConstraintsImplToJson(
        _$SplashIconConstraintsImpl instance) =>
    <String, dynamic>{
      'fullSize': instance.fullSize,
      'maskDiameter': instance.maskDiameter,
      'recommendedPadding': instance.recommendedPadding,
      'validation': instance.validation,
      'mode': _$SplashModeEnumMap[instance.mode],
      'recommendationBasis': instance.recommendationBasis,
    };

const _$SplashModeEnumMap = {
  SplashMode.withBackground: 'withBackground',
  SplashMode.withoutBackground: 'withoutBackground',
};

_$SplashAssetModelImpl _$$SplashAssetModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SplashAssetModelImpl(
      id: json['id'] as String,
      applicationId: json['applicationId'] as String,
      themeId: json['themeId'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      source: json['source'] == null
          ? null
          : SplashSource.fromJson(json['source'] as Map<String, dynamic>),
      params: json['params'] == null
          ? null
          : SplashAssetParams.fromJson(json['params'] as Map<String, dynamic>),
      mode: $enumDecodeNullable(_$SplashModeEnumMap, json['mode']),
      splashArtifactId: json['splashArtifactId'] as String?,
      iconConstraints: json['iconConstraints'] == null
          ? null
          : SplashIconConstraints.fromJson(
              json['iconConstraints'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SplashAssetModelImplToJson(
        _$SplashAssetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applicationId': instance.applicationId,
      'themeId': instance.themeId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'source': instance.source,
      'params': instance.params,
      'mode': _$SplashModeEnumMap[instance.mode],
      'splashArtifactId': instance.splashArtifactId,
      'iconConstraints': instance.iconConstraints,
    };
