part of 'configurator_cubit.dart';

@immutable
class ThemePropertyState {
  const ThemePropertyState({
    required this.theme,
    this.nameField = const ThemeNameInput.dirty(),
  });

  final ThemeNameInput nameField;

  final ThemeModel theme;

  ThemePropertyState copyWith({
    final ThemeModel? theme,
    final FocusModel? focusGroup,
    final ThemeNameInput? nameField,
  }) {
    return ThemePropertyState(
      theme: theme ?? this.theme,
      nameField: nameField ?? this.nameField,
    );
  }

  ThemePropertyState copyWithCommonConfig({
    String? name,
  }) {
    return copyWith(
        theme: theme.copyWith(
      name: name,
    ));
  }
}

class ConfiguratorFailure extends ThemePropertyState {
  const ConfiguratorFailure(
    this.message, {
    required super.theme,
  });

  final String message;
}
