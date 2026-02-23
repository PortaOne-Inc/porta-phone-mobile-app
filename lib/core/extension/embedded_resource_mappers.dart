import 'package:domain/domain.dart';

import '../../exports/webtrit_phone.dart';

extension EmbeddedResourceModelX on EmbeddedResourceModel {
  EmbeddedResource toEmbeddedResource() {
    return EmbeddedResource(
      id: id ?? uri,
      uri: uri,
      type: type == EmbeddedResourceModelType.terms
          ? EmbeddedResourceType.terms
          : EmbeddedResourceType.unknown,
      attributes: attributes,
      metadata: Metadata.fromJson(metadata.toJson()),
      payload: payload,
      enableConsoleLogCapture: enableConsoleLogCapture,
      reconnectStrategy: reconnectStrategy,
    );
  }
}
