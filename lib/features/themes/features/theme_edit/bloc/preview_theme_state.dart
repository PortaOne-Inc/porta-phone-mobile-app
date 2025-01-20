part of 'preview_theme_cubit.dart';

@freezed
class PreviewThemeState with _$PreviewThemeState {
  const factory PreviewThemeState({
    required bool frameVisible,
    required PreviewType previewType,
    ThemeSettings? theme,
    WidgetPreviewType? requestFocus,
    @Default(ThemePreviewScreen.layouts) ThemePreviewScreen preview,
  }) = _PreviewThemeState;
}
