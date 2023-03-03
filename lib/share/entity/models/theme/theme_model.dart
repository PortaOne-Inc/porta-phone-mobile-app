import 'package:webtrit_configurator/share/entity/models/theme/theme_images_model.dart';

import 'color_model.dart';
import 'common_config_model.dart';
import 'font_model.dart';

class ThemeModel {
  final String? id;
  final ColorsModel colors;
  final CommonConfigModel commonConfig;
  final FontModel textStyles;
  final ConfiguratorImagesSetting images;

  ThemeModel({
    required this.id,
    required this.colors,
    required this.commonConfig,
    required this.textStyles,
    required this.images,
  });

  ThemeModel copyWith({
    final String? id,
    final ColorsModel? colors,
    final CommonConfigModel? commonConfig,
    final FontModel? textStyles,
    final ConfiguratorImagesSetting? images,
  }) {
    return ThemeModel(
      id: id ?? this.id,
      colors: colors ?? this.colors,
      commonConfig: commonConfig ?? this.commonConfig,
      textStyles: textStyles ?? this.textStyles,
      images: images ?? this.images,
    );
  }
}
