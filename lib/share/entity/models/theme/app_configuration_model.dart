import 'package:flutter/material.dart';
import 'package:webtrit_configurator/share/exports/exports.dart';

import 'color_shema_model.dart';
import 'common_config_model.dart';
import 'theme_images_model.dart';

class AppConfigurationModel {
  AppConfigurationModel({
    this.id,
    this.fontFamily,
    this.colors,
    this.commonConfig,
    this.images,
  });

  final String? id;
  final ColorSchemeModel? colors;
  final CommonConfigModel? commonConfig;
  final String? fontFamily;
  final ConfiguratorImagesSetting? images;

  List<Color> get colorSchemeCollection {
    return colors?.asList() ?? <Color>[];
  }

  List<Color> get colorGradientCollection {
    return colors?.gradientTabColor ?? <Color>[Colors.transparent, Colors.transparent];
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
    final ColorSchemeModel? colors,
    final CommonConfigModel? commonConfig,
    final String? fontFamily,
    final ConfiguratorImagesSetting? images,
  }) {
    return AppConfigurationModel(
      id: id ?? this.id,
      colors: colors ?? this.colors,
      commonConfig: commonConfig ?? this.commonConfig,
      fontFamily: fontFamily ?? this.fontFamily,
      images: images ?? this.images,
    );
  }
}
