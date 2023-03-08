class ColorsModel {
  final String primary;
  final String onPrimary;
  final String secondary;
  final String secondaryContainer;
  final String onSecondaryContainer;
  final String tertiary;
  final String error;
  final String outline;
  final String background;
  final String onBackground;
  final String surface;
  final String onSurface;
  final List<String> gradientTabColor;

  ColorsModel(
      {required this.primary,
      required this.secondary,
      required this.onPrimary,
      required this.secondaryContainer,
      required this.onSecondaryContainer,
      required this.tertiary,
      required this.error,
      required this.outline,
      required this.background,
      required this.onBackground,
      required this.surface,
      required this.onSurface,
      this.gradientTabColor = const []});

  ColorsModel copyWith({
    final String? primary,
    final String? onPrimary,
    final String? secondary,
    final String? secondaryContainer,
    final String? onSecondaryContainer,
    final String? tertiary,
    final String? error,
    final String? outline,
    final String? background,
    final String? onBackground,
    final String? surface,
    final String? onSurface,
    final List<String>? gradientTabColor,
  }) {
    return ColorsModel(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      tertiary: tertiary ?? this.tertiary,
      error: error ?? this.error,
      outline: outline ?? this.outline,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      gradientTabColor: gradientTabColor ?? this.gradientTabColor,
    );
  }

  List<String> asList() => [
        primary,
        onPrimary,
        secondary,
        secondaryContainer,
        onSecondaryContainer,
        tertiary,
        error,
        outline,
        background,
        onBackground,
        surface,
        onSurface,
        ...gradientTabColor
      ];
}
