import 'package:freezed_annotation/freezed_annotation.dart';

import 'common.dart';

part 'splash_asset_dto.freezed.dart';

part 'splash_asset_dto.g.dart';

enum SplashModeDto { withBackground, withoutBackground }

@freezed
sealed class SplashSourceDto with _$SplashSourceDto {
  const factory SplashSourceDto({
    String? foregroundAssetId,
    String? backgroundAssetId,
    String? backgroundColorHex,
  }) = _SplashSourceDto;

  factory SplashSourceDto.fromJson(Map<String, dynamic> json) =>
      _$SplashSourceDtoFromJson(json);
}

@freezed
sealed class SplashAssetParamsDto with _$SplashAssetParamsDto {
  const factory SplashAssetParamsDto({FitDto? fit, double? padding}) =
      _SplashAssetParamsDto;

  factory SplashAssetParamsDto.fromJson(Map<String, dynamic> json) =>
      _$SplashAssetParamsDtoFromJson(json);
}

@freezed
sealed class SplashConstraintsValidationDto
    with _$SplashConstraintsValidationDto {
  const factory SplashConstraintsValidationDto({
    required bool compliant,
    required double deltaDp,
    required String message,
    double? toleranceDp,
  }) = _SplashConstraintsValidationDto;

  factory SplashConstraintsValidationDto.fromJson(Map<String, dynamic> json) =>
      _$SplashConstraintsValidationDtoFromJson(json);
}

@freezed
sealed class SplashIconConstraintsDto with _$SplashIconConstraintsDto {
  const factory SplashIconConstraintsDto({
    required double fullSizeDp,
    required double maskDiameterDp,
    required double recommendedPaddingDp,
    required SplashConstraintsValidationDto validation,
    @Default(SplashModeDto.withBackground) SplashModeDto mode,
    @Default('safeZone') String recommendationBasis,
  }) = _SplashIconConstraintsDto;

  factory SplashIconConstraintsDto.fromJson(Map<String, dynamic> json) =>
      _$SplashIconConstraintsDtoFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false, toJson: true)
sealed class SplashAssetDto with _$SplashAssetDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory SplashAssetDto({
    required String id, // themeId
    required String applicationId,
    required String themeId,
    SplashSourceDto? source,
    SplashAssetParamsDto? params,
    SplashModeDto? mode,
    SplashOutputsArtifactsDto? outputsArtifacts,
    String? splashArtifactId,
    SplashIconConstraintsDto? iconConstraints,
    String? createdAt,
    String? updatedAt,
    Map<String, String>? urls,
  }) = _SplashAssetDto;

  const SplashAssetDto._();

  factory SplashAssetDto.fromJson(Map<String, dynamic> json) =>
      _$SplashAssetDtoFromJson(json);
}

extension SplashAssetDtoExtension on SplashAssetDto {
  String? get splashUrl => urls?['splashUrl'];

  String? urlByKey(String key) => urls?[key];
}

@freezed
sealed class SplashConstraintsDefaultsSliceDto
    with _$SplashConstraintsDefaultsSliceDto {
  const factory SplashConstraintsDefaultsSliceDto({
    required double fullSizeDp,
    required double maskDiameterDp,
    required double toleranceDp,
  }) = _SplashConstraintsDefaultsSliceDto;

  factory SplashConstraintsDefaultsSliceDto.fromJson(
    Map<String, dynamic> json,
  ) => _$SplashConstraintsDefaultsSliceDtoFromJson(json);
}

@freezed
sealed class SplashConstraintsDefaultsDto with _$SplashConstraintsDefaultsDto {
  const factory SplashConstraintsDefaultsDto({
    required SplashConstraintsDefaultsSliceDto withBackground,
    required SplashConstraintsDefaultsSliceDto withoutBackground,
    SplashConstraintsDefaultsSliceDto? android12,
  }) = _SplashConstraintsDefaultsDto;

  factory SplashConstraintsDefaultsDto.fromJson(Map<String, dynamic> json) =>
      _$SplashConstraintsDefaultsDtoFromJson(json);
}

@freezed
sealed class SplashOutputsArtifactsDto with _$SplashOutputsArtifactsDto {
  const factory SplashOutputsArtifactsDto({
    String? splashArtifactId,
    String? android12SplashArtifactId,
  }) = _SplashOutputsArtifactsDto;

  factory SplashOutputsArtifactsDto.fromJson(Map<String, dynamic> json) =>
      _$SplashOutputsArtifactsDtoFromJson(json);
}
