import 'package:injectable/injectable.dart';

import '../../models/applications/publication_resource_model.dart';
import '../../repository/application/publication_resource_model.dart';

abstract class GetApplicationPublicationResourcesUsecase {
  Future<List<PublicationResourceModel>> execute(String applicationId);
}

@Injectable(as: GetApplicationPublicationResourcesUsecase)
class GetApplicationPublicationResourcesUsecaseImpl
    extends GetApplicationPublicationResourcesUsecase {
  GetApplicationPublicationResourcesUsecaseImpl(this.repo);

  final PublicationResourcesRepository repo;

  @override
  Future<List<PublicationResourceModel>> execute(String applicationId) {
    return repo.getApplicationResources(applicationId);
  }
}
