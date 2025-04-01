import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import 'package:domain/domain.dart';

import 'package:data/dto/dto.dart';
import 'package:data/models/models.dart';
import 'package:data/common/common.dart';

import '../interceptors/interceptors.dart';

import 'configurator_backand_api.dart';

export 'package:dio/dio.dart';

/// A data source class for interacting with the Configurator Backend API.
@lazySingleton
class ConfiguratorBackandDatasource {
  /// Creates an instance of [ConfiguratorBackandDatasource].
  ///
  /// Adds the [_unauthorizedInterceptor] to the [_client]'s interceptors.
  ConfiguratorBackandDatasource(this._client, this._unauthorizedInterceptor) {
    _client.interceptors.add(_unauthorizedInterceptor);
  }

  final Dio _client;
  final UnauthorizedInterceptor _unauthorizedInterceptor;

  /// Sets a listener for unauthorized events.
  ///
  /// The [unauthenticatedListener] will be called when the token expires.
  void setUnauthorizedListener(VoidCallback unauthenticatedListener) =>
      _unauthorizedInterceptor.setOnTokenExpired(unauthenticatedListener);

  /// Logs in a user with the given [login] credentials.
  ///
  /// Returns an [AuthResponseDTO] containing the authentication response.
  Future<AuthResponseDTO> login(LoginCredentials login) async {
    final response = await _client.post<Map<String, dynamic>>(
      AuthConfiguratorBackandAPI.login,
      data: login.toJson(),
    );
    final responseData = Map<String, dynamic>.of(response.data!);
    return AuthResponseDTO.fromJson(responseData);
  }

  /// Deploys builds with the given [deploy] data.
  Future<void> deployBuilds(DeployApplicationDto deploy) async {
    await _client.post<Map<String, dynamic>>(
      DeployConfiguratorBackandAPI.deployApplications,
      data: deploy.toJson(),
    );
  }

  /// Registers a user with the given [login] credentials.
  ///
  /// Returns an [AuthResponseDTO] containing the registration response.
  Future<AuthResponseDTO> register(LoginCredentials login) async {
    final response = await _client.post<Map<String, dynamic>>(AuthConfiguratorBackandAPI.register);
    final responseData = Map<String, dynamic>.of(response.data!);
    return AuthResponseDTO.fromJson(responseData);
  }

  /// Retrieves a list of applications.
  ///
  /// Returns a list of [ApplicationDTO] objects.
  Future<List<ApplicationDTO>> getApplications() async {
    final response = await _client.get<List<dynamic>>(
      ApplicationConfiguratorBackandAPI.applications,
    );
    final responseData = List.of(response.data?.toList() ?? []);
    return responseData.map((it) => ApplicationDTO.fromJson(it as Map<String, dynamic>)).toList();
  }

  /// Creates a new application with the given [applicationDTO] data.
  ///
  /// Returns the created [ApplicationDTO].
  Future<ApplicationDTO> createApplications(ApplicationDTO applicationDTO) async {
    final response = await _client.post<Map<String, dynamic>>(
      ApplicationConfiguratorBackandAPI.applications,
      data: applicationDTO.toJson(),
    );
    return ApplicationDTO.fromJson(response.data!);
  }

  /// Updates an application with the given [applicationId] and [application] data.
  ///
  /// Returns the updated [ApplicationDTO].
  Future<ApplicationDTO> putApplication(String applicationId, ApplicationDTO application) async {
    final response = await _client.put<Map<String, dynamic>>(
      ApplicationConfiguratorBackandAPI.application(applicationId),
      data: application.toJson(),
    );
    return ApplicationDTO.fromJson(response.data!);
  }

  /// Deletes an application with the given [applicationId].
  Future<void> deleteApplications(String applicationId) {
    return _client.delete<void>(
      ApplicationConfiguratorBackandAPI.application(applicationId),
    );
  }

  /// Retrieves an application with the given [applicationId] and optional [headers].
  ///
  /// Returns the retrieved [ApplicationDTO].
  Future<ApplicationDTO> getApplication({
    required String applicationId,
    Map<String, dynamic>? headers,
  }) async {
    final response = await _client.get<Map<String, dynamic>>(
      ApplicationConfiguratorBackandAPI.application(applicationId),
      options: Options(headers: headers),
    );

    return ApplicationDTO.fromJson(response.data!);
  }

  /// Increments the version of an application with the given [applicationId].
  ///
  /// Returns the updated [ApplicationDTO].
  Future<ApplicationDTO> incApplicationVersion(String applicationId) async {
    final response = await _client.put<Map<String, dynamic>>(
      ApplicationConfiguratorBackandAPI.applicationVersion(applicationId),
    );
    return ApplicationDTO.fromJson(response.data!);
  }

  /// Retrieves the environment of an application with the given [applicationId].
  ///
  /// Returns a map containing the environment data.
  Future<Map<String, dynamic>> getApplicationEnvironment(String applicationId) async {
    final response = await _client.get<Map<String, dynamic>>(
      ApplicationConfiguratorBackandAPI.applicationEnvironment(applicationId),
    );
    return response.data ?? {};
  }

  /// Updates the environment of an application with the given [applicationId] and [environment] data.
  ///
  /// Returns a map containing the updated environment data.
  Future<Map<String, dynamic>> updateApplicationEnvironment(
    String applicationId,
    Map<String, dynamic> environment,
  ) async {
    final response = await _client.put<Map<String, dynamic>>(
      ApplicationConfiguratorBackandAPI.applicationEnvironment(applicationId),
      data: environment,
    );
    return response.data ?? {};
  }

  /// Retrieves a list of themes for the given [applicationId].
  ///
  /// Returns a list of [ThemeDTO] objects.
  Future<List<ThemeDTO>> getApplicationThemes(String applicationId) async {
    final response = await _client.get<List<dynamic>>(
      ThemeConfiguratorBackandAPI.applicationThemes(applicationId),
    );
    return (response.data!).cast<Map<String, dynamic>>().map(ThemeDTO.fromJson).toList();
  }

  /// Returns a list of [ThemeDTO] objects.
  Future<List<ThemeDTO>> getAllThemes() async {
    try {
      final response = await _client.get<List<dynamic>>(
        ThemeConfiguratorBackandAPI.allThemes(),
      );
      final re = (response.data!).cast<Map<String, dynamic>>().map(ThemeDTO.fromJson).toList();
      return re;
    } catch (e, st) {
      throw BaseException(message: e.toString());
    }
  }

  /// Creates a new theme for the given [applicationId] with the given [themeDTO] data.
  ///
  /// Returns the created [ThemeDTO].
  Future<ThemeDTO> createTheme(String applicationId, ThemeDTO themeDTO) async {
    final response = await _client.post<Map<String, dynamic>>(
      ThemeConfiguratorBackandAPI.applicationThemes(applicationId),
      data: themeDTO.toJson(),
    );
    return ThemeDTO.fromJson(response.data!);
  }

  /// Updates a theme for the given [applicationId] with the given [themeDTO] data.
  ///
  /// Returns the updated [ThemeDTO].
  Future<ThemeDTO> updateTheme(String applicationId, ThemeDTO themeDTO) async {
    final response = await _client.patch<Map<String, dynamic>>(
      ThemeConfiguratorBackandAPI.theme(applicationId, themeDTO.id!),
      data: themeDTO.toJson(),
    );
    return ThemeDTO.fromJson(response.data!);
  }

  /// Retrieves a theme with the given [applicationId], [themeId], and optional [headers].
  ///
  /// Returns the retrieved [ThemeDTO].
  Future<ThemeDTO> getTheme({
    required String applicationId,
    required String themeId,
    Map<String, dynamic>? headers,
  }) async {
    final response = await _client.get<Map<String, dynamic>>(
      ThemeConfiguratorBackandAPI.theme(applicationId, themeId),
      options: Options(headers: headers),
    );

    return ThemeDTO.fromJson(response.data!);
  }

  /// Deletes a theme with the given [applicationId] and [themeId].
  Future<void> deleteTheme(String applicationId, String themeId) async {
    await _client.delete<void>(
      ThemeConfiguratorBackandAPI.theme(applicationId, themeId),
    );
    return Future.value();
  }

  /// Adds assets to a theme with the given [applicationId], [themeId], and [assets] data.
  ///
  /// Returns a list of [ThemeAssetDto] objects.
  Future<List<ThemeAssetDto>> addAssets(String applicationId, String themeId, List<ThemeAssetDto> assets) async {
    final response = await _client.patch<Map<String, dynamic>>(
      '${ThemeConfiguratorBackandAPI.theme(applicationId, themeId)}/assets/add',
      data: assets.map((it) => it.toJson()).toList(),
    );

    final theme = ThemeDTO.fromJson(response.data!);

    return theme.assets;
  }

  /// Removes an asset by its [assetId] from a theme with the given [applicationId] and [themeId].
  ///
  /// Returns a list of [ThemeAssetDto] objects.
  Future<List<ThemeAssetDto>> removeAssetById(
    String applicationId,
    String themeId,
    int assetId,
  ) async {
    final response = await _client.patch<Map<String, dynamic>>(
      '${ThemeConfiguratorBackandAPI.theme(applicationId, themeId)}/assets/remove/$assetId',
    );

    final theme = ThemeDTO.fromJson(response.data!);

    return theme.assets;
  }

  /// Updates an asset by its [assetId] in a theme with the given [applicationId], [themeId], and [updatedAsset] data.
  ///
  /// Returns a list of [ThemeAssetDto] objects.
  Future<List<ThemeAssetDto>> updateAssetById(
    String applicationId,
    String themeId,
    int assetId,
    ThemeAssetDto updatedAsset,
  ) async {
    final response = await _client.patch<Map<String, dynamic>>(
      '${ThemeConfiguratorBackandAPI.theme(applicationId, themeId)}/assets/update/$assetId',
      data: updatedAsset.toJson(),
    );

    final theme = ThemeDTO.fromJson(response.data!);

    return theme.assets;
  }

  /// Deletes all assets from a theme with the given [applicationId] and [themeId].
  Future<void> deleteAllAssets(
    String applicationId,
    String themeId,
  ) async {
    await _client.delete<void>(
      '${ThemeConfiguratorBackandAPI.theme(applicationId, themeId)}/assets',
    );
  }

  /// Updates the launch assets of a theme with the given [applicationId], [themeId], and [launchAssets] data.
  ///
  /// Returns the updated [ThemeDTO].
  Future<ThemeDTO> updateLaunchAssets(String applicationId, String themeId, LaunchAssetsDto launchAssets) async {
    final response = await _client.patch<Map<String, dynamic>>(
      '${ThemeConfiguratorBackandAPI.theme(applicationId, themeId)}/launch-assets/update',
      data: launchAssets.toJson(),
    );
    return ThemeDTO.fromJson(response.data!);
  }

  /// Deletes the launch assets from a theme with the given [applicationId] and [themeId].
  Future<void> deleteLaunchAssets(String applicationId, String themeId) async {
    await _client.delete<void>(
      '${ThemeConfiguratorBackandAPI.theme(applicationId, themeId)}/launch-assets',
    );
  }

  /// Updates the splash asset of a theme with the given [applicationId], [themeId], and [splashAsset] data.
  ///
  /// Returns the updated [ThemeDTO].
  Future<ThemeDTO> updateSplashAsset(String applicationId, String themeId, SplashAssetsDto splashAsset) async {
    final response = await _client.patch<Map<String, dynamic>>(
      '${ThemeConfiguratorBackandAPI.theme(applicationId, themeId)}/splash-asset/update',
      data: splashAsset.toJson(),
    );
    return ThemeDTO.fromJson(response.data!);
  }

  /// Deletes the splash asset from a theme with the given [applicationId] and [themeId].
  Future<void> deleteSplashAsset(String applicationId, String themeId) async {
    await _client.delete<void>(
      '${ThemeConfiguratorBackandAPI.theme(applicationId, themeId)}/splash-asset',
    );
  }

  /// Retrieves a list of translations.
  ///
  /// Returns a list of [TranslationHttpModel] objects.
  Future<List<TranslationHttpModel>> getTranslations() async {
    final response = await _client.get<List<dynamic>>(
      TranslationConfiguratorBackandAPI.translations,
    );
    final responseData = List.of(response.data?.toList() ?? []);
    return responseData.map((it) => TranslationHttpModel.fromJson(it as Map<String, dynamic>)).toList();
  }

  /// Retrieves a list of translation overrides for the given [applicationId].
  ///
  /// Returns a list of [TranslationHttpModel] objects.
  Future<List<TranslationHttpModel>> getTranslationOverrides(String applicationId) async {
    final response = await _client.get<List<dynamic>>(
      TranslationConfiguratorBackandAPI.translationOverrides(applicationId),
    );
    final responseData = List.of(response.data?.toList() ?? []);
    return responseData.map((it) => TranslationHttpModel.fromJson(it as Map<String, dynamic>)).toList();
  }

  /// Sets a translation override for the given [applicationId] with the given [translation] data.
  Future<void> setTranslationOverride(String applicationId, TranslationHttpModel translation) async {
    await _client.post<void>(
      TranslationConfiguratorBackandAPI.translationOverrides(applicationId),
      data: translation.toJson(),
    );
    return;
  }

  /// Deletes a translation override for the given [applicationId] with the given [translation] data.
  Future<void> deleteTranslationOverride(String applicationId, TranslationHttpModel translation) async {
    await _client.delete<void>(
      TranslationConfiguratorBackandAPI.translationOverrides(applicationId),
      data: translation.toJson(),
    );
    return;
  }

  /// Retrieves a list of phone branches.
  ///
  /// Returns a list of [PhoneBranchDto] objects.
  Future<List<PhoneBranchDto>> getPhoneBranches() async {
    final response = await _client.get<List<dynamic>>(
      DeployConfiguratorBackandAPI.phoneBranched,
    );
    final responseData = List.of(response.data?.toList() ?? []);
    return responseData.map((it) => PhoneBranchDto.fromJson(it as Map<String, dynamic>)).toList();
  }

  /// Retrieves the app version for the given [branch].
  ///
  /// Returns the [AppVersion] for the specified branch.
  ///
  /// Throws an [ArgumentError] if the branch name is empty.
  /// Throws an [Exception] if the app version is not found in the response.
  Future<AppVersion> getAppVersionByBranch(String branch) async {
    try {
      // Make sure the branch parameter is not empty
      if (branch.isEmpty) {
        throw ArgumentError('Branch name cannot be empty');
      }

      // Construct the full URL with query parameters
      final response = await _client.get<Map<String, dynamic>>(
        DeployConfiguratorBackandAPI.getAppVersionByBranch,
        queryParameters: {
          'branch': branch,
        },
      );

      // Check if the response contains the expected data
      if (response.data == null || !response.data!.containsKey('app_version')) {
        throw Exception('app_version not found in the response for branch: $branch');
      }

      // Parse the response data into AppVersion DTO
      final appVersion = AppVersion.fromJson(response.data!);

      return appVersion;
    } on DioException catch (dioError) {
      // Handle Dio-specific errors
      if (dioError.response != null) {
        // Server responded with a non-2xx status code
        throw Exception(
            'Failed to fetch app_version: ${dioError.response?.statusCode} ${dioError.response?.statusMessage}');
      } else {
        // Something happened while setting up the request
        throw Exception('Failed to fetch app_version: ${dioError.message}');
      }
    } catch (e) {
      // Handle any other errors
      throw Exception('Failed to fetch app_version: $e');
    }
  }
}
