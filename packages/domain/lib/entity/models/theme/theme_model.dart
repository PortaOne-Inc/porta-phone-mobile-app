import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/entity/models/image/system_assets_model.dart';

import '../color/color_scheme_model.dart';
import '../image/image_scheme_model.dart';
import '../texts/texts_model.dart';

part 'theme_model.freezed.dart';

@freezed
class ThemeModel with _$ThemeModel {
  const factory ThemeModel({
    String? id,
    String? name,
    String? fontFamily,
    ColorSchemeModel? colors,
    @Default(ImageSchemeModel()) ImageSchemeModel images,
    @Default(SystemAssetsModel()) SystemAssetsModel systemAssets,
    TextsModel? texts,
  }) = _ThemeModel;

  const ThemeModel._();

  List<String> get colorSchemeCollection {
    return colors?.asList ?? <String>[];
  }

  List<String>? get colorGradientCollection {
    return colors?.gradientTabColor;
  }
}
