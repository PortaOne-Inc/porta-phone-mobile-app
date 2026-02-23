import 'package:freezed_annotation/freezed_annotation.dart';

part 'publication_resource_model.freezed.dart';

part 'publication_resource_model.g.dart';

@freezed
sealed class PublicationResourceModel with _$PublicationResourceModel {
  const factory PublicationResourceModel({
    required String id,
    required String applicationId,
    required String createdAt,
    required String updatedAt,
    String? title,
    String? url,
    String? note,
    String? text,
  }) = _PublicationResourceModel;

  factory PublicationResourceModel.fromJson(Map<String, dynamic> json) =>
      _$PublicationResourceModelFromJson(json);
}
