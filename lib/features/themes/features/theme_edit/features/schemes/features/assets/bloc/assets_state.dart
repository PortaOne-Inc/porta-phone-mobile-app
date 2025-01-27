part of 'assets_cubit.dart';

enum AssetsStateEnum {
  initial,
  loading;

  bool get isInitial => this == initial;

  bool get isLoading => this == loading;
}

@freezed
class AssetsState with _$AssetsState {
  const factory AssetsState({
    ThemeAssetModel? asset,
    @Default(AssetsStateEnum.initial) AssetsStateEnum status,
  }) = _Initial;
}
