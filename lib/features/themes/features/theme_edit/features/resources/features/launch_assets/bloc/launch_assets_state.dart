part of 'launch_assets_bloc.dart';

enum LaunchAssetsStatus { initial, loading, loaded, failure }

@freezed
sealed class LaunchAssetsState with _$LaunchAssetsState {
  factory LaunchAssetsState({
    required String applicationId,
    required String themeId,
    LaunchAssetsEnvelope? envelope,
    @Default(<AssetModel>[]) List<AssetModel> assets,
    ConstraintsModel? constraints,
    String? selectedBackgroundColorHex,
    AssetModel? selectedForegroundAsset,
    AssetModel? selectedBackgroundAsset,
    @Default(0.0) double paddingAndroidLegacy,
    @Default(0.0) double paddingAndroidAdaptive,
    @Default(0.0) double paddingIOS,
    @Default(0.0) double paddingWEB,
    @Default(LaunchAssetsStatus.initial) LaunchAssetsStatus status,
    @Default(false) bool saving,
    String? error,
  }) = _LaunchAssetsState;

  LaunchAssetsState._();

  bool get isLoading =>
      status == LaunchAssetsStatus.initial ||
      status == LaunchAssetsStatus.loading;

  bool get isBusy => isLoading || saving;

  String? url(String key) => envelope?.urls?[key];
}
