import 'package:flutter/material.dart';
import 'package:webtrit_configurator/share/exports/exports.dart';

import 'color_shema_model.dart';
import 'theme_images_model.dart';

class AppConfigurationModel {
  final String? id;
  final String? name;
  final ColorSchemeModel? colorScheme;
  final String? fontFamily;
  final ConfiguratorImagesSetting? images;

  AppConfigurationModel({
    this.id,
    this.name,
    this.fontFamily,
    this.colorScheme,
    this.images,
  });

  static const emptyGradient = <Color>[Colors.transparent, Colors.transparent];

  List<Color> get colorSchemeCollection {
    return colorScheme?.asList() ?? <Color>[];
  }

  List<Color> get colorGradientCollection {
    final gradient = colorScheme?.gradientTabColor ?? emptyGradient;
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

  AppConfigurationModel copyWith({
    String? id,
    String? name,
    ColorSchemeModel? colorScheme,
    String? fontFamily,
    ConfiguratorImagesSetting? images,
  }) {
    return AppConfigurationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      colorScheme: colorScheme ?? this.colorScheme,
      fontFamily: fontFamily ?? this.fontFamily,
      images: images ?? this.images,
    );
  }
}
