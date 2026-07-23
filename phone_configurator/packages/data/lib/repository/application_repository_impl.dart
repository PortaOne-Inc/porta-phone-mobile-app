import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:data/datasource/datasource.dart';
import 'package:data/mappers/mappers.dart';

import '../common/api_exception_mapper.dart';
import '../dto/dto.dart';

// TODO(DMITRO): Models can be used in both the data and domain layers to ensure a proper way to return models from a repository.
// TODO(DMITRO): The domain layer should be aware of DTOs
@Injectable(as: ApplicationRepository)
class ApplicationRepositoryImpl extends ApplicationRepository {
  ApplicationRepositoryImpl({required this.configuratorBackandDatasource, required this.applicationMapper});

  final ConfiguratorBackandDatasource configuratorBackandDatasource;
  final CommonMapper<ApplicationModel, ApplicationDTO> applicationMapper;

  @override
  Future<ApplicationModel> createApplication(ApplicationModel model) => guardApiCall(() async {
    final dtoParam = applicationMapper.convertTo(model);
    final dto = await configuratorBackandDatasource.createApplications(dtoParam);
    return applicationMapper.convertFrom(dto);
  });

  @override
  Future<List<ApplicationModel>> getUserApplications() => guardApiCall(() async {
    final dto = await configuratorBackandDatasource.getApplications();
    return applicationMapper.convertListFrom(dto);
  });

  @override
  Future<void> deleteApplication(String applicationId) =>
      guardApiCall(() => configuratorBackandDatasource.deleteApplications(applicationId));

  @override
  Future<ApplicationModel> updateApplication(String applicationId, ApplicationModel model) => guardApiCall(() async {
    final dtoParam = applicationMapper.convertTo(model);
    final dto = await configuratorBackandDatasource.putApplication(applicationId, dtoParam);
    return applicationMapper.convertFrom(dto);
  });

  @override
  Future<ApplicationModel> getApplication(String id) => guardApiCall(() async {
    final dto = await configuratorBackandDatasource.getApplication(applicationId: id);
    return applicationMapper.convertFrom(dto);
  });

  @override
  Future<ApplicationModel> incApplicationVersion(String applicationId) => guardApiCall(() async {
    final dto = await configuratorBackandDatasource.incApplicationVersion(applicationId);
    return applicationMapper.convertFrom(dto);
  });

  @override
  Future<Map<String, dynamic>> getApplicationEnvironment(String applicationId) =>
      guardApiCall(() => configuratorBackandDatasource.getApplicationEnvironment(applicationId));

  @override
  Future<Map<String, dynamic>> updateApplicationEnvironment(String applicationId, Map<String, dynamic> environment) =>
      guardApiCall(() => configuratorBackandDatasource.updateApplicationEnvironment(applicationId, environment));

  @override
  Future<ApplicationModel> updateThemeBindings(
    String applicationId, {
    String? defaultThemeId,
    Map<String, String>? themeByEnv,
  }) => guardApiCall(() async {
    final dto = await configuratorBackandDatasource.updateThemeBindings(
      applicationId,
      defaultThemeId: defaultThemeId,
      themeByEnv: themeByEnv,
    );
    return applicationMapper.convertFrom(dto);
  });

  @override
  Future<String> resolveThemeIdForBuild(String applicationId, {String env = 'prod'}) =>
      guardApiCall(() => configuratorBackandDatasource.resolveThemeIdForBuild(applicationId, env: env));
}
