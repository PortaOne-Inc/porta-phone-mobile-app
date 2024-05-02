// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:dto/dto.dart';

@lazySingleton
class HttpDatasource {
  const HttpDatasource(this.dio, @Named('baseUrl') this.host);

  final Dio dio;
  final String host;

  Future<List<ApplicationDTO>> getApplications() async {
    final response = await dio.get<List<Map<String, dynamic>>>('$host/applications/');
    return (response.data!).map(ApplicationDTO.fromJson).toList();
  }

  Future<ApplicationDTO> createApplications(ApplicationDTO applicationDTO) async {
    final response = await dio.post<Map<String, dynamic>>('$host/applications/', data: applicationDTO.toJson());
    return ApplicationDTO.fromJson(response.data!);
  }

  Future<ApplicationDTO> updateApplications(String applicationId, ApplicationDTO application) async {
    final response =
        await dio.patch<Map<String, dynamic>>('$host/applications/$applicationId', data: application.toJson());
    return ApplicationDTO.fromJson(response.data!);
  }

  Future<void> deleteApplications(String applicationId) {
    return dio.delete<void>('$host/applications/$applicationId');
  }

  Future<ApplicationDTO> getApplication(String applicationId) async {
    final response = await dio.get<Map<String, dynamic>>('$host/applications/$applicationId/');
    return ApplicationDTO.fromJson(response.data!);
  }

  Future<ApplicationDTO> incApplicationVersion(String applicationId) async {
    final response = await dio.put<Map<String, dynamic>>('$host/applications/$applicationId/version');
    return ApplicationDTO.fromJson(response.data!);
  }

  Future<List<ThemeDTO>> getThemes(String applicationId) async {
    final response = await dio.get<List<Map<String, dynamic>>>('$host/applications/$applicationId/themes');
    return (response.data!).map(ThemeDTO.fromJson).toList();
  }

  Future<ThemeDTO> createTheme(String applicationId, ThemeDTO themeDTO) async {
    final response = await dio.post<Map<String, dynamic>>(
      '$host/applications/$applicationId/themes',
      data: themeDTO.toJson(),
    );
    return ThemeDTO.fromJson(response.data!);
  }

  Future<ThemeDTO> updateTheme(String applicationId, ThemeDTO themeDTO) async {
    final response = await dio.patch<Map<String, dynamic>>('$host/applications/$applicationId/themes/${themeDTO.id}',
        data: themeDTO.toJson());
    return ThemeDTO.fromJson(response.data!);
  }

  Future<ThemeDTO> updateStaticTheme(ThemeDTO themeDTO) async {
    final response = await dio.put<Map<String, dynamic>>('$host/static/themes', data: themeDTO.toJson());
    return ThemeDTO.fromJson(response.data!);
  }

  Future<ThemeDTO> getTheme(String applicationId, String themeId) async {
    try {
      final response = await dio.get<Map<String, dynamic>>('$host/applications/$applicationId/themes/$themeId');
      return ThemeDTO.fromJson(response.data!);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> downloadTheme(String applicationId, String themeId) async {
    final url = Uri.parse('$host/applications/$applicationId/themes/$themeId');
    final response = await dio.getUri<dynamic>(url);
    final blob = html.Blob([response.data]);
    final anchorElement = html.AnchorElement(
      href: html.Url.createObjectUrlFromBlob(blob),
    )..setAttribute('download', 'theme-$themeId.json');
    html.document.body!.children.add(anchorElement);
    anchorElement.click();
    html.document.body!.children.remove(anchorElement);
  }

  Future<ThemeDTO> getStaticTheme() async {
    final response = await dio.get<Map<String, dynamic>>('$host/static/themes');
    return ThemeDTO.fromJson(response.data!);
  }

  Future<void> deleteTheme(String applicationId, String themeId) async {
    await dio.delete<void>('$host/applications/$applicationId/themes/$themeId');
    return;
  }
}
