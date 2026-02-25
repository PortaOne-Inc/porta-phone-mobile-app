import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';
import 'package:data/mappers/mappers.dart';
import 'package:data/datasource/datasource.dart';
import 'package:data/dto/dto.dart';

import '../common/api_exception_mapper.dart';

@Injectable(as: WidgetConfigRepository)
class WidgetConfigRepositoryImpl extends WidgetConfigRepository {
  WidgetConfigRepositoryImpl({
    required this.configuratorBackendDatasource,
    required this.widgetConfigMapper,
  });

  final ConfiguratorBackandDatasource configuratorBackendDatasource;
  final CommonMapper<WidgetsConfig, WidgetsConfigDto> widgetConfigMapper;

  @override
  Future<WidgetsConfig> getByThemeVariant(
    String applicationId,
    String themeId,
    BrightnessVariant variant,
  ) async {
    try {
      final dto = await configuratorBackendDatasource
          .getWidgetConfigByThemeVariant(
            applicationId: applicationId,
            themeId: themeId,
            variant: variant.name,
          );
      return widgetConfigMapper.convertFrom(dto);
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<List<WidgetsConfig>> listForTheme(
    String applicationId,
    String themeId,
  ) async {
    try {
      final dtos = await configuratorBackendDatasource
          .listWidgetConfigsForTheme(
            applicationId: applicationId,
            themeId: themeId,
          );
      return dtos.map(widgetConfigMapper.convertFrom).toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<WidgetsConfig> upsertByThemeVariant(
    String applicationId,
    String themeId,
    BrightnessVariant variant,
    Map<String, dynamic>? config, {
    int? expectedVersion,
  }) async {
    try {
      final dto = await configuratorBackendDatasource.upsertWidgetConfigVariant(
        applicationId: applicationId,
        themeId: themeId,
        variant: variant.name,
        config: config,
        expectedVersion: expectedVersion,
      );
      return widgetConfigMapper.convertFrom(dto);
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<Map<String, WidgetsConfig>> ensurePair(
    String applicationId,
    String themeId,
  ) async {
    try {
      final map = await configuratorBackendDatasource.ensureWidgetConfigPair(
        applicationId: applicationId,
        themeId: themeId,
      );
      return map.map((k, v) => MapEntry(k, widgetConfigMapper.convertFrom(v)));
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
