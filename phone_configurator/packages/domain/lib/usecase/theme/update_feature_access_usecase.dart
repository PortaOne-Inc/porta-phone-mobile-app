import 'dart:async';
import 'package:injectable/injectable.dart';
import '../../models/themes/feature_access_model.dart';
import '../../repository/theme/feature_access_repository.dart';

abstract class UpdateFeatureAccessUsecase {
  Future<FeatureAccessModel> execute({
    required String applicationId,
    required String themeId,
    String? status,
    Map<String, dynamic>? config,
    int? expectedVersion,
  });
}

@Injectable(as: UpdateFeatureAccessUsecase)
class UpdateFeatureAccessUsecaseImpl extends UpdateFeatureAccessUsecase {
  UpdateFeatureAccessUsecaseImpl(this._repo);

  final FeatureAccessRepository _repo;

  @override
  Future<FeatureAccessModel> execute({
    required String applicationId,
    required String themeId,
    String? status,
    Map<String, dynamic>? config,
    int? expectedVersion,
  }) {
    return _repo.upsertFeatureAccess(
      applicationId: applicationId,
      themeId: themeId,
      status: status,
      config: config,
      expectedVersion: expectedVersion,
    );
  }
}
