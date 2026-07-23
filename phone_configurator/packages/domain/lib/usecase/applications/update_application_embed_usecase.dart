import 'package:injectable/injectable.dart';

import '../../models/models.dart';
import '../../repository/repository.dart';

abstract class UpdateApplicationEmbedUsecase {
  Future<EmbeddedResourceModel> execute({
    required String applicationId,
    required String id,
    required EmbeddedResourceModel resource,
  });
}

@Injectable(as: UpdateApplicationEmbedUsecase)
class UpdateApplicationEmbedUsecaseImpl extends UpdateApplicationEmbedUsecase {
  UpdateApplicationEmbedUsecaseImpl(this._repo);

  final EmbedsRepository _repo;

  @override
  Future<EmbeddedResourceModel> execute({
    required String applicationId,
    required String id,
    required EmbeddedResourceModel resource,
  }) {
    return _repo.updateEmbed(applicationId, id, resource);
  }
}
