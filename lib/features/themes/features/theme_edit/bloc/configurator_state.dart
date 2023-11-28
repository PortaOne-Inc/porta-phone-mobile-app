part of 'configurator_cubit.dart';

enum ThemePropertyStatus { progress, validation, success, focus, error }

enum ThemePropertyScreens { property, importSvg }

@freezed
class ThemePropertyState with _$ThemePropertyState {
  factory ThemePropertyState({
    ThemePropertyStatus? status,
    ApplicationModel? applicationModel,
    @Default(ThemePreviewScreen.layouts) ThemePreviewScreen themePreviewScreen,
    @Default(ThemePropertyScreens.property) ThemePropertyScreens themePropertyScreens,
    @Default(false) bool isDraft,
    ThemeModel? currentTheme,
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
  ThemeModel? get theme => isDraft ? draftTheme : currentTheme;

  ColorSchemeModel? get colors => theme?.colors;

  ThemePropertyState initTheme({
    ThemeModel? theme,
  }) {
    return copyWith(
      currentTheme: theme ?? currentTheme,
      draftTheme: theme ?? draftTheme,
    );
  }

  ThemePropertyState copy({
    ThemePropertyStatus? status,
    ApplicationModel? applicationModel,
    ThemePreviewScreen? themePreviewScreen,
    ThemePropertyScreens? themePropertyScreens,
    bool? isDraft,
    ThemeModel? theme,
    ThemeNameInput? nameField,
    int? position,
    Exception? error,
  }) {
    final isDraftTheme = isDraft ?? this.isDraft;

    return copyWith(
      status: status ?? this.status,
      applicationModel: applicationModel ?? this.applicationModel,
      themePreviewScreen: themePreviewScreen ?? this.themePreviewScreen,
      themePropertyScreens: themePropertyScreens ?? this.themePropertyScreens,
      isDraft: isDraftTheme,
      currentTheme: !isDraftTheme ? (theme ?? currentTheme) : currentTheme,
      draftTheme: isDraftTheme ? (theme ?? draftTheme) : draftTheme,
      nameField: nameField ?? this.nameField,
      position: position ?? this.position,
      error: error ?? this.error,
    );
  }
}
