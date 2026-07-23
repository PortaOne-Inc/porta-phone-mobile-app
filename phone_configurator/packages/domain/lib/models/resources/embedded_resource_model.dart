import 'package:freezed_annotation/freezed_annotation.dart';

import 'metadata_model.dart';

part 'embedded_resource_model.freezed.dart';

part 'embedded_resource_model.g.dart';

@freezed
sealed class EmbeddedResourceModel with _$EmbeddedResourceModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory EmbeddedResourceModel({
    required String uri,
    required String applicationId,
    String? id,
    @Default(EmbeddedResourceModelType.unknown) EmbeddedResourceModelType type,
    @Default({}) Map<String, dynamic> attributes,
    @Default(MetadataModel()) MetadataModel metadata,
    @Default([]) List<String> payload,
    @Default(false) bool enableConsoleLogCapture,
    String? reconnectStrategy,
  }) = _EmbeddedResource;

  const EmbeddedResourceModel._();

  factory EmbeddedResourceModel.fromJson(Map<String, dynamic> json) =>
      _$EmbeddedResourceModelFromJson(json);

  String displayLabel() {
    final shortUri = uri.length > 40 ? '${uri.substring(0, 37)}...' : uri;
    return '[$type] $shortUri';
  }
}

enum EmbeddedResourceModelType { terms, unknown }
