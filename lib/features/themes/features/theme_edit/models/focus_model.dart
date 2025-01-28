class FocusModel {
  FocusModel({required this.groups});
  static const String colorPrimary = 'a1';
  static const String colorOnPrimary = 'colorOnPrimary';
  static const String colorSecondary = 'colorSecondary';
  static const String colorSecondaryContainer = 'colorSecondaryContainer';
  static const String colorOnSecondaryContainer = 'colorOnSecondaryContainer';
  static const String colorTertiary = 'colorTertiary';
  static const String colorError = 'colorError';
  static const String colorOutline = 'colorOutline';
  static const String colorBackground = 'a2';
  static const String colorOnBackground = 'colorOnBackground';
  static const String colorSurface = 'colorSurface';
  static const String colorOnSurface = 'colorOnSurface';
  static const String gradientTabColor = 'gradientTabColor';

  final Map<int, Map<String, bool>> groups;
}
