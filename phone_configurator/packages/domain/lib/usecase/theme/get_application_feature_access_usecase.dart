// domain/lib/usecase/feature_access/get_application_feature_access_usecase.dart
import 'dart:async';
import 'package:injectable/injectable.dart';

import '../../models/themes/feature_access_model.dart';
import '../../repository/theme/feature_access_repository.dart';

abstract class GetApplicationFeatureAccessUsecase {
  FutureOr<List<FeatureAccessModel>> execute(
    String applicationId, {
    String? themeId,
  });
}

@Injectable(as: GetApplicationFeatureAccessUsecase)
class GetApplicationFeatureAccessUsecaseImpl
    extends GetApplicationFeatureAccessUsecase {
  GetApplicationFeatureAccessUsecaseImpl(this._repo);
  final FeatureAccessRepository _repo;

  @override
  Future<List<FeatureAccessModel>> execute(
    String applicationId, {
    String? themeId,
  }) {
    return _repo.getFeatureAccessList(applicationId: applicationId);
  }
}
