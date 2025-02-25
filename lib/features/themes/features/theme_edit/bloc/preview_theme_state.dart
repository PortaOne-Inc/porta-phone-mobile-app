part of 'preview_theme_cubit.dart';

@freezed
class PreviewThemeState with _$PreviewThemeState {
  const factory PreviewThemeState({
    required bool frameVisible,
    required PreviewType previewType,
  }) = _PreviewThemeState;
}
