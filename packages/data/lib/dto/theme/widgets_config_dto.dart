import 'package:freezed_annotation/freezed_annotation.dart';

part 'widgets_config_dto.freezed.dart';

part 'widgets_config_dto.g.dart';

@freezed
sealed class WidgetsConfigDto with _$WidgetsConfigDto {
  const factory WidgetsConfigDto({
    required String id,
    required String applicationId,
    required String themeId,
    required String variant,
    required Map<String, dynamic> config,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _WidgetsConfigDto;

  factory WidgetsConfigDto.fromJson(Map<String, dynamic> json) =>
      _$WidgetsConfigDtoFromJson(json);
}
