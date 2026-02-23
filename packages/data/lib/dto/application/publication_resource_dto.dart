import 'package:freezed_annotation/freezed_annotation.dart';

part 'publication_resource_dto.freezed.dart';

part 'publication_resource_dto.g.dart';

@freezed
sealed class PublicationResourceDto with _$PublicationResourceDto {
  const factory PublicationResourceDto({
    required String id,
    required String applicationId,
    required String createdAt,
    required String updatedAt,
    String? title,
    String? url,
    String? note,
    String? text,
  }) = _PublicationResourceDto;

  factory PublicationResourceDto.fromJson(Map<String, dynamic> json) =>
      _$PublicationResourceDtoFromJson(json);
}
