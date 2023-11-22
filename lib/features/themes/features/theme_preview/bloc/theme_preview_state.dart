part of 'theme_preview_cubit.dart';

enum ThemePreviewStatus { progress, validation, success, focus, error }

@freezed
class ThemePreviewState with _$ThemePreviewState {
  factory ThemePreviewState({
    ThemePreviewStatus? status,
    ThemeModel? theme,
    Exception? error,
  }) = _ThemePreviewState;
}
