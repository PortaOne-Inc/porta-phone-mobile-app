import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

import '../../dto/theme/feature_access_dto.dart';
import '../mapper.dart';

@LazySingleton(as: CommonMapper<FeatureAccessModel, FeatureAccessDto>)
class FeatureAccessMapper
    extends CommonMapper<FeatureAccessModel, FeatureAccessDto> {
  @override
  FeatureAccessModel convertFrom(FeatureAccessDto it) {
    return FeatureAccessModel(
      applicationId: it.applicationId,
      themeId: it.themeId,
      status: it.status,
      config: it.config,
      version: it.version,
      createdAt: it.createdAt,
      updatedAt: it.updatedAt,
    );
  }

  @override
  FeatureAccessDto convertTo(FeatureAccessModel it) {
    return FeatureAccessDto(
      applicationId: it.applicationId,
      themeId: it.themeId,
      status: it.status,
      config: it.config,
      version: it.version,
      createdAt: it.createdAt,
      updatedAt: it.updatedAt,
    );
  }
}
