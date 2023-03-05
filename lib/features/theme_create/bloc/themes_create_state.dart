part of 'themes_create_cubit.dart';

@immutable
class ThemesCreateState {
  const ThemesCreateState({this.themes = const [], this.defaultTheme, this.nameField = const ThemeNameInput.pure()});

  final List<ThemeModel> themes;
  final ThemeModel? defaultTheme;
  final ThemeNameInput nameField;

  Color? get colorPrimary => _parseColor(defaultTheme?.colors.primary);

  Color? _parseColor(int? color) => color == null ? null : Color(color);

  ThemesCreateState copyWith({
    final List<ThemeModel>? themes,
    final ThemeNameInput? nameField,
    final ThemeModel? defaultTheme,
  }) {
    return ThemesCreateState(
      defaultTheme: defaultTheme ?? this.defaultTheme,
      themes: themes ?? this.themes,
      nameField: nameField ?? this.nameField,

    );
  }
}

class NavigateToConfigurator extends ThemesCreateState {
  const NavigateToConfigurator({required super.themes, required super.defaultTheme});
}

class LoadingConfigurator extends ThemesCreateState {
  const LoadingConfigurator({required super.themes, required super.defaultTheme});
}

class ThemesCreateFailure extends ThemesCreateState {
  const ThemesCreateFailure({required this.message, required super.themes, required super.defaultTheme});

  final String message;
}
