import 'dart:async';
import 'package:injectable/injectable.dart';

import '../../models/themes/feature_access_model.dart';
import '../../repository/theme/feature_access_repository.dart';

abstract class GetFeatureAccessUsecase {
  FutureOr<FeatureAccessModel> execute(String applicationId, String id);
}

@Injectable(as: GetFeatureAccessUsecase)
class GetFeatureAccessUsecaseImpl extends GetFeatureAccessUsecase {
  GetFeatureAccessUsecaseImpl(this._repo);

  final FeatureAccessRepository _repo;

  @override
  Future<FeatureAccessModel> execute(String applicationId, String id) =>
      _repo.getFeatureAccess(applicationId: applicationId, themeId: id);
}
