import 'package:freezed_annotation/freezed_annotation.dart';

part 'embedded_resource_dto.freezed.dart';

part 'embedded_resource_dto.g.dart';

@freezed
sealed class EmbeddedResourceDto with _$EmbeddedResourceDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory EmbeddedResourceDto({
    required String applicationId,
    required String uri,
    String? id,
    @Default('unknown') String type,
    @Default({}) Map<String, dynamic> attributes,
    @Default(MetadataDto()) MetadataDto metadata,
    @Default(<String>[]) List<String> payload,
    @Default(false) bool enableConsoleLogCapture,
    String? reconnectStrategy,
    String? createdAt,
    String? updatedAt,
  }) = _EmbeddedResourceDto;

  const EmbeddedResourceDto._();

  factory EmbeddedResourceDto.fromJson(Map<String, dynamic> json) =>
      _$EmbeddedResourceDtoFromJson(json);
}

@freezed
sealed class MetadataDto with _$MetadataDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory MetadataDto({@Default({}) Map<String, dynamic> attributes}) =
      _MetadataDto;

  const MetadataDto._();

  factory MetadataDto.fromJson(Map<String, dynamic> json) =>
      _$MetadataDtoFromJson(json);
}
