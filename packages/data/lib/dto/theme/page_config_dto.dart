import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_config_dto.freezed.dart';

part 'page_config_dto.g.dart';

@freezed
sealed class PageConfigDto with _$PageConfigDto {
  const factory PageConfigDto({
    required String id, // themeId_variant
    required String applicationId,
    required String themeId,
    required String variant, // "light" | "dark"
    required Map<String, dynamic> config,
    int? version,
    String? createdAt,
    String? updatedAt,
  }) = _PageConfigDto;

  factory PageConfigDto.fromJson(Map<String, dynamic> json) =>
      _$PageConfigDtoFromJson(json);
}
