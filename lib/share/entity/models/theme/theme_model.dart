import 'package:flutter/material.dart';
import 'package:webtrit_configurator/share/exports/exports.dart';

import 'color_model.dart';
import 'texts/texts_model.dart';
import 'theme_images_model.dart';

export 'texts/texts_model.dart';

class ThemeModel {
  final String? id;
  final String? name;
  final String? fontFamily;
  final ColorModel? colors;
  final ConfiguratorImagesSetting? images;
  final TextsModel? texts;

  ThemeModel({
    this.id,
    this.name,
    this.fontFamily,
    this.colors,
    this.images,
    this.texts,
  });

  static const emptyGradient = <Color>[Colors.transparent, Colors.transparent];

  List<Color> get colorSchemeCollection {
    return colors?.asList() ?? <Color>[];
  }

  List<Color> get colorGradientCollection {
    final gradient = colors?.gradientTabColor ?? emptyGradient;
    return gradient.length >= 2 ? gradient : emptyGradient;
  }

  List<CustomColor> get toCustomColorGradientCollection {
    return colorGradientCollection
        .map((color) => CustomColor(
              color: color,
              blend: false,
            ))
        .toList();
  }

  ThemeModel copyWith({
    String? id,
    String? name,
    ColorModel? colors,
    String? fontFamily,
    ConfiguratorImagesSetting? images,
    TextsModel? texts,
  }) {
    return ThemeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      colors: colors ?? this.colors,
      fontFamily: fontFamily ?? this.fontFamily,
      images: images ?? this.images,
      texts: texts ?? this.texts,
    );
  }
}
