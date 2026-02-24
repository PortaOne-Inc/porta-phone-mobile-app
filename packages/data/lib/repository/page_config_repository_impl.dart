import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';
import '../datasource/configurator_backend/configurator_backand_datasource.dart';
import '../dto/theme/page_config_dto.dart';
import '../mappers/mapper.dart';

@Injectable(as: PageConfigRepository)
class PageConfigRepositoryImpl extends PageConfigRepository {
  PageConfigRepositoryImpl({
    required ConfiguratorBackandDatasource api,
    required CommonMapper<PageConfigModel, PageConfigDto> mapper,
  }) : _api = api,
       _mapper = mapper;

  final ConfiguratorBackandDatasource _api;
  final CommonMapper<PageConfigModel, PageConfigDto> _mapper;

  @override
  Future<List<PageConfigModel>> listForTheme({
    required String applicationId,
    required String themeId,
  }) async {
    try {
      final dtos = await _api.getPageConfigsForTheme(
        applicationId: applicationId,
        themeId: themeId,
      );
      return dtos.map(_mapper.convertFrom).toList();
    } on DioException catch (e) {
      throw BaseException(
        message: e.response?.data?.toString() ?? e.message ?? 'Network error',
      );
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<({PageConfigModel light, PageConfigModel dark})> ensurePair({
    required String applicationId,
    required String themeId,
  }) async {
    try {
      final pair = await _api.ensurePageConfigsPair(
        applicationId: applicationId,
        themeId: themeId,
      );
      return (
        light: _mapper.convertFrom(pair.light),
        dark: _mapper.convertFrom(pair.dark),
      );
    } on DioException catch (e) {
      throw BaseException(
        message: e.response?.data?.toString() ?? e.message ?? 'Network error',
      );
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<PageConfigModel> getByThemeVariant({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
  }) async {
    try {
      final dto = await _api.getPageConfigByThemeVariant(
        applicationId: applicationId,
        themeId: themeId,
        variant: variant.name,
      );
      return _mapper.convertFrom(dto);
    } on DioException catch (e) {
      throw BaseException(
        message: e.response?.data?.toString() ?? e.message ?? 'Network error',
      );
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<PageConfigModel> upsertByThemeVariant({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
    Map<String, dynamic>? config,
    int? expectedVersion,
  }) async {
    try {
      final dto = await _api.upsertPageConfigByThemeVariant(
        applicationId: applicationId,
        themeId: themeId,
        variant: variant.name,
        config: config,
        expectedVersion: expectedVersion,
      );
      return _mapper.convertFrom(dto);
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        throw VersionConflictException(
          message: e.response?.data?.toString() ?? 'Version conflict',
        );
      }
      throw BaseException(
        message: e.response?.data?.toString() ?? e.message ?? 'Network error',
      );
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
