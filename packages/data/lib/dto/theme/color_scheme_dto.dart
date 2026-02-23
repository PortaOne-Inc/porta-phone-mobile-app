import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_scheme_dto.freezed.dart';

part 'color_scheme_dto.g.dart';

@freezed
sealed class ColorSchemeDto with _$ColorSchemeDto {
  const factory ColorSchemeDto({
    required String applicationId,
    required String themeId,
    required String variant,
    required Map<String, dynamic> config,
    String? id,
    String? createdAt,
    String? updatedAt,
  }) = _ColorSchemeDto;

  factory ColorSchemeDto.fromJson(Map<String, dynamic> json) =>
      _$ColorSchemeDtoFromJson(json);
}
