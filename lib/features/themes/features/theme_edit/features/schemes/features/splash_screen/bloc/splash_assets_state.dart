part of 'splash_assets_bloc.dart';

enum SplashAssetsStateEnum {
  initial,
  loading;

  bool get isInitial => this == initial;

  bool get isLoading => this == loading;
}

@freezed
class SplashAssetsState with _$SplashAssetsState {
  factory SplashAssetsState({
    required String applicationId,
    required String themeId,
    ThemeAssetModel? selectedForegroundAsset,
    Color? backgroundColor,
    @Default(SplashAssetsStateEnum.initial) SplashAssetsStateEnum status,
    @Default(BoxFit.scaleDown) BoxFit fit,
    @Default(0) double padding,
  }) = _Initial;

  SplashAssetsState._();

  Resource? get selectedForegroundAssetResource =>
      selectedForegroundAsset == null ? null : Resource.url(selectedForegroundAsset!.url!);
}
