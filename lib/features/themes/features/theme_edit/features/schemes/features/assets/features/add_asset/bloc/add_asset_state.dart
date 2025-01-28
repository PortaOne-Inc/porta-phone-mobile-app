part of 'add_asset_cubit.dart';

enum AddAssetStateEnum {
  initial,
  loading;

  bool get isInitial => this == initial;

  bool get isLoading => this == loading;
}

@freezed
class AddAssetState with _$AddAssetState {
  const factory AddAssetState({
    ThemeAssetModel? asset,
    @Default(AddAssetStateEnum.initial) AddAssetStateEnum status,
  }) = _Initial;
}
