import 'package:freezed_annotation/freezed_annotation.dart';

import 'common.dart';

part 'splash_asset_model.freezed.dart';

part 'splash_asset_model.g.dart';

enum SplashMode { withBackground, withoutBackground }

@freezed
sealed class SplashSource with _$SplashSource {
  const factory SplashSource({
    String? foregroundAssetId,
    String? backgroundAssetId,
    String? backgroundColorHex,
  }) = _SplashSource;

  factory SplashSource.fromJson(Map<String, dynamic> json) =>
      _$SplashSourceFromJson(json);
}

@freezed
sealed class SplashAssetParams with _$SplashAssetParams {
  const factory SplashAssetParams({FitModel? fit, double? padding}) =
      _SplashAssetParams;

  factory SplashAssetParams.fromJson(Map<String, dynamic> json) =>
      _$SplashAssetParamsFromJson(json);
}

@freezed
sealed class SplashConstraintsValidation with _$SplashConstraintsValidation {
  const factory SplashConstraintsValidation({
    required bool compliant,
    required double delta,
    required String message,
    double? tolerance,
  }) = _SplashConstraintsValidation;

  factory SplashConstraintsValidation.fromJson(Map<String, dynamic> json) =>
      _$SplashConstraintsValidationFromJson(json);
}

@freezed
sealed class SplashIconConstraints with _$SplashIconConstraints {
  const factory SplashIconConstraints({
    required double fullSize,
    required double maskDiameter,
    required double recommendedPadding,
    required SplashConstraintsValidation validation,
    SplashMode? mode,
    String? recommendationBasis,
  }) = _SplashIconConstraints;

  factory SplashIconConstraints.fromJson(Map<String, dynamic> json) =>
      _$SplashIconConstraintsFromJson(json);
}

@freezed
sealed class SplashAssetModel with _$SplashAssetModel {
  const factory SplashAssetModel({
    required String id,
    required String applicationId,
    required String themeId,

    /// ISO 8601 timestamps
    required String createdAt,
    required String updatedAt,

    /// Source config (optional foreground/background/color)
    SplashSource? source,

    /// Render parameters
    SplashAssetParams? params,

    /// Mode (withBackground / withoutBackground)
    SplashMode? mode,

    /// outputsArtifacts.splashArtifactId
    String? splashArtifactId,

    /// Computed constraints & validation
    SplashIconConstraints? iconConstraints,
  }) = _SplashAssetModel;

  factory SplashAssetModel.fromJson(Map<String, dynamic> json) =>
      _$SplashAssetModelFromJson(json);
}
