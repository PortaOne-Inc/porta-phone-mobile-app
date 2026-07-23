import 'package:freezed_annotation/freezed_annotation.dart';

import 'common.dart';

part 'launch_assets_model.freezed.dart';

part 'launch_assets_model.g.dart';

@freezed
sealed class FitPaddingModel with _$FitPaddingModel {
  const factory FitPaddingModel({FitModel? fit, double? paddingDp}) =
      _FitPaddingModel;

  factory FitPaddingModel.fromJson(Map<String, dynamic> json) =>
      _$FitPaddingModelFromJson(json);
}

@freezed
sealed class PlatformParamsModel with _$PlatformParamsModel {
  const factory PlatformParamsModel({
    FitPaddingModel? androidLegacy,
    FitPaddingModel? androidAdaptive,
    FitPaddingModel? ios,
    FitPaddingModel? web,
  }) = _PlatformParamsModel;

  factory PlatformParamsModel.fromJson(Map<String, dynamic> json) =>
      _$PlatformParamsModelFromJson(json);
}

@freezed
sealed class SourceConfigModel with _$SourceConfigModel {
  const factory SourceConfigModel({
    String? foregroundAssetId,
    String? backgroundAssetId,
    String? backgroundColorHex,
  }) = _SourceConfigModel;

  factory SourceConfigModel.fromJson(Map<String, dynamic> json) =>
      _$SourceConfigModelFromJson(json);
}

@freezed
sealed class OutputArtifactsModel with _$OutputArtifactsModel {
  const factory OutputArtifactsModel({
    String? androidLegacyArtifactId,
    String? androidAdaptiveForegroundArtifactId,
    String? androidAdaptiveBackgroundArtifactId,
    String? iosArtifactId,
    String? webArtifactId,
  }) = _OutputArtifactsModel;

  factory OutputArtifactsModel.fromJson(Map<String, dynamic> json) =>
      _$OutputArtifactsModelFromJson(json);
}

@freezed
sealed class LaunchAssetsModel with _$LaunchAssetsModel {
  const factory LaunchAssetsModel({
    required String id,
    required String applicationId,
    required String themeId,
    required DateTime createdAt,
    required DateTime updatedAt,
    SourceConfigModel? source,
    PlatformParamsModel? params,
    OutputArtifactsModel? outputsArtifacts,
  }) = _LaunchAssetsModel;

  factory LaunchAssetsModel.fromJson(Map<String, dynamic> json) =>
      _$LaunchAssetsModelFromJson(json);
}

@freezed
sealed class ValidationSlice with _$ValidationSlice {
  const factory ValidationSlice({
    required bool compliant,
    required double deltaDp,
    String? message,
  }) = _ValidationSlice;

  factory ValidationSlice.fromJson(Map<String, dynamic> json) =>
      _$ValidationSliceFromJson(json);
}

@freezed
sealed class ValidationReport with _$ValidationReport {
  const factory ValidationReport({
    ValidationSlice? androidLegacy,
    ValidationSlice? androidAdaptive,
    ValidationSlice? ios,
    ValidationSlice? web,
  }) = _ValidationReport;

  factory ValidationReport.fromJson(Map<String, dynamic> json) =>
      _$ValidationReportFromJson(json);
}

@freezed
sealed class LaunchAssetsEnvelope with _$LaunchAssetsEnvelope {
  const factory LaunchAssetsEnvelope({
    required LaunchAssetsModel entity,
    Map<String, String>? urls,
    ValidationReport? validation,
  }) = _LaunchAssetsEnvelope;

  factory LaunchAssetsEnvelope.fromJson(Map<String, dynamic> json) =>
      _$LaunchAssetsEnvelopeFromJson(json);
}
