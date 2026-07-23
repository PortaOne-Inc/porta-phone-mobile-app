// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SplashSource _$SplashSourceFromJson(Map<String, dynamic> json) =>
    _SplashSource(
      foregroundAssetId: json['foregroundAssetId'] as String?,
      backgroundAssetId: json['backgroundAssetId'] as String?,
      backgroundColorHex: json['backgroundColorHex'] as String?,
    );

Map<String, dynamic> _$SplashSourceToJson(_SplashSource instance) =>
    <String, dynamic>{
      'foregroundAssetId': instance.foregroundAssetId,
      'backgroundAssetId': instance.backgroundAssetId,
      'backgroundColorHex': instance.backgroundColorHex,
    };

_SplashAssetParams _$SplashAssetParamsFromJson(Map<String, dynamic> json) =>
    _SplashAssetParams(
      fit: $enumDecodeNullable(_$FitModelEnumMap, json['fit']),
      padding: (json['padding'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SplashAssetParamsToJson(_SplashAssetParams instance) =>
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

_SplashConstraintsValidation _$SplashConstraintsValidationFromJson(
  Map<String, dynamic> json,
) => _SplashConstraintsValidation(
  compliant: json['compliant'] as bool,
  delta: (json['delta'] as num).toDouble(),
  message: json['message'] as String,
  tolerance: (json['tolerance'] as num?)?.toDouble(),
);

Map<String, dynamic> _$SplashConstraintsValidationToJson(
  _SplashConstraintsValidation instance,
) => <String, dynamic>{
  'compliant': instance.compliant,
  'delta': instance.delta,
  'message': instance.message,
  'tolerance': instance.tolerance,
};

_SplashIconConstraints _$SplashIconConstraintsFromJson(
  Map<String, dynamic> json,
) => _SplashIconConstraints(
  fullSize: (json['fullSize'] as num).toDouble(),
  maskDiameter: (json['maskDiameter'] as num).toDouble(),
  recommendedPadding: (json['recommendedPadding'] as num).toDouble(),
  validation: SplashConstraintsValidation.fromJson(
    json['validation'] as Map<String, dynamic>,
  ),
  mode: $enumDecodeNullable(_$SplashModeEnumMap, json['mode']),
  recommendationBasis: json['recommendationBasis'] as String?,
);

Map<String, dynamic> _$SplashIconConstraintsToJson(
  _SplashIconConstraints instance,
) => <String, dynamic>{
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

_SplashAssetModel _$SplashAssetModelFromJson(Map<String, dynamic> json) =>
    _SplashAssetModel(
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
      android12SplashArtifactId: json['android12SplashArtifactId'] as String?,
      iconConstraints: json['iconConstraints'] == null
          ? null
          : SplashIconConstraints.fromJson(
              json['iconConstraints'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SplashAssetModelToJson(_SplashAssetModel instance) =>
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
      'android12SplashArtifactId': instance.android12SplashArtifactId,
      'iconConstraints': instance.iconConstraints,
    };
