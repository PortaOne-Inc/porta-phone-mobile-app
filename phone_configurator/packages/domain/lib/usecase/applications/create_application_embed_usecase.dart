import 'package:injectable/injectable.dart';

import '../../repository/repository.dart';
import '../../models/models.dart';

abstract class CreateApplicationEmbedUsecase {
  Future<EmbeddedResourceModel> execute({
    required String applicationId,
    required EmbeddedResourceModel resource,
  });
}

@Injectable(as: CreateApplicationEmbedUsecase)
class CreateApplicationEmbedUsecaseImpl extends CreateApplicationEmbedUsecase {
  CreateApplicationEmbedUsecaseImpl(this._repo);

  final EmbedsRepository _repo;

  @override
  Future<EmbeddedResourceModel> execute({
    required String applicationId,
    required EmbeddedResourceModel resource,
  }) {
    return _repo.createEmbed(applicationId, resource);
  }
}
