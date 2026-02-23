import 'package:freezed_annotation/freezed_annotation.dart';

import 'common.dart';

part 'launch_assets_dto.freezed.dart';

part 'launch_assets_dto.g.dart';

@freezed
sealed class FitPaddingDto with _$FitPaddingDto {
  const factory FitPaddingDto({FitDto? fit, int? paddingDp}) =
      _FitPaddingDto;

  factory FitPaddingDto.fromJson(Map<String, dynamic> json) =>
      _$FitPaddingDtoFromJson(json);
}

@freezed
sealed class PlatformParamsDto with _$PlatformParamsDto {
  const factory PlatformParamsDto({
    FitPaddingDto? androidLegacy,
    FitPaddingDto? androidAdaptive,
    FitPaddingDto? ios,
    FitPaddingDto? web,
  }) = _PlatformParamsDto;

  factory PlatformParamsDto.fromJson(Map<String, dynamic> json) =>
      _$PlatformParamsDtoFromJson(json);
}

@freezed
sealed class SourceConfigDto with _$SourceConfigDto {
  const factory SourceConfigDto({
    String? foregroundAssetId,
    String? backgroundAssetId,
    String? backgroundColorHex,
  }) = _SourceConfigDto;

  factory SourceConfigDto.fromJson(Map<String, dynamic> json) =>
      _$SourceConfigDtoFromJson(json);
}

@freezed
sealed class OutputArtifactsDto with _$OutputArtifactsDto {
  const factory OutputArtifactsDto({
    String? androidLegacyArtifactId,
    String? androidAdaptiveForegroundArtifactId,
    String? androidAdaptiveBackgroundArtifactId,
    String? iosArtifactId,
    String? webArtifactId,
  }) = _OutputArtifactsDto;

  factory OutputArtifactsDto.fromJson(Map<String, dynamic> json) =>
      _$OutputArtifactsDtoFromJson(json);
}

/// Main entity (1:1 with a theme; id == themeId)
@freezed
sealed class LaunchAssetsDto with _$LaunchAssetsDto {
  const factory LaunchAssetsDto({
    required String id,
    required String applicationId,
    required String themeId,
    required String createdAt,
    required String updatedAt,
    SourceConfigDto? source,
    PlatformParamsDto? params,
    OutputArtifactsDto? outputsArtifacts,
  }) = _LaunchAssetsDto;

  factory LaunchAssetsDto.fromJson(Map<String, dynamic> json) =>
      _$LaunchAssetsDtoFromJson(json);
}

@freezed
sealed class ValidationSliceDto with _$ValidationSliceDto {
  const factory ValidationSliceDto({
    required bool compliant,
    required double deltaDp,
    String? message,
  }) = _ValidationSliceDto;

  factory ValidationSliceDto.fromJson(Map<String, dynamic> json) =>
      _$ValidationSliceDtoFromJson(json);
}

@freezed
sealed class ValidationReportDto with _$ValidationReportDto {
  const factory ValidationReportDto({
    ValidationSliceDto? androidLegacy,
    ValidationSliceDto? androidAdaptive,
    ValidationSliceDto? ios,
    ValidationSliceDto? web,
  }) = _ValidationReportDto;

  factory ValidationReportDto.fromJson(Map<String, dynamic> json) =>
      _$ValidationReportDtoFromJson(json);
}

@freezed
sealed class LaunchAssetsEnvelopeDto with _$LaunchAssetsEnvelopeDto {
  const factory LaunchAssetsEnvelopeDto({
    required LaunchAssetsDto entity,
    Map<String, String>? urls,
    ValidationReportDto? validation,
  }) = _LaunchAssetsEnvelopeDto;

  factory LaunchAssetsEnvelopeDto.fromJson(Map<String, dynamic> json) =>
      _$LaunchAssetsEnvelopeDtoFromJson(json);
}

extension LaunchAssetsEnvelopeDtoUrlsX on LaunchAssetsEnvelopeDto {
  String? get androidLegacyUrl => urls?['androidLegacyUrl'];

  String? get androidAdaptiveForegroundUrl =>
      urls?['androidAdaptiveForegroundUrl'];

  String? get iosUrl => urls?['iosUrl'];

  String? get webUrl => urls?['webUrl'];

  String? urlByKey(String key) => urls?[key];
}
