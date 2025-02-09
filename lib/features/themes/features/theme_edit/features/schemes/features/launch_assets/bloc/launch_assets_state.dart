part of 'launch_assets_bloc.dart';

enum LaunchAssetsStateEnum {
  initial,
  loading;

  bool get isInitial => this == initial;

  bool get isLoading => this == loading;
}

@freezed
class LaunchAssetsState with _$LaunchAssetsState {
  factory LaunchAssetsState({
    required String applicationId,
    required String themeId,
    @Default(LaunchAssetsStateEnum.initial) LaunchAssetsStateEnum status,
    ThemeAssetModel? selectedForegroundAsset,
    ThemeAssetModel? selectedBackgroundAsset,
    Color? selectedBackgroundColor,
      @Default(BoxFit.scaleDown) BoxFit boxFitAndroidLaunch,
      @Default(BoxFit.scaleDown) BoxFit boxFitAndroidAdaptive,
      @Default(BoxFit.scaleDown) BoxFit boxFitIOS,
      @Default(BoxFit.scaleDown) BoxFit boxFitWeb,
      @Default(0) double paddingAndroidLaunch,
      @Default(0) double paddingAndroidAdaptive,
      @Default(0) double paddingIOS,
      @Default(0) double paddingWEB,
  }) = _Initial;

  LaunchAssetsState._();

  Resource? get selectedForegroundAssetResource =>
      selectedForegroundAsset == null ? null : Resource.url(selectedForegroundAsset!.url!);

  Resource? get selectedBackgroundAssetResource =>
      selectedBackgroundAsset == null ? null : Resource.url(selectedBackgroundAsset!.url!);
}
