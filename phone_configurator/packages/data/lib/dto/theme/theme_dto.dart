import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_dto.freezed.dart';

part 'theme_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false, toJson: true)
sealed class ThemeDTO with _$ThemeDTO {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory ThemeDTO({
    String? id,
    String? applicationId,
    String? title,
    String? previewAssetId,
    String? status,
    bool? isDefault,
    int? version,
    int? sortIndex,
    int? assetsCount,
    int? embedsCount,
    bool? featureAccessExists,
    String? createdBy,
    String? updatedBy,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? slug,
    String? description,
    String? parentThemeId,
    @Default(<String>[]) List<String> tags,
  }) = _ThemeDTO;

  const ThemeDTO._();

  factory ThemeDTO.fromJson(Map<String, Object?> json) =>
      _$ThemeDTOFromJson(json);
}

@freezed
sealed class CreateThemeDTO with _$CreateThemeDTO {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory CreateThemeDTO({
    /// Title of the theme (required, max 120 chars).
    required String title,

    /// Optional description (max 2000 chars).
    String? description,

    /// Label for environment separation.
    /// Defaults to "dev" if not provided.
    @Default('dev') String label,
  }) = _CreateThemeDTO;

  factory CreateThemeDTO.fromJson(Map<String, dynamic> json) =>
      _$CreateThemeDTOFromJson(json);
}
