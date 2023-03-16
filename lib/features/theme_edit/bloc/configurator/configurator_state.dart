part of 'configurator_cubit.dart';

@immutable
class ThemePropertyState {
  const ThemePropertyState({
    this.theme,
    this.nameField = const ThemeNameInput.dirty(),
  });

  final ThemeNameInput nameField;

  final AppConfigurationModel? theme;

  bool get isModelAvailable => theme != null;

  Color? get colorPrimary => _parseColor(theme?.colors.primary);

  Color? get colorOnPrimary => _parseColor(theme?.colors.onPrimary);

  Color? get colorSecondary => _parseColor(theme?.colors.secondary);

  Color? get colorSecondaryContainer => _parseColor(theme?.colors.secondaryContainer);

  Color? get colorOnSecondaryContainer => _parseColor(theme?.colors.onSecondaryContainer);

  Color? get colorTertiary => _parseColor(theme?.colors.tertiary);

  Color? get colorError => _parseColor(theme?.colors.error);

  Color? get colorOutline => _parseColor(theme?.colors.outline);

  Color? get colorBackground => _parseColor(theme?.colors.background);

  Color? get colorOnBackground => _parseColor(theme?.colors.onBackground);

  Color? get colorSurface => _parseColor(theme?.colors.surface);

  Color? get colorOnSurface => _parseColor(theme?.colors.onSurface);

  List<Color> get gradientTabColor => _parseColors(theme?.colors.gradientTabColor);

  Color? _parseColor(String? color) {
    if (color == null) {
      return null;
    } else {
      return UtilityColor.tryParseColorFromHex(color);
    }
  }

  List<Color> _parseColors(List<String>? colors) {
    if (colors == null) return [Colors.white, Colors.white];
    return colors
        .map(
          (color) => UtilityColor.tryParseColorFromHex(
            color,
            defaultColor: Colors.transparent,
          )!,
        )
        .toList();
  }

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
    final styles = theme?.commonConfig.copyWith(
      appName: name,
    );
    return copyWith(theme: theme?.copyWith(commonConfig: styles));
  }
}

class ConfiguratorFailure extends ThemePropertyState {
  const ConfiguratorFailure(
    this.message, {
    required super.theme,
  });

  final String message;
}
