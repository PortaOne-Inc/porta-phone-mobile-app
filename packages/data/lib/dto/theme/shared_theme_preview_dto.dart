import 'package:freezed_annotation/freezed_annotation.dart';

part 'shared_theme_preview_dto.freezed.dart';

part 'shared_theme_preview_dto.g.dart';

@freezed
sealed class SharedThemePreviewDto with _$SharedThemePreviewDto {
  const factory SharedThemePreviewDto({
    required Map<String, dynamic> theme,
    required List<Map<String, dynamic>> colorSchemes,
    required List<Map<String, dynamic>> widgetConfigs,
    required List<Map<String, dynamic>> pageConfigs,
    Map<String, dynamic>? splashAsset,
    Map<String, dynamic>? launchAsset,
    Map<String, dynamic>? featureAccess,
    @Default([]) List<Map<String, dynamic>> embeds,
    // Base64-encoded, secret-filtered dart-define environment supplied by the
    // backend for the realtime share preview. Null when not provided.
    String? environment,
  }) = _SharedThemePreviewDto;

  factory SharedThemePreviewDto.fromJson(Map<String, dynamic> json) => _$SharedThemePreviewDtoFromJson(json);
}
