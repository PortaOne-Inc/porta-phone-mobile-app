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
    @Default(false) bool lockFilters,
    @Default(ThemeAssetType.values) List<ThemeAssetType> filters,
  }) = _Initial;
}
