part of 'splash_assets_bloc.dart';

enum SplashAssetsStateEnum {
  initial,
  loading,
  error,
  success;

  bool get isInitial => this == initial;

  bool get isLoading => this == loading;

  bool get isSuccess => this == success;

  bool get isError => this == error;
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
    Object? error,
  }) = _Initial;

  SplashAssetsState._();

  Resource? get selectedForegroundAssetResource =>
      selectedForegroundAsset == null ? null : Resource.url(selectedForegroundAsset!.url!);
}
