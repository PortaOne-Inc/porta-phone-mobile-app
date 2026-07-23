import 'package:domain/domain.dart';

import 'package:webtrit_configurator/exports/exports.dart';

extension EmbeddedResourceModelMapper on EmbeddedResourceModel {
  EmbeddedResource toEntity() {
    return EmbeddedResource(
      id: id!,
      uri: uri,
      type: type.toEntity(),
      attributes: attributes,
      metadata: metadata.toEntity(),
      payload: payload,
      enableConsoleLogCapture: enableConsoleLogCapture,
      reconnectStrategy: reconnectStrategy,
    );
  }
}

extension EmbeddedResourceModelTypeMapper on EmbeddedResourceModelType {
  EmbeddedResourceType toEntity() {
    return switch (this) {
      EmbeddedResourceModelType.terms => EmbeddedResourceType.terms,
      EmbeddedResourceModelType.unknown => EmbeddedResourceType.unknown,
    };
  }
}

extension MetadataModelMapper on MetadataModel {
  Metadata toEntity() {
    return const Metadata();
  }
}
