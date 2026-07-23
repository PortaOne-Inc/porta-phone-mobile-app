import 'package:freezed_annotation/freezed_annotation.dart';

import 'brightness_variant.dart';

part 'widgets_config.freezed.dart';

@freezed
sealed class WidgetsConfig with _$WidgetsConfig {
  const factory WidgetsConfig({
    required String id,
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
    required Map<String, dynamic> config,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? version,
  }) = _WidgetsConfig;
}
