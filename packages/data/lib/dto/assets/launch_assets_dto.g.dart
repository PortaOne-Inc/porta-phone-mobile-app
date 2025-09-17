// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_assets_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FitPaddingDtoImpl _$$FitPaddingDtoImplFromJson(Map<String, dynamic> json) =>
    _$FitPaddingDtoImpl(
      fit: $enumDecodeNullable(_$FitDtoEnumMap, json['fit']),
      paddingDp: (json['paddingDp'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$FitPaddingDtoImplToJson(_$FitPaddingDtoImpl instance) =>
    <String, dynamic>{
      'fit': _$FitDtoEnumMap[instance.fit],
      'paddingDp': instance.paddingDp,
    };

const _$FitDtoEnumMap = {
  FitDto.contain: 'contain',
  FitDto.cover: 'cover',
  FitDto.fill: 'fill',
  FitDto.none: 'none',
  FitDto.scaleDown: 'scaleDown',
  FitDto.fitWidth: 'fitWidth',
  FitDto.fitHeight: 'fitHeight',
};

_$PlatformParamsDtoImpl _$$PlatformParamsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PlatformParamsDtoImpl(
      androidLegacy: json['androidLegacy'] == null
          ? null
          : FitPaddingDto.fromJson(
              json['androidLegacy'] as Map<String, dynamic>),
      androidAdaptive: json['androidAdaptive'] == null
          ? null
          : FitPaddingDto.fromJson(
              json['androidAdaptive'] as Map<String, dynamic>),
      ios: json['ios'] == null
          ? null
          : FitPaddingDto.fromJson(json['ios'] as Map<String, dynamic>),
      web: json['web'] == null
          ? null
          : FitPaddingDto.fromJson(json['web'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlatformParamsDtoImplToJson(
        _$PlatformParamsDtoImpl instance) =>
    <String, dynamic>{
      'androidLegacy': instance.androidLegacy,
      'androidAdaptive': instance.androidAdaptive,
      'ios': instance.ios,
      'web': instance.web,
    };

_$SourceConfigDtoImpl _$$SourceConfigDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SourceConfigDtoImpl(
      foregroundAssetId: json['foregroundAssetId'] as String?,
      backgroundAssetId: json['backgroundAssetId'] as String?,
      backgroundColorHex: json['backgroundColorHex'] as String?,
    );

Map<String, dynamic> _$$SourceConfigDtoImplToJson(
        _$SourceConfigDtoImpl instance) =>
    <String, dynamic>{
      'foregroundAssetId': instance.foregroundAssetId,
      'backgroundAssetId': instance.backgroundAssetId,
      'backgroundColorHex': instance.backgroundColorHex,
    };

_$OutputArtifactsDtoImpl _$$OutputArtifactsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OutputArtifactsDtoImpl(
      androidLegacyArtifactId: json['androidLegacyArtifactId'] as String?,
      androidAdaptiveForegroundArtifactId:
          json['androidAdaptiveForegroundArtifactId'] as String?,
      androidAdaptiveBackgroundArtifactId:
          json['androidAdaptiveBackgroundArtifactId'] as String?,
      iosArtifactId: json['iosArtifactId'] as String?,
      webArtifactId: json['webArtifactId'] as String?,
    );

Map<String, dynamic> _$$OutputArtifactsDtoImplToJson(
        _$OutputArtifactsDtoImpl instance) =>
    <String, dynamic>{
      'androidLegacyArtifactId': instance.androidLegacyArtifactId,
      'androidAdaptiveForegroundArtifactId':
          instance.androidAdaptiveForegroundArtifactId,
      'androidAdaptiveBackgroundArtifactId':
          instance.androidAdaptiveBackgroundArtifactId,
      'iosArtifactId': instance.iosArtifactId,
      'webArtifactId': instance.webArtifactId,
    };

_$LaunchAssetsDtoImpl _$$LaunchAssetsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$LaunchAssetsDtoImpl(
      id: json['id'] as String,
      applicationId: json['applicationId'] as String,
      themeId: json['themeId'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      source: json['source'] == null
          ? null
          : SourceConfigDto.fromJson(json['source'] as Map<String, dynamic>),
      params: json['params'] == null
          ? null
          : PlatformParamsDto.fromJson(json['params'] as Map<String, dynamic>),
      outputsArtifacts: json['outputsArtifacts'] == null
          ? null
          : OutputArtifactsDto.fromJson(
              json['outputsArtifacts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LaunchAssetsDtoImplToJson(
        _$LaunchAssetsDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applicationId': instance.applicationId,
      'themeId': instance.themeId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'source': instance.source,
      'params': instance.params,
      'outputsArtifacts': instance.outputsArtifacts,
    };

_$ValidationSliceDtoImpl _$$ValidationSliceDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ValidationSliceDtoImpl(
      compliant: json['compliant'] as bool,
      deltaDp: (json['deltaDp'] as num).toDouble(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$ValidationSliceDtoImplToJson(
        _$ValidationSliceDtoImpl instance) =>
    <String, dynamic>{
      'compliant': instance.compliant,
      'deltaDp': instance.deltaDp,
      'message': instance.message,
    };

_$ValidationReportDtoImpl _$$ValidationReportDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ValidationReportDtoImpl(
      androidLegacy: json['androidLegacy'] == null
          ? null
          : ValidationSliceDto.fromJson(
              json['androidLegacy'] as Map<String, dynamic>),
      androidAdaptive: json['androidAdaptive'] == null
          ? null
          : ValidationSliceDto.fromJson(
              json['androidAdaptive'] as Map<String, dynamic>),
      ios: json['ios'] == null
          ? null
          : ValidationSliceDto.fromJson(json['ios'] as Map<String, dynamic>),
      web: json['web'] == null
          ? null
          : ValidationSliceDto.fromJson(json['web'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ValidationReportDtoImplToJson(
        _$ValidationReportDtoImpl instance) =>
    <String, dynamic>{
      'androidLegacy': instance.androidLegacy,
      'androidAdaptive': instance.androidAdaptive,
      'ios': instance.ios,
      'web': instance.web,
    };

_$LaunchAssetsEnvelopeDtoImpl _$$LaunchAssetsEnvelopeDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$LaunchAssetsEnvelopeDtoImpl(
      entity: LaunchAssetsDto.fromJson(json['entity'] as Map<String, dynamic>),
      urls: (json['urls'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      validation: json['validation'] == null
          ? null
          : ValidationReportDto.fromJson(
              json['validation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LaunchAssetsEnvelopeDtoImplToJson(
        _$LaunchAssetsEnvelopeDtoImpl instance) =>
    <String, dynamic>{
      'entity': instance.entity,
      'urls': instance.urls,
      'validation': instance.validation,
    };
