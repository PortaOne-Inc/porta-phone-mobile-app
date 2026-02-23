import '../../models/applications/publication_resource_model.dart';

abstract class PublicationResourcesRepository {
  Future<List<PublicationResourceModel>> getApplicationResources(
    String applicationId,
  );

  Future<PublicationResourceModel> createResource(
    String applicationId, {
    String? title,
    String? url,
    String? note,
    String? text,
  });

  Future<PublicationResourceModel> updateResource(
    String id, {
    String? title,
    String? url,
    String? note,
    String? text,
  });

  Future<void> deleteResource(String id);
}
