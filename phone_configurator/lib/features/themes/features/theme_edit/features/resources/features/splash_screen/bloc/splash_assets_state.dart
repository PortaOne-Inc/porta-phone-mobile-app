part of 'splash_assets_bloc.dart';

@freezed
sealed class SplashAssetsState with _$SplashAssetsState {
  factory SplashAssetsState({
    required String applicationId,
    required String themeId,
    String? updatedAt,
    SplashAssetModel? existing,
    @Default(<AssetModel>[]) List<AssetModel> assets,
    SplashConstraintsDefaultsModel? constraintsDefaults,
    String? selectedAssetId,
    AssetModel? selectedAsset,
    @Default(0) double padding,
    @Default(0) double android12Padding,
    String? backgroundColorHex,
    @Default(SplashAssetsStatus.initial) SplashAssetsStatus status,
    Object? error,
  }) = _SplashAssetsState;

  const SplashAssetsState._();

  bool get isLoading => status == SplashAssetsStatus.loading;
}
