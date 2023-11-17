part of 'configurator_cubit.dart';

enum ThemePropertyStatus { progress, validation, success, focus, error }

@freezed
class ThemePropertyState with _$ThemePropertyState {
  factory ThemePropertyState({
    ThemePropertyStatus? status,
    @Default(ThemePreviewScreen.layouts) ThemePreviewScreen themePreviewScreen,
    @Default(false) bool isDraft,
    ThemeModel? theme,
    ThemeModel? draftTheme,
    ThemeNameInput? nameField,
    int? position,
    Exception? error,
  }) = _ThemePropertyState;
}

extension ThemePropertyStateExtension on ThemePropertyState {
  bool get isProgress => status == ThemePropertyStatus.progress;

  bool get isHasError => status == ThemePropertyStatus.error;

  bool get isHasFocus => status == ThemePropertyStatus.focus && position != null;
}

extension ThemePropertyThemeExtension on ThemePropertyState {
  ColorSchemeModel? get colors => theme?.colors;
}
