import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';
import '../common/api_exception_mapper.dart';
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
  Future<List<PageConfigModel>> listForTheme({required String applicationId, required String themeId}) =>
      guardApiCall(() async {
        final dtos = await _api.getPageConfigsForTheme(applicationId: applicationId, themeId: themeId);
        return dtos.map(_mapper.convertFrom).toList();
      });

  @override
  Future<({PageConfigModel light, PageConfigModel dark})> ensurePair({
    required String applicationId,
    required String themeId,
  }) => guardApiCall(() async {
    final pair = await _api.ensurePageConfigsPair(applicationId: applicationId, themeId: themeId);
    return (light: _mapper.convertFrom(pair.light), dark: _mapper.convertFrom(pair.dark));
  });

  @override
  Future<PageConfigModel> getByThemeVariant({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
  }) => guardApiCall(() async {
    final dto = await _api.getPageConfigByThemeVariant(
      applicationId: applicationId,
      themeId: themeId,
      variant: variant.name,
    );
    return _mapper.convertFrom(dto);
  });

  @override
  Future<PageConfigModel> upsertByThemeVariant({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
    Map<String, dynamic>? config,
    int? expectedVersion,
  }) => guardApiCall(() async {
    final dto = await _api.upsertPageConfigByThemeVariant(
      applicationId: applicationId,
      themeId: themeId,
      variant: variant.name,
      config: config,
      expectedVersion: expectedVersion,
    );
    return _mapper.convertFrom(dto);
  });
}
