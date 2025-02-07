import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_asset_model.freezed.dart';

@freezed
class SplashAssetModel with _$SplashAssetModel {
  const factory SplashAssetModel({
    int? originalAssetId,
    String? pictureUrl,
    String? color,
    @Default(0.0) double padding,
    @Default('scaleDown') String fit,
  }) = _SplashAssetModel;

  const SplashAssetModel._();
}
