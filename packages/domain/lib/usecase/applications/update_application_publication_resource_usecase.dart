import 'package:injectable/injectable.dart';

import '../../models/applications/publication_resource_model.dart';
import '../../repository/application/publication_resource_model.dart';

abstract class UpdateApplicationPublicationResourceUsecase {
  Future<PublicationResourceModel> execute({
    required String resourceId,
    String? title,
    String? url,
    String? note,
    String? text,
  });
}

@Injectable(as: UpdateApplicationPublicationResourceUsecase)
class UpdateApplicationPublicationResourceUsecaseImpl
    extends UpdateApplicationPublicationResourceUsecase {
  UpdateApplicationPublicationResourceUsecaseImpl(this.repo);

  final PublicationResourcesRepository repo;

  @override
  Future<PublicationResourceModel> execute({
    required String resourceId,
    String? title,
    String? url,
    String? note,
    String? text,
  }) {
    return repo.updateResource(
      resourceId,
      title: title,
      url: url,
      note: note,
      text: text,
    );
  }
}
