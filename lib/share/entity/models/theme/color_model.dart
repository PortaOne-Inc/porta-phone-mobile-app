class ColorsModel {
  final int primary;
  final int onPrimary;
  final int secondary;
  final int secondaryContainer;
  final int onSecondaryContainer;
  final int tertiary;
  final int error;
  final int outline;
  final int background;
  final int onBackground;
  final int surface;
  final int onSurface;
  final List<int> gradientTabColor;

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
    final int? primary,
    final int? onPrimary,
    final int? secondary,
    final int? secondaryContainer,
    final int? onSecondaryContainer,
    final int? tertiary,
    final int? error,
    final int? outline,
    final int? background,
    final int? onBackground,
    final int? surface,
    final int? onSurface,
    final List<int>? gradientTabColor,
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

  List<int> asList() => [
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
