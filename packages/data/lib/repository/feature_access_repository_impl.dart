import 'package:domain/models/themes/feature_access_model.dart';
import 'package:domain/repository/theme/feature_access_repository.dart';
import 'package:injectable/injectable.dart';

import '../datasource/configurator_backend/configurator_backand_datasource.dart';
import '../dto/theme/feature_access_dto.dart';
import '../mappers/mapper.dart';

@Injectable(as: FeatureAccessRepository)
class FeatureAccessRepositoryImpl extends FeatureAccessRepository {
  FeatureAccessRepositoryImpl({
    required ConfiguratorBackandDatasource api,
    required CommonMapper<FeatureAccessModel, FeatureAccessDto> mapper,
  }) : _api = api,
       _mapper = mapper;

  final ConfiguratorBackandDatasource _api;
  final CommonMapper<FeatureAccessModel, FeatureAccessDto> _mapper;

  @override
  Future<List<FeatureAccessModel>> getFeatureAccessList({
    required String applicationId,
    String? themeId, // no longer needed, kept for backward compatibility
  }) async {
    final dtos = await _api.getFeatureAccesses(applicationId: applicationId);
    return dtos.map(_mapper.convertFrom).toList();
  }

  @override
  Future<FeatureAccessModel> getFeatureAccess({
    required String applicationId,
    required String themeId,
  }) async {
    final dto = await _api.getFeatureAccessByTheme(
      applicationId: applicationId,
      themeId: themeId,
    );
    return _mapper.convertFrom(dto);
  }

  @override
  Future<FeatureAccessModel> upsertFeatureAccess({
    required String applicationId,
    required String themeId,
    FeatureAccessStatus? status,
    Map<String, dynamic>? config,
  }) async {
    final dto = await _api.upsertFeatureAccessByTheme(
      applicationId: applicationId,
      themeId: themeId,
      status: status == null
          ? null
          : (status == FeatureAccessStatus.published ? 'published' : 'draft'),
      config: config,
    );
    return _mapper.convertFrom(dto);
  }

  @override
  Future<void> deleteFeatureAccess({
    required String applicationId,
    required String themeId,
  }) async {
    await _api.deleteFeatureAccessByTheme(
      applicationId: applicationId,
      themeId: themeId,
    );
  }
}
