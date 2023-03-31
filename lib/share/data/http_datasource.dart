import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/core/config/env/app_environment.dart';
import 'package:webtrit_configurator/share/entity/dto/dto.dart';

@singleton
class HttpDatasource {
  final Dio dio;
  final AppEnvironment environment;

  HttpDatasource(this.dio, this.environment);

  Future<List<ApplicationDTO>> getApplications() async {
    final response = await dio.get('${environment.endpoints.url}/applications/');
    return (response.data as List).map((data) => ApplicationDTO.fromJson(data)).toList();
  }

  Future<ApplicationDTO> createApplications(ApplicationDTO vendorDTO) async {
    final response = await dio.post('${environment.endpoints.url}/applications/', data: vendorDTO.toJson());
    return ApplicationDTO.fromJson(response.data);
  }

  Future<ApplicationDTO> updateApplications(String applicationId, ApplicationDTO application) async {
    final response =
        await dio.patch('${environment.endpoints.url}/applications/$applicationId', data: application.toJson());
    return ApplicationDTO.fromJson(response.data);
  }

  Future<ApplicationDTO> deleteApplications(ApplicationDTO application) async {
    final response = await dio.delete('${environment.endpoints.url}/applications/', data: application.toJson());
    return ApplicationDTO.fromJson(response.data);
  }

  Future<ApplicationDTO> getApplication(String applicationId) async {
    final response = await dio.get('${environment.endpoints.url}/applications/$applicationId/');
    return ApplicationDTO.fromJson(response.data);
  }

  Future<List<ThemeDTO>> getThemes(String applicationId) async {
    final response = await dio.get('${environment.endpoints.url}/applications/$applicationId/themes');
    return (response.data as List).map((data) => ThemeDTO.fromJson(data)).toList();
  }

  Future<ThemeDTO> createTheme(String applicationId, ThemeDTO themeDTO) async {
    final response = await dio.post(
      '${environment.endpoints.url}/applications/$applicationId/themes',
      data: themeDTO.toJson(),
    );
    return ThemeDTO.fromJson(response.data);
  }

  Future<ThemeDTO> updateTheme(String applicationId, ThemeDTO themeDTO) async {
    final response = await dio.patch('${environment.endpoints.url}/applications/$applicationId/themes/${themeDTO.id}',
        data: themeDTO.toJson());
    return ThemeDTO.fromJson(response.data);
  }

  Future<ThemeDTO> getTheme(String applicationId, String themeId) async {
    final response = await dio.get('${environment.endpoints.url}/applications/$applicationId/themes/$themeId');
    return ThemeDTO.fromJson(response.data);
  }

  Future<ThemeDTO> deleteTheme(String applicationId, String themeId) async {
    final response = await dio.delete('${environment.endpoints.url}/applications/$applicationId/themes/$themeId');
    return ThemeDTO.fromJson(response.data);
  }
}
