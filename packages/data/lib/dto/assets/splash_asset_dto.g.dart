// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_asset_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SplashSourceDtoImpl _$$SplashSourceDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SplashSourceDtoImpl(
      foregroundAssetId: json['foregroundAssetId'] as String?,
      backgroundAssetId: json['backgroundAssetId'] as String?,
      backgroundColorHex: json['backgroundColorHex'] as String?,
    );

Map<String, dynamic> _$$SplashSourceDtoImplToJson(
        _$SplashSourceDtoImpl instance) =>
    <String, dynamic>{
      'foregroundAssetId': instance.foregroundAssetId,
      'backgroundAssetId': instance.backgroundAssetId,
      'backgroundColorHex': instance.backgroundColorHex,
    };

_$SplashAssetParamsDtoImpl _$$SplashAssetParamsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SplashAssetParamsDtoImpl(
      fit: $enumDecodeNullable(_$FitDtoEnumMap, json['fit']),
      padding: (json['padding'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SplashAssetParamsDtoImplToJson(
        _$SplashAssetParamsDtoImpl instance) =>
    <String, dynamic>{
      'fit': _$FitDtoEnumMap[instance.fit],
      'padding': instance.padding,
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

_$SplashConstraintsValidationDtoImpl
    _$$SplashConstraintsValidationDtoImplFromJson(Map<String, dynamic> json) =>
        _$SplashConstraintsValidationDtoImpl(
          compliant: json['compliant'] as bool,
          deltaDp: (json['deltaDp'] as num).toDouble(),
          message: json['message'] as String,
          toleranceDp: (json['toleranceDp'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$$SplashConstraintsValidationDtoImplToJson(
        _$SplashConstraintsValidationDtoImpl instance) =>
    <String, dynamic>{
      'compliant': instance.compliant,
      'deltaDp': instance.deltaDp,
      'message': instance.message,
      'toleranceDp': instance.toleranceDp,
    };

_$SplashIconConstraintsDtoImpl _$$SplashIconConstraintsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SplashIconConstraintsDtoImpl(
      fullSizeDp: (json['fullSizeDp'] as num).toDouble(),
      maskDiameterDp: (json['maskDiameterDp'] as num).toDouble(),
      recommendedPaddingDp: (json['recommendedPaddingDp'] as num).toDouble(),
      validation: SplashConstraintsValidationDto.fromJson(
          json['validation'] as Map<String, dynamic>),
      mode: $enumDecodeNullable(_$SplashModeDtoEnumMap, json['mode']) ??
          SplashModeDto.withBackground,
      recommendationBasis: json['recommendationBasis'] as String? ?? 'safeZone',
    );

Map<String, dynamic> _$$SplashIconConstraintsDtoImplToJson(
        _$SplashIconConstraintsDtoImpl instance) =>
    <String, dynamic>{
      'fullSizeDp': instance.fullSizeDp,
      'maskDiameterDp': instance.maskDiameterDp,
      'recommendedPaddingDp': instance.recommendedPaddingDp,
      'validation': instance.validation,
      'mode': _$SplashModeDtoEnumMap[instance.mode]!,
      'recommendationBasis': instance.recommendationBasis,
    };

const _$SplashModeDtoEnumMap = {
  SplashModeDto.withBackground: 'withBackground',
  SplashModeDto.withoutBackground: 'withoutBackground',
};

_$SplashAssetDtoImpl _$$SplashAssetDtoImplFromJson(Map<String, dynamic> json) =>
    _$SplashAssetDtoImpl(
      id: json['id'] as String,
      applicationId: json['applicationId'] as String,
      themeId: json['themeId'] as String,
      source: json['source'] == null
          ? null
          : SplashSourceDto.fromJson(json['source'] as Map<String, dynamic>),
      params: json['params'] == null
          ? null
          : SplashAssetParamsDto.fromJson(
              json['params'] as Map<String, dynamic>),
      mode: $enumDecodeNullable(_$SplashModeDtoEnumMap, json['mode']),
      outputsArtifacts: json['outputsArtifacts'] == null
          ? null
          : SplashOutputsArtifactsDto.fromJson(
              json['outputsArtifacts'] as Map<String, dynamic>),
      splashArtifactId: json['splashArtifactId'] as String?,
      iconConstraints: json['iconConstraints'] == null
          ? null
          : SplashIconConstraintsDto.fromJson(
              json['iconConstraints'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      urls: (json['urls'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$SplashAssetDtoImplToJson(
        _$SplashAssetDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applicationId': instance.applicationId,
      'themeId': instance.themeId,
      if (instance.source case final value?) 'source': value,
      if (instance.params case final value?) 'params': value,
      if (_$SplashModeDtoEnumMap[instance.mode] case final value?)
        'mode': value,
      if (instance.outputsArtifacts case final value?)
        'outputsArtifacts': value,
      if (instance.splashArtifactId case final value?)
        'splashArtifactId': value,
      if (instance.iconConstraints case final value?) 'iconConstraints': value,
      if (instance.createdAt case final value?) 'createdAt': value,
      if (instance.updatedAt case final value?) 'updatedAt': value,
      if (instance.urls case final value?) 'urls': value,
    };

_$SplashConstraintsDefaultsSliceDtoImpl
    _$$SplashConstraintsDefaultsSliceDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$SplashConstraintsDefaultsSliceDtoImpl(
          fullSizeDp: (json['fullSizeDp'] as num).toDouble(),
          maskDiameterDp: (json['maskDiameterDp'] as num).toDouble(),
          toleranceDp: (json['toleranceDp'] as num).toDouble(),
        );

Map<String, dynamic> _$$SplashConstraintsDefaultsSliceDtoImplToJson(
        _$SplashConstraintsDefaultsSliceDtoImpl instance) =>
    <String, dynamic>{
      'fullSizeDp': instance.fullSizeDp,
      'maskDiameterDp': instance.maskDiameterDp,
      'toleranceDp': instance.toleranceDp,
    };

_$SplashConstraintsDefaultsDtoImpl _$$SplashConstraintsDefaultsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SplashConstraintsDefaultsDtoImpl(
      withBackground: SplashConstraintsDefaultsSliceDto.fromJson(
          json['withBackground'] as Map<String, dynamic>),
      withoutBackground: SplashConstraintsDefaultsSliceDto.fromJson(
          json['withoutBackground'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SplashConstraintsDefaultsDtoImplToJson(
        _$SplashConstraintsDefaultsDtoImpl instance) =>
    <String, dynamic>{
      'withBackground': instance.withBackground,
      'withoutBackground': instance.withoutBackground,
    };

_$SplashOutputsArtifactsDtoImpl _$$SplashOutputsArtifactsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SplashOutputsArtifactsDtoImpl(
      splashArtifactId: json['splashArtifactId'] as String?,
    );

Map<String, dynamic> _$$SplashOutputsArtifactsDtoImplToJson(
        _$SplashOutputsArtifactsDtoImpl instance) =>
    <String, dynamic>{
      'splashArtifactId': instance.splashArtifactId,
    };
