class SharedThemePreviewModel {
  const SharedThemePreviewModel({
    required this.theme,
    required this.colorSchemes,
    required this.widgetConfigs,
    required this.pageConfigs,
    this.splashAsset,
    this.launchAsset,
    this.featureAccess,
    this.embeds = const [],
    this.environment,
  });

  final Map<String, dynamic> theme;
  final SharedThemePreviewVariants colorSchemes;
  final SharedThemePreviewVariants widgetConfigs;
  final SharedThemePreviewVariants pageConfigs;
  final Map<String, dynamic>? splashAsset;
  final Map<String, dynamic>? launchAsset;
  final Map<String, dynamic>? featureAccess;
  final List<Map<String, dynamic>> embeds;

  /// The application's dart-define environment for the realtime preview
  /// (secret-filtered by the backend), or null when not provided.
  final Map<String, dynamic>? environment;

  String get themeName => theme['title'] as String? ?? 'Untitled Theme';
  String? get themeDescription => theme['description'] as String?;
}

class SharedThemePreviewVariants {
  const SharedThemePreviewVariants({this.light, this.dark});

  /// Extracts light/dark variants from an array of config objects,
  /// where each item has a `variant` field ('light' or 'dark')
  /// and a `config` field containing the actual configuration.
  factory SharedThemePreviewVariants.fromArray(List<Map<String, dynamic>> items) {
    Map<String, dynamic>? light;
    Map<String, dynamic>? dark;
    for (final item in items) {
      final variant = item['variant'] as String?;
      final config = item['config'] as Map<String, dynamic>?;
      if (variant == 'light') {
        light = config;
      } else if (variant == 'dark') {
        dark = config;
      }
    }
    return SharedThemePreviewVariants(light: light, dark: dark);
  }

  final Map<String, dynamic>? light;
  final Map<String, dynamic>? dark;
}
