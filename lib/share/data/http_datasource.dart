import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/core/env/app_environment.dart';
import 'package:webtrit_configurator/share/entity/dto/dto.dart';

@lazySingleton
class HttpDatasource {
  final Dio dio;
  final AppEnvironment environment;

  HttpDatasource(this.dio, this.environment);

  Future<List<ApplicationDTO>> getApplications() async {
    final response = await dio.get('${environment.endpoints.host}/applications/');
    return (response.data as List).map((data) => ApplicationDTO.fromJson(data)).toList();
  }

  Future<ApplicationDTO> createApplications(ApplicationDTO applicationDTO) async {
    final response = await dio.post('${environment.endpoints.host}/applications/', data: applicationDTO.toJson());
    return ApplicationDTO.fromJson(response.data);
  }

  Future<ApplicationDTO> updateApplications(String applicationId, ApplicationDTO application) async {
    final response =
        await dio.patch('${environment.endpoints.host}/applications/$applicationId', data: application.toJson());
    return ApplicationDTO.fromJson(response.data);
  }

  Future deleteApplications(String applicationId) {
    return dio.delete('${environment.endpoints.host}/applications/$applicationId');
  }

  Future<ApplicationDTO> getApplication(String applicationId) async {
    final response = await dio.get('${environment.endpoints.host}/applications/$applicationId/');
    return ApplicationDTO.fromJson(response.data);
  }

  Future<ApplicationDTO> incApplicationVersion(String applicationId) async {
    final response = await dio.put('${environment.endpoints.host}/applications/$applicationId/version');
    return ApplicationDTO.fromJson(response.data);
  }

  Future<List<ThemeDTO>> getThemes(String applicationId) async {
    final response = await dio.get('${environment.endpoints.host}/applications/$applicationId/themes');
    return (response.data as List).map((data) => ThemeDTO.fromJson(data)).toList();
  }

  Future<ThemeDTO> createTheme(String applicationId, ThemeDTO themeDTO) async {
    final response = await dio.post(
      '${environment.endpoints.host}/applications/$applicationId/themes',
      data: themeDTO.toJson(),
    );
    return ThemeDTO.fromJson(response.data);
  }

  Future<ThemeDTO> updateTheme(String applicationId, ThemeDTO themeDTO) async {
    final response = await dio.patch('${environment.endpoints.host}/applications/$applicationId/themes/${themeDTO.id}',
        data: themeDTO.toJson());
    return ThemeDTO.fromJson(response.data);
  }

  Future<ThemeDTO> updateStaticTheme(ThemeDTO themeDTO) async {
    final response = await dio.put('${environment.endpoints.host}/static/themes', data: themeDTO.toJson());
    return ThemeDTO.fromJson(response.data);
  }

  Future<ThemeDTO> getTheme(String applicationId, String themeId) async {
    final response = await dio.get('${environment.endpoints.host}/applications/$applicationId/themes/$themeId');
    return ThemeDTO.fromJson(response.data);
  }

  Future<ThemeDTO> getStaticTheme() async {
    final response = await dio.get('${environment.endpoints.host}/static/themes');
    return ThemeDTO.fromJson(response.data);
  }

  Future deleteTheme(String applicationId, String themeId) async {
    await dio.delete('${environment.endpoints.host}/applications/$applicationId/themes/$themeId');
    return;
  }
}
