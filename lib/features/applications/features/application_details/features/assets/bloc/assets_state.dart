// assets_state.dart
part of 'assets_cubit.dart';

enum AssetsStatus { initial, loading, loaded, failure }

@freezed
sealed class AssetsState with _$AssetsState {
  const factory AssetsState({
    required String applicationId,
    @Default(AssetsStatus.initial) AssetsStatus status,
    @Default(<AssetModel>[]) List<AssetModel> assets,
    String? errorMessage,

    // create flow
    @Default(false) bool creating,
    String? createError,

    // delete flow
    @Default(false) bool deleting,
    String? deleteError,
    String? deletingAssetId,

    // filters
    @Default(false) bool lockFilters,
  }) = _AssetsState;
}
