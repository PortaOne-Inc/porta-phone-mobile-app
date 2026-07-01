import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../common/api_exception_mapper.dart';
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
    try {
      final dtos = await _api.getFeatureAccesses(applicationId: applicationId);
      return dtos.map(_mapper.convertFrom).toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<FeatureAccessModel> getFeatureAccess({required String applicationId, required String themeId}) async {
    try {
      final dto = await _api.getFeatureAccessByTheme(applicationId: applicationId, themeId: themeId);
      return _mapper.convertFrom(dto);
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<FeatureAccessModel> upsertFeatureAccess({
    required String applicationId,
    required String themeId,
    String? status,
    Map<String, dynamic>? config,
    int? expectedVersion,
  }) async {
    try {
      final dto = await _api.upsertFeatureAccessByTheme(
        applicationId: applicationId,
        themeId: themeId,
        status: status,
        config: config,
        expectedVersion: expectedVersion,
      );
      return _mapper.convertFrom(dto);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<void> deleteFeatureAccess({required String applicationId, required String themeId}) async {
    try {
      await _api.deleteFeatureAccessByTheme(applicationId: applicationId, themeId: themeId);
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
