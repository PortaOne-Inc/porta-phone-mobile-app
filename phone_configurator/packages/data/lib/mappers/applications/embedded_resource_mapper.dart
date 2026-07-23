import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:data/mappers/mappers.dart';
import 'package:data/dto/dto.dart';

@Injectable(as: CommonMapper<EmbeddedResourceModel, EmbeddedResourceDto>)
class EmbeddedResourceMapper
    extends CommonMapper<EmbeddedResourceModel, EmbeddedResourceDto> {
  @override
  EmbeddedResourceDto convertTo(EmbeddedResourceModel it) {
    return EmbeddedResourceDto(
      id: it.id,
      applicationId: it.applicationId,
      uri: it.uri,
      type: it.type.name,
      attributes: it.attributes,
      metadata: MetadataDto(attributes: it.metadata.attributes),
      payload: it.payload,
      enableConsoleLogCapture: it.enableConsoleLogCapture,
      reconnectStrategy: it.reconnectStrategy,
    );
  }

  @override
  EmbeddedResourceModel convertFrom(EmbeddedResourceDto it) {
    return EmbeddedResourceModel(
      id: it.id,
      applicationId: it.applicationId,
      uri: it.uri,
      type: _typeFromString(it.type),
      attributes: it.attributes,
      metadata: MetadataModel(attributes: it.metadata.attributes),
      payload: it.payload,
      enableConsoleLogCapture: it.enableConsoleLogCapture,
      reconnectStrategy: it.reconnectStrategy,
    );
  }

  EmbeddedResourceModelType _typeFromString(String s) {
    switch (s) {
      case 'terms':
        return EmbeddedResourceModelType.terms;
      default:
        return EmbeddedResourceModelType.unknown;
    }
  }
}
