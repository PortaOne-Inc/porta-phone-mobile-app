import 'package:domain/domain.dart';

abstract class EmbedsRepository {
  Future<List<EmbeddedResourceModel>> getEmbeds(String applicationId);

  Future<EmbeddedResourceModel> getEmbed(String applicationId, String id);

  Future<EmbeddedResourceModel> createEmbed(
    String applicationId,
    EmbeddedResourceModel resource,
  );

  Future<EmbeddedResourceModel> updateEmbed(
    String applicationId,
    String id,
    EmbeddedResourceModel resource,
  );

  Future<void> deleteEmbed(String applicationId, String id);

  Stream<List<EmbeddedResourceModel>> watchEmbeds(String applicationId);

  /// Stream that emits updates only for the specific embed [id].
  Stream<EmbeddedResourceModel> watchEmbed(String applicationId, String id);
}
