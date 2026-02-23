import 'package:injectable/injectable.dart';

import '../../repository/application/publication_resource_model.dart';

abstract class DeleteApplicationPublicationResourceUsecase {
  Future<void> execute(String resourceId);
}

@Injectable(as: DeleteApplicationPublicationResourceUsecase)
class DeleteApplicationPublicationResourceUsecaseImpl
    extends DeleteApplicationPublicationResourceUsecase {
  DeleteApplicationPublicationResourceUsecaseImpl(this.repo);

  final PublicationResourcesRepository repo;

  @override
  Future<void> execute(String resourceId) => repo.deleteResource(resourceId);
}
