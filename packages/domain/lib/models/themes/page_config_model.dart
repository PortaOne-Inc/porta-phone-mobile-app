import 'package:freezed_annotation/freezed_annotation.dart';

import 'brightness_variant.dart';

part 'page_config_model.freezed.dart';

part 'page_config_model.g.dart';

@freezed
sealed class PageConfigModel with _$PageConfigModel {
  const factory PageConfigModel({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
    required Map<String, dynamic> config,
    String? id,
    String? createdAt,
    String? updatedAt,
  }) = _PageConfigModel;

  factory PageConfigModel.fromJson(Map<String, dynamic> json) =>
      _$PageConfigModelFromJson(json);
}
