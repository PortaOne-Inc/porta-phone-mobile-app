import 'package:injectable/injectable.dart';

import '../../models/applications/publication_resource_model.dart';
import '../../repository/application/publication_resource_model.dart';

abstract class CreateApplicationPublicationResourceUsecase {
  Future<PublicationResourceModel> execute({
    required String applicationId,
    String? title,
    String? url,
    String? note,
    String? text,
  });
}

@Injectable(as: CreateApplicationPublicationResourceUsecase)
class CreateApplicationPublicationResourceUsecaseImpl
    extends CreateApplicationPublicationResourceUsecase {
  CreateApplicationPublicationResourceUsecaseImpl(this.repo);

  final PublicationResourcesRepository repo;

  @override
  Future<PublicationResourceModel> execute({
    required String applicationId,
    String? title,
    String? url,
    String? note,
    String? text,
  }) {
    return repo.createResource(
      applicationId,
      title: title,
      url: url,
      note: note,
      text: text,
    );
  }
}
