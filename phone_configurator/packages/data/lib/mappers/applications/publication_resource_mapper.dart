import 'package:domain/models/applications/publication_resource_model.dart';
import 'package:injectable/injectable.dart';

import '../../dto/application/publication_resource_dto.dart';
import '../mapper.dart';

@Injectable(as: CommonMapper<PublicationResourceModel, PublicationResourceDto>)
class PublicationResourceMapper
    extends CommonMapper<PublicationResourceModel, PublicationResourceDto> {
  @override
  PublicationResourceModel convertFrom(PublicationResourceDto it) {
    return PublicationResourceModel(
      id: it.id,
      applicationId: it.applicationId,
      title: it.title,
      url: it.url,
      note: it.note,
      text: it.text,
      createdAt: it.createdAt,
      updatedAt: it.updatedAt,
    );
  }

  @override
  PublicationResourceDto convertTo(PublicationResourceModel it) {
    return PublicationResourceDto(
      id: it.id,
      applicationId: it.applicationId,
      title: it.title,
      url: it.url,
      note: it.note,
      text: it.text,
      createdAt: it.createdAt,
      updatedAt: it.updatedAt,
    );
  }
}
