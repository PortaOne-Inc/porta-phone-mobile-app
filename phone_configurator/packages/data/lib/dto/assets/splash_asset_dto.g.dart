// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_asset_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SplashSourceDto _$SplashSourceDtoFromJson(Map<String, dynamic> json) =>
    _SplashSourceDto(
      foregroundAssetId: json['foregroundAssetId'] as String?,
      backgroundAssetId: json['backgroundAssetId'] as String?,
      backgroundColorHex: json['backgroundColorHex'] as String?,
    );

Map<String, dynamic> _$SplashSourceDtoToJson(_SplashSourceDto instance) =>
    <String, dynamic>{
      'foregroundAssetId': instance.foregroundAssetId,
      'backgroundAssetId': instance.backgroundAssetId,
      'backgroundColorHex': instance.backgroundColorHex,
    };

_SplashAssetParamsDto _$SplashAssetParamsDtoFromJson(
  Map<String, dynamic> json,
) => _SplashAssetParamsDto(
  fit: $enumDecodeNullable(_$FitDtoEnumMap, json['fit']),
  padding: (json['padding'] as num?)?.toDouble(),
);

Map<String, dynamic> _$SplashAssetParamsDtoToJson(
  _SplashAssetParamsDto instance,
) => <String, dynamic>{
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

_SplashConstraintsValidationDto _$SplashConstraintsValidationDtoFromJson(
  Map<String, dynamic> json,
) => _SplashConstraintsValidationDto(
  compliant: json['compliant'] as bool,
  deltaDp: (json['deltaDp'] as num).toDouble(),
  message: json['message'] as String,
  toleranceDp: (json['toleranceDp'] as num?)?.toDouble(),
);

Map<String, dynamic> _$SplashConstraintsValidationDtoToJson(
  _SplashConstraintsValidationDto instance,
) => <String, dynamic>{
  'compliant': instance.compliant,
  'deltaDp': instance.deltaDp,
  'message': instance.message,
  'toleranceDp': instance.toleranceDp,
};

_SplashIconConstraintsDto _$SplashIconConstraintsDtoFromJson(
  Map<String, dynamic> json,
) => _SplashIconConstraintsDto(
  fullSizeDp: (json['fullSizeDp'] as num).toDouble(),
  maskDiameterDp: (json['maskDiameterDp'] as num).toDouble(),
  recommendedPaddingDp: (json['recommendedPaddingDp'] as num).toDouble(),
  validation: SplashConstraintsValidationDto.fromJson(
    json['validation'] as Map<String, dynamic>,
  ),
  mode:
      $enumDecodeNullable(_$SplashModeDtoEnumMap, json['mode']) ??
      SplashModeDto.withBackground,
  recommendationBasis: json['recommendationBasis'] as String? ?? 'safeZone',
);

Map<String, dynamic> _$SplashIconConstraintsDtoToJson(
  _SplashIconConstraintsDto instance,
) => <String, dynamic>{
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

_SplashAssetDto _$SplashAssetDtoFromJson(Map<String, dynamic> json) =>
    _SplashAssetDto(
      id: json['id'] as String,
      applicationId: json['applicationId'] as String,
      themeId: json['themeId'] as String,
      source: json['source'] == null
          ? null
          : SplashSourceDto.fromJson(json['source'] as Map<String, dynamic>),
      params: json['params'] == null
          ? null
          : SplashAssetParamsDto.fromJson(
              json['params'] as Map<String, dynamic>,
            ),
      mode: $enumDecodeNullable(_$SplashModeDtoEnumMap, json['mode']),
      outputsArtifacts: json['outputsArtifacts'] == null
          ? null
          : SplashOutputsArtifactsDto.fromJson(
              json['outputsArtifacts'] as Map<String, dynamic>,
            ),
      splashArtifactId: json['splashArtifactId'] as String?,
      iconConstraints: json['iconConstraints'] == null
          ? null
          : SplashIconConstraintsDto.fromJson(
              json['iconConstraints'] as Map<String, dynamic>,
            ),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      urls: (json['urls'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$SplashAssetDtoToJson(_SplashAssetDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applicationId': instance.applicationId,
      'themeId': instance.themeId,
      'source': ?instance.source,
      'params': ?instance.params,
      'mode': ?_$SplashModeDtoEnumMap[instance.mode],
      'outputsArtifacts': ?instance.outputsArtifacts,
      'splashArtifactId': ?instance.splashArtifactId,
      'iconConstraints': ?instance.iconConstraints,
      'createdAt': ?instance.createdAt,
      'updatedAt': ?instance.updatedAt,
      'urls': ?instance.urls,
    };

_SplashConstraintsDefaultsSliceDto _$SplashConstraintsDefaultsSliceDtoFromJson(
  Map<String, dynamic> json,
) => _SplashConstraintsDefaultsSliceDto(
  fullSizeDp: (json['fullSizeDp'] as num).toDouble(),
  maskDiameterDp: (json['maskDiameterDp'] as num).toDouble(),
  toleranceDp: (json['toleranceDp'] as num).toDouble(),
);

Map<String, dynamic> _$SplashConstraintsDefaultsSliceDtoToJson(
  _SplashConstraintsDefaultsSliceDto instance,
) => <String, dynamic>{
  'fullSizeDp': instance.fullSizeDp,
  'maskDiameterDp': instance.maskDiameterDp,
  'toleranceDp': instance.toleranceDp,
};

_SplashConstraintsDefaultsDto _$SplashConstraintsDefaultsDtoFromJson(
  Map<String, dynamic> json,
) => _SplashConstraintsDefaultsDto(
  withBackground: SplashConstraintsDefaultsSliceDto.fromJson(
    json['withBackground'] as Map<String, dynamic>,
  ),
  withoutBackground: SplashConstraintsDefaultsSliceDto.fromJson(
    json['withoutBackground'] as Map<String, dynamic>,
  ),
  android12: json['android12'] == null
      ? null
      : SplashConstraintsDefaultsSliceDto.fromJson(
          json['android12'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$SplashConstraintsDefaultsDtoToJson(
  _SplashConstraintsDefaultsDto instance,
) => <String, dynamic>{
  'withBackground': instance.withBackground,
  'withoutBackground': instance.withoutBackground,
  'android12': instance.android12,
};

_SplashOutputsArtifactsDto _$SplashOutputsArtifactsDtoFromJson(
  Map<String, dynamic> json,
) => _SplashOutputsArtifactsDto(
  splashArtifactId: json['splashArtifactId'] as String?,
  android12SplashArtifactId: json['android12SplashArtifactId'] as String?,
);

Map<String, dynamic> _$SplashOutputsArtifactsDtoToJson(
  _SplashOutputsArtifactsDto instance,
) => <String, dynamic>{
  'splashArtifactId': instance.splashArtifactId,
  'android12SplashArtifactId': instance.android12SplashArtifactId,
};
