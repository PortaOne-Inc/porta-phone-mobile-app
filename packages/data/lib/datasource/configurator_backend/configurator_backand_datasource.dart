import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import 'package:dto/dto.dart';

import 'package:domain/domain.dart';

import 'package:data/dto/dto.dart';
import 'package:data/models/models.dart';
import '../preferences/preferences.dart';

import 'configurator_backand_api.dart';

@lazySingleton
class ConfiguratorBackandDatasource {
  const ConfiguratorBackandDatasource(
    this.client,
    this.authTokenDataSource,
  );

  final Dio client;
  final AuthPrefDatasource authTokenDataSource;

  // Auth

  Future<AuthResponseDTO> login(LoginCredentials login) async {
    final response = await client.post<Map<String, dynamic>>(
      AuthConfiguratorBackandAPI.login,
      data: login.toJson(),
    );
    final responseData = Map<String, dynamic>.of(response.data!);
    return AuthResponseDTO.fromJson(responseData);
  }

  Future<void> deployBuilds(DeployApplicationDto deploy) async {
    await client.post<Map<String, dynamic>>(
      DeployConfiguratorBackandAPI.deployApplications,
      data: deploy.toJson(),
    );
  }

  Future<AuthResponseDTO> register(LoginCredentials login) async {
    final response = await client.post<Map<String, dynamic>>(AuthConfiguratorBackandAPI.register);
    final responseData = Map<String, dynamic>.of(response.data!);
    return AuthResponseDTO.fromJson(responseData);
  }

  // Applications

  Future<List<ApplicationDTO>> getApplications() async {
    final response = await client.get<List<dynamic>>(
      ApplicationConfiguratorBackandAPI.applications,
    );
    final responseData = List.of(response.data?.toList() ?? []);
    return responseData.map((it) => ApplicationDTO.fromJson(it as Map<String, dynamic>)).toList();
  }

  Future<ApplicationDTO> createApplications(ApplicationDTO applicationDTO) async {
    final response = await client.post<Map<String, dynamic>>(
      ApplicationConfiguratorBackandAPI.applications,
      data: applicationDTO.toJson(),
    );
    return ApplicationDTO.fromJson(response.data!);
  }

  Future<ApplicationDTO> putApplication(String applicationId, ApplicationDTO application) async {
    final response = await client.put<Map<String, dynamic>>(
      ApplicationConfiguratorBackandAPI.application(applicationId),
      data: application.toJson(),
    );
    return ApplicationDTO.fromJson(response.data!);
  }

  Future<void> deleteApplications(String applicationId) {
    return client.delete<void>(
      ApplicationConfiguratorBackandAPI.application(applicationId),
    );
  }

  Future<ApplicationDTO> getApplication(String applicationId) async {
    final response = await client.get<Map<String, dynamic>>(
      ApplicationConfiguratorBackandAPI.application(applicationId),
    );
    return ApplicationDTO.fromJson(response.data!);
  }

  Future<ApplicationDTO> incApplicationVersion(String applicationId) async {
    final response = await client.put<Map<String, dynamic>>(
      ApplicationConfiguratorBackandAPI.applicationVersion(applicationId),
    );
    return ApplicationDTO.fromJson(response.data!);
  }

  // Themes

  Future<List<ThemeDTO>> getThemes(String applicationId) async {
    final response = await client.get<List<dynamic>>(
      ThemeConfiguratorBackandAPI.themes(applicationId),
    );
    return (response.data!).cast<Map<String, dynamic>>().map(ThemeDTO.fromJson).toList();
  }

  Future<ThemeDTO> createTheme(String applicationId, ThemeDTO themeDTO) async {
    final response = await client.post<Map<String, dynamic>>(
      ThemeConfiguratorBackandAPI.themes(applicationId),
      data: themeDTO.toJson(),
    );
    return ThemeDTO.fromJson(response.data!);
  }

  Future<ThemeDTO> updateTheme(String applicationId, ThemeDTO themeDTO) async {
    final response = await client.patch<Map<String, dynamic>>(
      ThemeConfiguratorBackandAPI.theme(applicationId, themeDTO.id!),
      data: themeDTO.toJson(),
    );
    return ThemeDTO.fromJson(response.data!);
  }

  Future<ThemeDTO> getTheme(String applicationId, String themeId) async {
    final response = await client.get<Map<String, dynamic>>(
      ThemeConfiguratorBackandAPI.theme(applicationId, themeId),
    );
    return ThemeDTO.fromJson(response.data!);
  }

  Future<void> deleteTheme(String applicationId, String themeId) async {
    await client.delete<void>(
      ThemeConfiguratorBackandAPI.theme(applicationId, themeId),
    );
    return Future.value();
  }

  // Translations

  Future<List<TranslationHttpModel>> getTranslations() async {
    final response = await client.get<List<dynamic>>(
      TranslationConfiguratorBackandAPI.translations,
    );
    final responseData = List.of(response.data?.toList() ?? []);
    return responseData.map((it) => TranslationHttpModel.fromJson(it as Map<String, dynamic>)).toList();
  }

  Future<List<TranslationHttpModel>> getTranslationOverrides(String applicationId) async {
    final response = await client.get<List<dynamic>>(
      TranslationConfiguratorBackandAPI.translationOverrides(applicationId),
    );
    final responseData = List.of(response.data?.toList() ?? []);
    return responseData.map((it) => TranslationHttpModel.fromJson(it as Map<String, dynamic>)).toList();
  }

  Future<void> setTranslationOverride(String applicationId, TranslationHttpModel translation) async {
    await client.post<void>(
      TranslationConfiguratorBackandAPI.translationOverrides(applicationId),
      data: translation.toJson(),
    );
    return;
  }

  Future<void> deleteTranslationOverride(String applicationId, TranslationHttpModel translation) async {
    await client.delete<void>(
      TranslationConfiguratorBackandAPI.translationOverrides(applicationId),
      data: translation.toJson(),
    );
    return;
  }

  // Phones branch data

  Future<List<PhoneBranchDto>> getPhoneBranches() async {
    final response = await client.get<List<dynamic>>(
      DeployConfiguratorBackandAPI.phoneBranched,
    );
    final responseData = List.of(response.data?.toList() ?? []);
    return responseData.map((it) => PhoneBranchDto.fromJson(it as Map<String, dynamic>)).toList();
  }
}
