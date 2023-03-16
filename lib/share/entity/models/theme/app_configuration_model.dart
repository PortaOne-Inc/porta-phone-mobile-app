import 'package:flutter/material.dart';
import 'package:webtrit_configurator/share/exports/exports.dart';

import 'color_shema_model.dart';
import 'common_config_model.dart';
import 'theme_images_model.dart';

class AppConfigurationModel {
  AppConfigurationModel({
    this.id,
    this.fontFamily,
    this.colorScheme,
    this.commonConfig,
    this.images,
  });

  final String? id;
  final ColorSchemeModel? colorScheme;
  final CommonConfigModel? commonConfig;
  final String? fontFamily;
  final ConfiguratorImagesSetting? images;

  List<Color> get colorSchemeCollection {
    return colorScheme?.asList() ?? <Color>[];
  }

  List<Color> get colorGradientCollection {
    return colorScheme?.gradientTabColor ?? <Color>[Colors.transparent, Colors.transparent];
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
    final String? id,
    final ColorSchemeModel? colorScheme,
    final CommonConfigModel? commonConfig,
    final String? fontFamily,
    final ConfiguratorImagesSetting? images,
  }) {
    return AppConfigurationModel(
      id: id ?? this.id,
      colorScheme: colorScheme ?? this.colorScheme,
      commonConfig: commonConfig ?? this.commonConfig,
      fontFamily: fontFamily ?? this.fontFamily,
      images: images ?? this.images,
    );
  }
}
