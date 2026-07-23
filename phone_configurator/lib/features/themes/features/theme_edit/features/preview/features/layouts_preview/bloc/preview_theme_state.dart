part of 'preview_theme_cubit.dart';

@freezed
sealed class PreviewThemeState with _$PreviewThemeState {
  const factory PreviewThemeState({
    required bool frameVisible,
    required PreviewMode mode,
    @Default(<String, String>{}) Map<String, String> dartDefineOverrides,
  }) = _PreviewThemeState;
}
