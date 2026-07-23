import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

import '../../repository/application/embeds_repository.dart';

abstract class DeleteApplicationEmbedUsecase {
  Future<void> execute({required String applicationId, required String id});
}

@Injectable(as: DeleteApplicationEmbedUsecase)
class DeleteApplicationEmbedUsecaseImpl extends DeleteApplicationEmbedUsecase {
  DeleteApplicationEmbedUsecaseImpl(this._repo);

  final EmbedsRepository _repo;

  @override
  Future<void> execute({required String applicationId, required String id}) {
    return _repo.deleteEmbed(applicationId, id);
  }
}
