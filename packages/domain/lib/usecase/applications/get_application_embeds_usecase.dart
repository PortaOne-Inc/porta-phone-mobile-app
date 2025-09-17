import 'package:injectable/injectable.dart';

import '../../repository/repository.dart';
import '../../models/models.dart';

abstract class GetApplicationEmbedsUsecase {
  Future<List<EmbeddedResourceModel>> execute(String applicationId);
}

@Injectable(as: GetApplicationEmbedsUsecase)
class GetApplicationEmbedsUsecaseImpl extends GetApplicationEmbedsUsecase {
  GetApplicationEmbedsUsecaseImpl(this._repo);

  final EmbedsRepository _repo;

  @override
  Future<List<EmbeddedResourceModel>> execute(String applicationId) {
    return _repo.getEmbeds(applicationId);
  }
}
