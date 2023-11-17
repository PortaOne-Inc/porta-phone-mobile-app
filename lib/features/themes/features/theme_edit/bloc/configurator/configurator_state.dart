part of 'configurator_cubit.dart';

enum ThemePropertyStatus { progress, validation, success, focus, error }

@freezed
class ThemePropertyState with _$ThemePropertyState {
  factory ThemePropertyState({
    ThemePropertyStatus? status,
    ThemeModel? theme,
    ThemeNameInput? nameField,
    int? position,
    Exception? error,
  }) = _ThemePropertyState;
}

extension ThemePropertyStateExtension on ThemePropertyState {
  ColorSchemeModel? get colors => theme?.colors;

  bool get isProgress => status == ThemePropertyStatus.progress;

  bool get isHasError => status == ThemePropertyStatus.error;

  bool get isHasFocus => status == ThemePropertyStatus.focus && position != null;
}
