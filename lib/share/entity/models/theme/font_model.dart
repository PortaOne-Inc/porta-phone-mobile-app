class FontModel {
  final String generalFontName;

  final TextStyleModel displayLarge;
  final TextStyleModel displayMedium;
  final TextStyleModel displaySmall;

  final TextStyleModel headlineLarge;
  final TextStyleModel headlineMedium;
  final TextStyleModel headlineSmall;

  final TextStyleModel titleLarge;
  final TextStyleModel titleMedium;
  final TextStyleModel titleSmall;

  final TextStyleModel bodyLarge;
  final TextStyleModel bodyMedium;
  final TextStyleModel bodySmall;

  final TextStyleModel labelLarge;
  final TextStyleModel labelMedium;
  final TextStyleModel labelSmall;

  FontModel(
      {required this.generalFontName,
      required this.displayLarge,
      required this.displayMedium,
      required this.displaySmall,
      required this.headlineLarge,
      required this.headlineMedium,
      required this.headlineSmall,
      required this.titleLarge,
      required this.titleMedium,
      required this.titleSmall,
      required this.bodyLarge,
      required this.bodyMedium,
      required this.bodySmall,
      required this.labelLarge,
      required this.labelMedium,
      required this.labelSmall});

  factory FontModel.empty() {
    return FontModel(
      generalFontName: '',
      displayLarge: TextStyleModel(),
      displayMedium: TextStyleModel(),
      displaySmall: TextStyleModel(),
      headlineLarge: TextStyleModel(),
      headlineMedium: TextStyleModel(),
      headlineSmall: TextStyleModel(),
      titleLarge: TextStyleModel(),
      titleMedium: TextStyleModel(),
      titleSmall: TextStyleModel(),
      bodyLarge: TextStyleModel(),
      bodyMedium: TextStyleModel(),
      bodySmall: TextStyleModel(),
      labelLarge: TextStyleModel(),
      labelMedium: TextStyleModel(),
      labelSmall: TextStyleModel(),
    );
  }

  FontModel copyWith({
    final String? generalFontName,
    final TextStyleModel? displayLarge,
    final TextStyleModel? displayMedium,
    final TextStyleModel? displaySmall,
    final TextStyleModel? headlineLarge,
    final TextStyleModel? headlineMedium,
    final TextStyleModel? headlineSmall,
    final TextStyleModel? titleLarge,
    final TextStyleModel? titleMedium,
    final TextStyleModel? titleSmall,
    final TextStyleModel? bodyLarge,
    final TextStyleModel? bodyMedium,
    final TextStyleModel? bodySmall,
    final TextStyleModel? labelLarge,
    final TextStyleModel? labelMedium,
    final TextStyleModel? labelSmall,
  }) {
    return FontModel(
      generalFontName: generalFontName ?? this.generalFontName,
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      displaySmall: displaySmall ?? this.displaySmall,
      headlineLarge: headlineLarge ?? this.headlineLarge,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      headlineSmall: headlineSmall ?? this.headlineSmall,
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
    );
  }
}

class TextStyleModel {
  final String? fontName;
  final double? height;
  final double? letterSpacing;
  final double? wordSpacing;

  TextStyleModel({
    this.fontName,
    this.height,
    this.letterSpacing,
    this.wordSpacing,
  });

  TextStyleModel copyWith({
    final String? fontName,
    final double? height,
    final double? wordSpacing,
    final double? letterSpacing,
  }) {
    return TextStyleModel(
      fontName: fontName ?? this.fontName,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      height: height ?? this.height,
      letterSpacing: letterSpacing ?? this.letterSpacing,
    );
  }

  TextStyleModel merge(TextStyleModel? textStyleModel) {
    return TextStyleModel(
      fontName: textStyleModel?.fontName ?? fontName,
      wordSpacing: textStyleModel?.wordSpacing ?? wordSpacing,
      height: textStyleModel?.height ?? height,
      letterSpacing: textStyleModel?.letterSpacing ?? letterSpacing,
    );
  }
}
