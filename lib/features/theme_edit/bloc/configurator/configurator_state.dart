part of 'configurator_cubit.dart';

@immutable
class ThemePropertyState {
  const ThemePropertyState({
    required this.theme,
    this.nameField = const ThemeNameInput.dirty(),
  });

  final ThemeNameInput nameField;

  final AppConfigurationModel theme;

  ThemePropertyState copyWith({
    final AppConfigurationModel? theme,
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
    final styles = theme.commonConfig?.copyWith(
      appName: name,
    );
    return copyWith(theme: theme.copyWith(commonConfig: styles));
  }
}

class ConfiguratorFailure extends ThemePropertyState {
  const ConfiguratorFailure(
    this.message, {
    required super.theme,
  });

  final String message;
}
