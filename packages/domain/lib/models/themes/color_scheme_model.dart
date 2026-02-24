import 'package:freezed_annotation/freezed_annotation.dart';

import 'brightness_variant.dart';

part 'color_scheme_model.freezed.dart';

part 'color_scheme_model.g.dart';

@freezed
sealed class ColorSchemeModel with _$ColorSchemeModel {
  const factory ColorSchemeModel({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
    required Map<String, dynamic> config,
    String? id,
    int? version,
    String? createdAt,
    String? updatedAt,
  }) = _ColorSchemeModel;

  factory ColorSchemeModel.fromJson(Map<String, dynamic> json) =>
      _$ColorSchemeModelFromJson(json);
}
