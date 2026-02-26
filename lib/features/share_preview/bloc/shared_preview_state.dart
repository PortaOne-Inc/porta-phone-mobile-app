part of 'shared_preview_cubit.dart';

@freezed
sealed class SharedPreviewState with _$SharedPreviewState {
  const factory SharedPreviewState.loading() = _Loading;
  const factory SharedPreviewState.loaded(SharedThemePreviewModel data) =
      _Loaded;
  const factory SharedPreviewState.error(String message) = _Error;
}
