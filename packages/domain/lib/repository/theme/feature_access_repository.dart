import 'package:domain/domain.dart';

abstract class FeatureAccessRepository {
  Future<List<FeatureAccessModel>> getFeatureAccessList({
    required String applicationId,
  });

  Future<FeatureAccessModel> getFeatureAccess({
    required String applicationId,
    required String themeId,
  });

  Future<FeatureAccessModel> upsertFeatureAccess({
    required String applicationId,
    required String themeId,
    String? status,
    Map<String, dynamic>? config,
  });

  Future<void> deleteFeatureAccess({
    required String applicationId,
    required String themeId,
  });
}
