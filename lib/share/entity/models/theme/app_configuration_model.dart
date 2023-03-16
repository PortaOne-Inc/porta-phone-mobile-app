import 'package:webtrit_configurator/share/entity/models/theme/theme_images_model.dart';

import 'color_model.dart';
import 'common_config_model.dart';

class AppConfigurationModel {
  final String? id;
  final ColorsModel colors;
  final CommonConfigModel commonConfig;
  final String? fontFamily;
  final ConfiguratorImagesSetting images;

  AppConfigurationModel({
    this.fontFamily,
    required this.id,
    required this.colors,
    required this.commonConfig,
    required this.images,
  });

  AppConfigurationModel copyWith({
    final String? id,
    final ColorsModel? colors,
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
