part of 'preview_theme_cubit.dart';

@freezed
class PreviewThemeState with _$PreviewThemeState {
  const factory PreviewThemeState({
    ThemeSettings? theme,
    required bool frameVisible,
    required PreviewType previewType,
    WidgetPreviewType? requestFocus,
    @Default(ThemePreviewScreen.layouts) ThemePreviewScreen preview,
  }) = _PreviewThemeState;
}
