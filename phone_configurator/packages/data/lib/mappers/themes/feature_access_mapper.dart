import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

import '../../dto/theme/feature_access_dto.dart';
import '../mapper.dart';

@LazySingleton(as: CommonMapper<FeatureAccessModel, FeatureAccessDto>)
class FeatureAccessMapper extends CommonMapper<FeatureAccessModel, FeatureAccessDto> {
  @override
  FeatureAccessModel convertFrom(FeatureAccessDto it) {
    return FeatureAccessModel(
      applicationId: it.applicationId,
      themeId: it.themeId,
      config: _migrateConfig(it.config),
      version: it.version,
      createdAt: it.createdAt,
      updatedAt: it.updatedAt,
    );
  }

  /// Migrates legacy backend config to the current schema.
  ///
  /// Handles renamed union types that the deserializer no longer recognises:
  /// - `supported[].type: "sipPresence"` → `"hybridPresence"` (renamed after 1.14.0)
  Map<String, dynamic> _migrateConfig(Map<String, dynamic> config) {
    final supported = config['supported'];
    if (supported is! List) return config;

    final needsMigration = supported.any((item) => item is Map && item['type'] == 'sipPresence');
    if (!needsMigration) return config;

    final migrated = supported.map((item) {
      if (item is Map && item['type'] == 'sipPresence') {
        return <String, dynamic>{...Map<String, dynamic>.from(item), 'type': 'hybridPresence'};
      }
      return item;
    }).toList();

    return <String, dynamic>{...config, 'supported': migrated};
  }

  @override
  FeatureAccessDto convertTo(FeatureAccessModel it) {
    return FeatureAccessDto(
      applicationId: it.applicationId,
      themeId: it.themeId,
      config: it.config,
      version: it.version,
      createdAt: it.createdAt,
      updatedAt: it.updatedAt,
    );
  }
}
