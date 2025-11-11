// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_assets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FitPaddingModel _$FitPaddingModelFromJson(Map<String, dynamic> json) =>
    _FitPaddingModel(
      fit: $enumDecodeNullable(_$FitModelEnumMap, json['fit']),
      paddingDp: (json['paddingDp'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FitPaddingModelToJson(_FitPaddingModel instance) =>
    <String, dynamic>{
      'fit': _$FitModelEnumMap[instance.fit],
      'paddingDp': instance.paddingDp,
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

_PlatformParamsModel _$PlatformParamsModelFromJson(Map<String, dynamic> json) =>
    _PlatformParamsModel(
      androidLegacy: json['androidLegacy'] == null
          ? null
          : FitPaddingModel.fromJson(
              json['androidLegacy'] as Map<String, dynamic>,
            ),
      androidAdaptive: json['androidAdaptive'] == null
          ? null
          : FitPaddingModel.fromJson(
              json['androidAdaptive'] as Map<String, dynamic>,
            ),
      ios: json['ios'] == null
          ? null
          : FitPaddingModel.fromJson(json['ios'] as Map<String, dynamic>),
      web: json['web'] == null
          ? null
          : FitPaddingModel.fromJson(json['web'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlatformParamsModelToJson(
  _PlatformParamsModel instance,
) => <String, dynamic>{
  'androidLegacy': instance.androidLegacy,
  'androidAdaptive': instance.androidAdaptive,
  'ios': instance.ios,
  'web': instance.web,
};

_SourceConfigModel _$SourceConfigModelFromJson(Map<String, dynamic> json) =>
    _SourceConfigModel(
      foregroundAssetId: json['foregroundAssetId'] as String?,
      backgroundAssetId: json['backgroundAssetId'] as String?,
      backgroundColorHex: json['backgroundColorHex'] as String?,
    );

Map<String, dynamic> _$SourceConfigModelToJson(_SourceConfigModel instance) =>
    <String, dynamic>{
      'foregroundAssetId': instance.foregroundAssetId,
      'backgroundAssetId': instance.backgroundAssetId,
      'backgroundColorHex': instance.backgroundColorHex,
    };

_OutputArtifactsModel _$OutputArtifactsModelFromJson(
  Map<String, dynamic> json,
) => _OutputArtifactsModel(
  androidLegacyArtifactId: json['androidLegacyArtifactId'] as String?,
  androidAdaptiveForegroundArtifactId:
      json['androidAdaptiveForegroundArtifactId'] as String?,
  androidAdaptiveBackgroundArtifactId:
      json['androidAdaptiveBackgroundArtifactId'] as String?,
  iosArtifactId: json['iosArtifactId'] as String?,
  webArtifactId: json['webArtifactId'] as String?,
);

Map<String, dynamic> _$OutputArtifactsModelToJson(
  _OutputArtifactsModel instance,
) => <String, dynamic>{
  'androidLegacyArtifactId': instance.androidLegacyArtifactId,
  'androidAdaptiveForegroundArtifactId':
      instance.androidAdaptiveForegroundArtifactId,
  'androidAdaptiveBackgroundArtifactId':
      instance.androidAdaptiveBackgroundArtifactId,
  'iosArtifactId': instance.iosArtifactId,
  'webArtifactId': instance.webArtifactId,
};

_LaunchAssetsModel _$LaunchAssetsModelFromJson(Map<String, dynamic> json) =>
    _LaunchAssetsModel(
      id: json['id'] as String,
      applicationId: json['applicationId'] as String,
      themeId: json['themeId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      source: json['source'] == null
          ? null
          : SourceConfigModel.fromJson(json['source'] as Map<String, dynamic>),
      params: json['params'] == null
          ? null
          : PlatformParamsModel.fromJson(
              json['params'] as Map<String, dynamic>,
            ),
      outputsArtifacts: json['outputsArtifacts'] == null
          ? null
          : OutputArtifactsModel.fromJson(
              json['outputsArtifacts'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$LaunchAssetsModelToJson(_LaunchAssetsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applicationId': instance.applicationId,
      'themeId': instance.themeId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'source': instance.source,
      'params': instance.params,
      'outputsArtifacts': instance.outputsArtifacts,
    };

_ValidationSlice _$ValidationSliceFromJson(Map<String, dynamic> json) =>
    _ValidationSlice(
      compliant: json['compliant'] as bool,
      deltaDp: (json['deltaDp'] as num).toDouble(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ValidationSliceToJson(_ValidationSlice instance) =>
    <String, dynamic>{
      'compliant': instance.compliant,
      'deltaDp': instance.deltaDp,
      'message': instance.message,
    };

_ValidationReport _$ValidationReportFromJson(Map<String, dynamic> json) =>
    _ValidationReport(
      androidLegacy: json['androidLegacy'] == null
          ? null
          : ValidationSlice.fromJson(
              json['androidLegacy'] as Map<String, dynamic>,
            ),
      androidAdaptive: json['androidAdaptive'] == null
          ? null
          : ValidationSlice.fromJson(
              json['androidAdaptive'] as Map<String, dynamic>,
            ),
      ios: json['ios'] == null
          ? null
          : ValidationSlice.fromJson(json['ios'] as Map<String, dynamic>),
      web: json['web'] == null
          ? null
          : ValidationSlice.fromJson(json['web'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ValidationReportToJson(_ValidationReport instance) =>
    <String, dynamic>{
      'androidLegacy': instance.androidLegacy,
      'androidAdaptive': instance.androidAdaptive,
      'ios': instance.ios,
      'web': instance.web,
    };

_LaunchAssetsEnvelope _$LaunchAssetsEnvelopeFromJson(
  Map<String, dynamic> json,
) => _LaunchAssetsEnvelope(
  entity: LaunchAssetsModel.fromJson(json['entity'] as Map<String, dynamic>),
  urls: (json['urls'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  validation: json['validation'] == null
      ? null
      : ValidationReport.fromJson(json['validation'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LaunchAssetsEnvelopeToJson(
  _LaunchAssetsEnvelope instance,
) => <String, dynamic>{
  'entity': instance.entity,
  'urls': instance.urls,
  'validation': instance.validation,
};
