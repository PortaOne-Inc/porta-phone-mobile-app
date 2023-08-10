import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:webtrit_configurator/core/core.dart';

part 'theme_model.freezed.dart';

@freezed
class ThemeModel with _$ThemeModel {
  const ThemeModel._();

  const factory ThemeModel({
    final String? id,
    final String? name,
    final String? fontFamily,
    final ColorSchemeModel? colors,
    @Default(ImageSchemeModel()) final ImageSchemeModel images,
    final TextsModel? texts,
  }) = _ThemeModel;

  List<Color> get colorSchemeCollection {
    return colors?.asList ?? <Color>[];
  }

  List<Color>? get colorGradientCollection {
    return colors?.gradientTabColor;
  }

  List<CustomColor> toCustomColorGradientCollection() {
    const emptyGradient = <Color>[Colors.transparent, Colors.transparent];
    final isEnoughGradientColor = (colorGradientCollection ?? []).length < 2;
    final colors = isEnoughGradientColor ? emptyGradient : colorGradientCollection;
    return colors!.map((color) => CustomColor(color: color, blend: false)).toList();
  }
}
