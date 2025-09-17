import 'dart:async';
import 'package:injectable/injectable.dart';

import '../../repository/theme/feature_access_repository.dart';

abstract class DeleteFeatureAccessUsecase {
  FutureOr<void> execute(String applicationId, String themeId);
}

@Injectable(as: DeleteFeatureAccessUsecase)
class DeleteFeatureAccessUsecaseImpl extends DeleteFeatureAccessUsecase {
  DeleteFeatureAccessUsecaseImpl(this._repo);

  final FeatureAccessRepository _repo;

  @override
  Future<void> execute(String applicationId, String themeId) =>
      _repo.deleteFeatureAccess(applicationId: applicationId, themeId: themeId);
}
