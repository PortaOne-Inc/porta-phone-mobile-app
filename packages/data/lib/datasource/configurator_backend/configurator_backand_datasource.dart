import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import 'package:domain/domain.dart';

import 'package:data/dto/dto.dart';
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

  void addInterceptor(Interceptor interceptor) {
    _client.interceptors.add(interceptor);
  }

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
    final response = await _client.post<Map<String, dynamic>>(
      AuthConfiguratorBackandAPI.register,
    );
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
    return responseData
        .map((it) => ApplicationDTO.fromJson(it as Map<String, dynamic>))
        .toList();
  }

  /// Creates a new application with the given [applicationDTO] data.
  ///
  /// Returns the created [ApplicationDTO].
  Future<ApplicationDTO> createApplications(
    ApplicationDTO applicationDTO,
  ) async {
    final response = await _client.post<Map<String, dynamic>>(
      ApplicationConfiguratorBackandAPI.applications,
      data: applicationDTO.toJson(),
    );
    return ApplicationDTO.fromJson(response.data!);
  }

  /// Updates an application with the given [applicationId] and [application] data.
  ///
  /// Returns the updated [ApplicationDTO].
  Future<ApplicationDTO> putApplication(
    String applicationId,
    ApplicationDTO application,
  ) async {
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
  Future<Map<String, dynamic>> getApplicationEnvironment(
    String applicationId,
  ) async {
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
    return (response.data!)
        .cast<Map<String, dynamic>>()
        .map(ThemeDTO.fromJson)
        .toList();
  }

  /// Returns a list of [ThemeDTO] objects.
  Future<List<ThemeDTO>> getAllThemes() async {
    try {
      final response = await _client.get<List<dynamic>>(
        ThemeConfiguratorBackandAPI.allThemes(),
      );
      final re = (response.data!)
          .cast<Map<String, dynamic>>()
          .map(ThemeDTO.fromJson)
          .toList();
      return re;
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  /// Creates a new theme for the given [applicationId] with the given [themeDTO] data.
  ///
  /// Returns the created [ThemeDTO].
  Future<ThemeDTO> createTheme(
    String applicationId,
    CreateThemeDTO themeDTO,
  ) async {
    final response = await _client.post<Map<String, dynamic>>(
      ThemeConfiguratorBackandAPI.applicationThemes(applicationId),
      data: themeDTO.toJson(),
    );
    return ThemeDTO.fromJson(response.data!);
  }

  Future<ThemeDTO> copyTheme(
    String applicationId,
    String themeId, {
    String? title,
    String? description,
    String? label, // 'dev' | 'stage' | 'prod'
  }) async {
    final body = <String, dynamic>{
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (label != null) 'label': label,
    };

    final response = await _client.post<Map<String, dynamic>>(
      ThemeConfiguratorBackandAPI.copy(applicationId, themeId),
      data: body.isEmpty ? null : body,
    );

    return ThemeDTO.fromJson(response.data!);
  }

  Future<ApplicationDTO> updateThemeBindings(
    String applicationId, {
    String? defaultThemeId,
    Map<String, String>? themeByEnv, // e.g. {'dev': 'theme_dev_id', ...}
  }) async {
    final body = <String, dynamic>{
      if (defaultThemeId != null) 'defaultThemeId': defaultThemeId,
      if (themeByEnv != null) 'themeByEnv': themeByEnv,
    };

    final resp = await _client.patch<Map<String, dynamic>>(
      ApplicationConfiguratorBackandAPI.themeBindings(applicationId),
      data: body.isEmpty ? null : body,
    );
    return ApplicationDTO.fromJson(resp.data!);
  }

  /// Resolve themeId for a given env ('dev' | 'stage' | 'prod'), server returns { "themeId": "..." }.
  Future<String> resolveThemeIdForBuild(
    String applicationId, {
    String env = 'prod',
  }) async {
    final resp = await _client.get<Map<String, dynamic>>(
      ApplicationConfiguratorBackandAPI.resolveTheme(applicationId),
      queryParameters: {'env': env},
    );
    final json = resp.data ?? const <String, dynamic>{};
    final themeId = json['themeId'] as String?;
    if (themeId == null || themeId.isEmpty) {
      throw BaseException(
        message:
            'resolveThemeIdForBuild: themeId is missing in server response',
      );
    }
    return themeId;
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

  /// Retrieves a list of translations.
  ///
  /// Returns a list of [TranslationHttpModel] objects.
  Future<List<TranslationHttpModel>> getTranslations() async {
    final response = await _client.get<List<dynamic>>(
      TranslationConfiguratorBackandAPI.translations,
    );
    final responseData = List.of(response.data?.toList() ?? []);
    return responseData
        .map((it) => TranslationHttpModel.fromJson(it as Map<String, dynamic>))
        .toList();
  }

  /// Retrieves a list of translation overrides for the given [applicationId].
  ///
  /// Returns a list of [TranslationHttpModel] objects.
  Future<List<TranslationHttpModel>> getTranslationOverrides(
    String applicationId,
  ) async {
    final response = await _client.get<List<dynamic>>(
      TranslationConfiguratorBackandAPI.translationOverrides(applicationId),
    );
    final responseData = List.of(response.data?.toList() ?? []);
    return responseData
        .map((it) => TranslationHttpModel.fromJson(it as Map<String, dynamic>))
        .toList();
  }

  /// Sets a translation override for the given [applicationId] with the given [translation] data.
  Future<void> setTranslationOverride(
    String applicationId,
    TranslationHttpModel translation,
  ) async {
    await _client.post<void>(
      TranslationConfiguratorBackandAPI.translationOverrides(applicationId),
      data: translation.toJson(),
    );
    return;
  }

  /// Deletes a translation override for the given [applicationId] with the given [translation] data.
  Future<void> deleteTranslationOverride(
    String applicationId,
    TranslationHttpModel translation,
  ) async {
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
    return responseData
        .map((it) => PhoneBranchDto.fromJson(it as Map<String, dynamic>))
        .toList();
  }

  /// Retrieves a list of callkeep branches.
  ///
  /// Returns a list of [CallkeepBranchDto] objects.
  Future<List<CallkeepBranchDto>> getCallkeepBranches() async {
    final response = await _client.get<List<dynamic>>(
      DeployConfiguratorBackandAPI.callkeepBranches,
    );
    final responseData = List.of(response.data?.toList() ?? []);
    return responseData
        .map((it) => CallkeepBranchDto.fromJson(it as Map<String, dynamic>))
        .toList();
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
        queryParameters: {'branch': branch},
      );

      // Check if the response contains the expected data
      if (response.data == null || !response.data!.containsKey('app_version')) {
        throw Exception(
          'app_version not found in the response for branch: $branch',
        );
      }

      // Parse the response data into AppVersion DTO
      final appVersion = AppVersion.fromJson(response.data!);

      return appVersion;
    } on DioException catch (dioError) {
      // Handle Dio-specific errors
      if (dioError.response != null) {
        // Server responded with a non-2xx status code
        throw Exception(
          'Failed to fetch app_version: ${dioError.response?.statusCode} ${dioError.response?.statusMessage}',
        );
      } else {
        // Something happened while setting up the request
        throw Exception('Failed to fetch app_version: ${dioError.message}');
      }
    } catch (e) {
      // Handle any other errors
      throw Exception('Failed to fetch app_version: $e');
    }
  }

  Future<AssetDTO> createAsset(
    String applicationId,
    CreateAssetDtoReq body,
  ) async {
    // ignore: parameter_assignments
    body = body.copyWith(applicationId: applicationId);

    final res = await _client.post<Map<String, dynamic>>(
      AssetConfiguratorBackandAPI.assets(applicationId),
      data: body.toJson(),
    );
    return AssetDTO.fromJson(res.data!);
  }

  Future<List<AssetDTO>> getUserAssets(
    String applicationId, {
    bool includeUrl = false,
    int? urlTtlSec,
  }) async {
    final res = await _client.get<List<dynamic>>(
      AssetConfiguratorBackandAPI.assets(applicationId),
      queryParameters: {
        if (includeUrl) 'includeUrl': 'true',
        if (includeUrl && urlTtlSec != null) 'urlTtlSec': urlTtlSec,
      },
    );
    return (res.data ?? const [])
        .cast<Map<String, dynamic>>()
        .map(AssetDTO.fromJson)
        .toList();
  }

  Future<AssetDTO> getAsset(
    String applicationId,
    String assetId, {
    bool includeUrl = false,
    int? urlTtlSec,
  }) async {
    final res = await _client.get<Map<String, dynamic>>(
      AssetConfiguratorBackandAPI.asset(applicationId, assetId),
      queryParameters: {
        if (includeUrl) 'includeUrl': 'true',
        if (includeUrl && urlTtlSec != null) 'urlTtlSec': urlTtlSec,
      },
    );
    return AssetDTO.fromJson(res.data!);
  }

  Future<AssetDTO> updateAsset(
    String applicationId,
    String assetId,
    UpdateAssetDtoReq body,
  ) async {
    final res = await _client.patch<Map<String, dynamic>>(
      AssetConfiguratorBackandAPI.asset(applicationId, assetId),
      data: body.toJson(),
    );
    return AssetDTO.fromJson(res.data!);
  }

  Future<void> deleteAsset(String applicationId, String assetId) async {
    await _client.delete<void>(
      AssetConfiguratorBackandAPI.asset(applicationId, assetId),
    );
  }

  Future<AssetDTO> linkAsset(
    String applicationId,
    String assetId,
    AssetLinkDto link,
  ) async {
    final res = await _client.post<Map<String, dynamic>>(
      AssetConfiguratorBackandAPI.link(applicationId, assetId),
      data: link.toJson(),
    );
    return AssetDTO.fromJson(res.data!);
  }

  Future<AssetDTO> unlinkAsset(
    String applicationId,
    String assetId,
    AssetLinkDto link,
  ) async {
    final res = await _client.post<Map<String, dynamic>>(
      AssetConfiguratorBackandAPI.unlink(applicationId, assetId),
      data: link.toJson(),
    );
    return AssetDTO.fromJson(res.data!);
  }

  Future<String> getAssetDownloadUrl(
    String applicationId,
    String assetId,
  ) async {
    final res = await _client.get<Map<String, dynamic>>(
      AssetConfiguratorBackandAPI.downloadUrl(applicationId, assetId),
    );
    return res.data?['url'] as String;
  }

  Future<AssetDTO> uploadAssetFile({
    required String applicationId,
    required String filename,
    required List<int> bytes,
    required String mimeType,
  }) async {
    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(
        bytes,
        filename: filename,
        contentType: MediaType.parse(mimeType),
      ),
    });

    final res = await _client.post<Map<String, dynamic>>(
      AssetConfiguratorBackandAPI.upload(applicationId),
      data: formData,
      options: Options(headers: {'Content-Type': 'multipart/form-data'}),
    );

    return AssetDTO.fromJson(res.data!);
  }

  Future<List<EmbeddedResourceDto>> getEmbeds(String applicationId) async {
    final response = await _client.get<List<dynamic>>(
      EmbedConfiguratorBackandAPI.embeds(applicationId),
    );
    final list = (response.data ?? []).cast<Map<String, dynamic>>();
    return list.map(EmbeddedResourceDto.fromJson).toList();
  }

  Future<EmbeddedResourceDto> getEmbed({
    required String applicationId,
    required String id,
  }) async {
    final response = await _client.get<Map<String, dynamic>>(
      EmbedConfiguratorBackandAPI.embed(applicationId, id),
    );
    return EmbeddedResourceDto.fromJson(response.data!);
  }

  Future<EmbeddedResourceDto> createEmbed(
    String applicationId,
    EmbeddedResourceDto dto,
  ) async {
    final response = await _client.post<Map<String, dynamic>>(
      EmbedConfiguratorBackandAPI.embeds(applicationId),
      data: dto.toJson(),
    );
    return EmbeddedResourceDto.fromJson(response.data!);
  }

  Future<EmbeddedResourceDto> updateEmbed(
    String applicationId,
    String id,
    EmbeddedResourceDto dto,
  ) async {
    final response = await _client.patch<Map<String, dynamic>>(
      EmbedConfiguratorBackandAPI.embed(applicationId, id),
      data: dto.toJson(),
    );
    return EmbeddedResourceDto.fromJson(response.data!);
  }

  Future<void> deleteEmbed(String applicationId, String id) async {
    await _client.delete<void>(
      EmbedConfiguratorBackandAPI.embed(applicationId, id),
    );
  }

  Future<List<PublicationResourceDto>> getAll(String applicationId) async {
    final resp = await _client.get<List<dynamic>>(
      PublicationResourcesAPI.list(applicationId),
    );
    return (resp.data ?? [])
        .map((e) => PublicationResourceDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<PublicationResourceDto> create(
    String applicationId, {
    String? title,
    String? url,
    String? note,
    String? text,
  }) async {
    final resp = await _client.post<Map<String, dynamic>>(
      PublicationResourcesAPI.create(applicationId),
      data: {'title': title, 'url': url, 'note': note, 'text': text},
    );
    return PublicationResourceDto.fromJson(resp.data!);
  }

  Future<PublicationResourceDto> update(
    String resourceId, {
    String? title,
    String? url,
    String? note,
    String? text,
  }) async {
    final resp = await _client.patch<Map<String, dynamic>>(
      PublicationResourcesAPI.item(resourceId),
      data: {'title': title, 'url': url, 'note': note, 'text': text},
    );
    return PublicationResourceDto.fromJson(resp.data!);
  }

  Future<void> delete(String resourceId) {
    return _client.delete<void>(PublicationResourcesAPI.item(resourceId));
  }

  Future<List<FeatureAccessDto>> getFeatureAccesses({
    required String applicationId,
  }) async {
    final resp = await _client.get<List<dynamic>>(
      FeatureAccessConfiguratorBackandAPI.list(applicationId),
    );
    final data = resp.data ?? const [];
    return data
        .cast<Map<String, dynamic>>()
        .map(FeatureAccessDto.fromJson)
        .toList();
  }

  Future<FeatureAccessDto> getFeatureAccessByTheme({
    required String applicationId,
    required String themeId,
  }) async {
    final resp = await _client.get<Map<String, dynamic>>(
      FeatureAccessConfiguratorBackandAPI.byTheme(applicationId, themeId),
    );
    return FeatureAccessDto.fromJson(resp.data!);
  }

  // idempotent upsert
  Future<FeatureAccessDto> upsertFeatureAccessByTheme({
    required String applicationId,
    required String themeId,
    String? status, // 'draft' | 'published'
    Map<String, dynamic>? config,
    int? expectedVersion,
  }) async {
    final resp = await _client.put<Map<String, dynamic>>(
      FeatureAccessConfiguratorBackandAPI.byTheme(applicationId, themeId),
      data: {
        if (status != null) 'status': status,
        if (config != null) 'config': config,
        if (expectedVersion != null) 'expectedVersion': expectedVersion,
      },
    );
    return FeatureAccessDto.fromJson(resp.data!);
  }

  Future<void> deleteFeatureAccessByTheme({
    required String applicationId,
    required String themeId,
  }) async {
    await _client.delete<void>(
      FeatureAccessConfiguratorBackandAPI.byTheme(applicationId, themeId),
    );
  }

  Future<List<ColorSchemeDto>> listColorSchemes({
    required String applicationId,
    required String themeId,
  }) async {
    final resp = await _client.get<List<dynamic>>(
      ColorSchemeConfiguratorBackandAPI.list(applicationId, themeId),
    );
    final list = resp.data ?? const [];
    return list
        .cast<Map<String, dynamic>>()
        .map(ColorSchemeDto.fromJson)
        .toList();
  }

  Future<ColorSchemeDto> getColorSchemeByVariant({
    required String applicationId,
    required String themeId,
    required String variant,
  }) async {
    final resp = await _client.get<Map<String, dynamic>>(
      ColorSchemeConfiguratorBackandAPI.item(applicationId, themeId, variant),
    );
    return ColorSchemeDto.fromJson(resp.data!);
  }

  /// ensure pair (creates if missing), returns both
  Future<List<ColorSchemeDto>> ensurePair({
    required String applicationId,
    required String themeId,
  }) async {
    final resp = await _client.post<List<dynamic>>(
      ColorSchemeConfiguratorBackandAPI.ensurePair(applicationId, themeId),
    );
    final list = resp.data ?? const [];
    return list
        .cast<Map<String, dynamic>>()
        .map(ColorSchemeDto.fromJson)
        .toList();
  }

  /// upsert with partial deep-merge of `config` on server
  Future<ColorSchemeDto> upsertVariant({
    required String applicationId,
    required String themeId,
    required String variant, // "light" | "dark"
    Map<String, dynamic>? config, // only changed nodes
    int? expectedVersion,
  }) async {
    final resp = await _client.put<Map<String, dynamic>>(
      ColorSchemeConfiguratorBackandAPI.upsertVariant(
        applicationId,
        themeId,
        variant,
      ),
      data: <String, dynamic>{
        if (config != null) 'config': config,
        if (expectedVersion != null) 'expectedVersion': expectedVersion,
      },
    );
    return ColorSchemeDto.fromJson(resp.data!);
  }

  Future<List<WidgetsConfigDto>> listWidgetConfigsForTheme({
    required String applicationId,
    required String themeId,
  }) async {
    final resp = await _client.get<List<dynamic>>(
      WidgetConfiguratorBackendAPI.list(applicationId, themeId),
    );
    final data = resp.data ?? const [];
    return data
        .map((e) => WidgetsConfigDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<WidgetsConfigDto> getWidgetConfigByThemeVariant({
    required String applicationId,
    required String themeId,
    required String variant, // "light" | "dark"
  }) async {
    final resp = await _client.get<Map<String, dynamic>>(
      WidgetConfiguratorBackendAPI.item(applicationId, themeId, variant),
    );
    return WidgetsConfigDto.fromJson(resp.data!);
  }

  /// upsert with partial deep-merge of `config` on server (creates if not exists)
  Future<WidgetsConfigDto> upsertWidgetConfigVariant({
    required String applicationId,
    required String themeId,
    required String variant, // "light" | "dark"
    Map<String, dynamic>? config, // only changed nodes
    int? expectedVersion,
  }) async {
    final resp = await _client.put<Map<String, dynamic>>(
      WidgetConfiguratorBackendAPI.upsertVariant(
        applicationId,
        themeId,
        variant,
      ),
      data: <String, dynamic>{
        if (config != null) 'config': config,
        if (expectedVersion != null) 'expectedVersion': expectedVersion,
      },
    );
    return WidgetsConfigDto.fromJson(resp.data!);
  }

  /// ensure both variants exist; server returns { light: {...}, dark: {...} }
  Future<Map<String, WidgetsConfigDto>> ensureWidgetConfigPair({
    required String applicationId,
    required String themeId,
  }) async {
    final resp = await _client.put<Map<String, dynamic>>(
      WidgetConfiguratorBackendAPI.ensurePair(applicationId, themeId),
    );
    final map = resp.data!;
    return {
      'light': WidgetsConfigDto.fromJson(map['light'] as Map<String, dynamic>),
      'dark': WidgetsConfigDto.fromJson(map['dark'] as Map<String, dynamic>),
    };
  }

  Future<List<PageConfigDto>> getPageConfigsForTheme({
    required String applicationId,
    required String themeId,
  }) async {
    final resp = await _client.get<List<dynamic>>(
      PageConfiguratorBackendAPI.list(applicationId, themeId),
    );
    final data = (resp.data ?? const []).cast<Map<String, dynamic>>();
    return data.map(PageConfigDto.fromJson).toList();
  }

  Future<({PageConfigDto light, PageConfigDto dark})> ensurePageConfigsPair({
    required String applicationId,
    required String themeId,
  }) async {
    final resp = await _client.put<Map<String, dynamic>>(
      PageConfiguratorBackendAPI.ensurePair(applicationId, themeId),
    );
    final json = resp.data!;
    return (
      light: PageConfigDto.fromJson(json['light'] as Map<String, dynamic>),
      dark: PageConfigDto.fromJson(json['dark'] as Map<String, dynamic>),
    );
  }

  Future<PageConfigDto> getPageConfigByThemeVariant({
    required String applicationId,
    required String themeId,
    required String variant, // "light" | "dark"
  }) async {
    final resp = await _client.get<Map<String, dynamic>>(
      PageConfiguratorBackendAPI.item(applicationId, themeId, variant),
    );
    return PageConfigDto.fromJson(resp.data!);
  }

  /// Upsert (partial deep-merge on server)
  Future<PageConfigDto> upsertPageConfigByThemeVariant({
    required String applicationId,
    required String themeId,
    required String variant, // "light" | "dark"
    Map<String, dynamic>? config,
    int? expectedVersion,
  }) async {
    final resp = await _client.put<Map<String, dynamic>>(
      PageConfiguratorBackendAPI.item(applicationId, themeId, variant),
      data: {
        'config': config ?? <String, dynamic>{},
        if (expectedVersion != null) 'expectedVersion': expectedVersion,
      },
    );
    return PageConfigDto.fromJson(resp.data!);
  }

  Future<SplashAssetDto> getSplashAsset({
    required String applicationId,
    required String themeId,
  }) async {
    final resp = await _client.get<Map<String, dynamic>>(
      SplashAssetConfiguratorBackendAPI.item(applicationId, themeId),
      queryParameters: {'includeUrl': true},
    );
    return SplashAssetDto.fromJson(resp.data!);
  }

  Future<void> deleteSplashAsset({
    required String applicationId,
    required String themeId,
  }) async {
    await _client.delete<void>(
      SplashAssetConfiguratorBackendAPI.item(applicationId, themeId),
    );
  }

  Future<SplashConstraintsDefaultsDto> getSplashConstraintsDefaults(
    String applicationId,
    String themeId,
  ) async {
    final resp = await _client.get<Map<String, dynamic>>(
      SplashAssetConfiguratorBackendAPI.constraintsDefaults(
        applicationId,
        themeId,
      ),
    );
    return SplashConstraintsDefaultsDto.fromJson(resp.data!);
  }

  Future<SplashAssetDto> upsertSplashAssetUploadBatch({
    required String applicationId,
    required String themeId,
    required List<ArtifactUploadWire> uploads,
    String? mode,
    FitDto? fit,
    double? padding,
    String? foregroundAssetId,
    String? backgroundAssetId,
    String? backgroundColorHex,
  }) async {
    final form = FormData();
    final dto = <String, dynamic>{
      if (mode != null) 'mode': mode,
      if (foregroundAssetId != null ||
          backgroundAssetId != null ||
          backgroundColorHex != null)
        'source': <String, dynamic>{
          if (foregroundAssetId != null) 'foregroundAssetId': foregroundAssetId,
          if (backgroundAssetId != null) 'backgroundAssetId': backgroundAssetId,
          if (backgroundColorHex != null)
            'backgroundColorHex': backgroundColorHex,
        },
      if (fit != null || padding != null)
        'params': <String, dynamic>{
          if (fit != null) 'fit': fit.name,
          if (padding != null) 'padding': padding,
        },
    };
    form.fields.add(MapEntry('dto', jsonEncode(dto)));

    // files + targets
    final targets = <String, String>{};
    for (var i = 0; i < uploads.length; i++) {
      final u = uploads[i];
      final field = 'file$i';
      final generatedFieldName = u.target.replaceAll(
        RegExp('[^a-zA-Z0-9]'),
        '_',
      );
      if (u.bytes.isEmpty) throw StateError('Upload is empty');
      targets[field] = u.target; // "splash"
      form.files.add(
        MapEntry(
          field,
          MultipartFile.fromBytes(
            u.bytes,
            filename: generatedFieldName,
            contentType: MediaType.parse(u.mimeType),
          ),
        ),
      );
    }
    form.fields.add(MapEntry('targets', jsonEncode(targets)));
    if (form.files.isEmpty) throw StateError('FormData.files is empty');

    final resp = await _client.put<Map<String, dynamic>>(
      SplashAssetConfiguratorBackendAPI.uploadBatch(applicationId, themeId),
      data: form,
      options: Options(contentType: Headers.multipartFormDataContentType),
    );
    return SplashAssetDto.fromJson(resp.data!);
  }

  Future<LaunchAssetsEnvelopeDto> getLaunchAssetsByTheme({
    required String applicationId,
    required String themeId,
    bool includeUrl = true,
    int? urlTtlSec,
    bool withValidation = false,
  }) async {
    final resp = await _client.get<Map<String, dynamic>>(
      LaunchAssetsConfiguratorBackendAPI.getByTheme(applicationId, themeId),
      queryParameters: {
        if (includeUrl) 'includeUrl': true,
        if (urlTtlSec != null) 'urlTtlSec': urlTtlSec,
        if (withValidation) 'withValidation': true,
      },
    );
    return LaunchAssetsEnvelopeDto.fromJson(resp.data!);
  }

  Future<LaunchAssetsDto> upsertLaunchAssetsUploadBatch({
    required String applicationId,
    required String themeId,
    required List<LaunchArtifactUploadWire> uploads,
    SourceConfigDto? source,
    PlatformParamsDto? params,
  }) async {
    final form = FormData();

    final dto = <String, dynamic>{};
    if (source != null) dto['source'] = source.toJson();
    if (params != null) dto['params'] = params.toJson();
    form.fields.add(MapEntry('dto', jsonEncode(dto)));

    final targets = <String, String>{};
    for (var i = 0; i < uploads.length; i++) {
      final u = uploads[i];
      final fieldName = 'file$i';
      final generatedFieldName = u.target.replaceAll(
        RegExp('[^a-zA-Z0-9]'),
        '_',
      );
      targets[fieldName] = u.target;

      form.files.add(
        MapEntry(
          fieldName,
          MultipartFile.fromBytes(
            u.bytes,
            filename: generatedFieldName,
            contentType: MediaType.parse(u.mimeType),
          ),
        ),
      );
    }
    form.fields.add(MapEntry('targets', jsonEncode(targets)));

    final resp = await _client.put<Map<String, dynamic>>(
      LaunchAssetsConfiguratorBackendAPI.uploadBatch(applicationId, themeId),
      data: form,
      options: Options(contentType: 'multipart/form-data'),
    );

    return LaunchAssetsDto.fromJson(resp.data!);
  }

  Future<void> deleteLaunchAssets({
    required String applicationId,
    required String themeId,
  }) async {
    await _client.delete<void>(
      LaunchAssetsConfiguratorBackendAPI.delete(applicationId, themeId),
    );
  }

  Future<ConstraintsDto> getLaunchConstraintsDefaults() async {
    final resp = await _client.get<Map<String, dynamic>>(
      LaunchAssetsConfiguratorBackendAPI.constraintsDefaults(
        '<ignored>',
        '<ignored>',
      ),
    );
    return ConstraintsDto.fromJson(resp.data!);
  }

  /// Generate a new theme from a natural-language description.
  ///
  /// Backend: POST /applications/{applicationId}/themes/generate
  /// Body: { description, name?, seedColor?, variant? }
  /// Returns: 200 on success (ignored here) — repository expects void.
  Future<void> generateTheme({
    required String applicationId,
    required String title,
    required String description,
    required String prompt,
    String? seedColor,
    String variant = 'light',
  }) async {
    await _client.post<void>(
      ThemeConfiguratorBackandAPI.generate(applicationId),
      data: <String, dynamic>{
        'title': title,
        'description': description,
        'prompt': prompt,
        if (seedColor != null) 'seedColor': seedColor,
        'variant': variant,
      },
    );
  }

  /// Nudge (refine) an existing theme using a prompt.
  ///
  /// Backend: POST /applications/{applicationId}/themes/{themeId}/nudge
  /// Body: { prompt, targets[], variant, mode, seedColorHint? }
  ///   - targets: e.g. ["colorScheme","widgetConfig","pageConfig"]
  ///   - mode: "patch" | "replace"
  /// Returns: 200 on success (ignored here) — repository expects void.
  Future<void> nudgeTheme({
    required String applicationId,
    required String themeId,
    required String prompt,
    List<String> targets = const ['colorScheme', 'widgetConfig', 'pageConfig'],
    String variant = 'light',
    String mode = 'patch',
    String? seedColorHint,
  }) async {
    await _client.post<void>(
      ThemeConfiguratorBackandAPI.nudge(applicationId, themeId),
      data: <String, dynamic>{
        'prompt': prompt,
        'targets': targets,
        'variant': variant,
        'mode': mode,
        if (seedColorHint != null) 'seedColorHint': seedColorHint,
      },
    );
  }

  // --- Theme History ---

  Future<ThemeHistoryPageDto> getThemeHistory({
    required String applicationId,
    required String themeId,
    int? limit,
    String? startAfter,
  }) async {
    final resp = await _client.get<Map<String, dynamic>>(
      ThemeHistoryConfiguratorBackendAPI.history(applicationId, themeId),
      queryParameters: <String, dynamic>{
        if (limit != null) 'limit': limit,
        if (startAfter != null) 'startAfter': startAfter,
      },
    );
    return ThemeHistoryPageDto.fromJson(resp.data!);
  }

  // --- Artifacts (AssetsRendition) ---

  /// List artifacts for a theme (optionally by kind, includeUrl, urlTtlSec)
  Future<List<AssetsRendition>> listArtifacts({
    required String applicationId,
    required String themeId,
    bool includeUrl = true,
    int? urlTtlSec,
    String? kind,
  }) async {
    final resp = await _client.get<List<dynamic>>(
      ArtifactsConfiguratorBackendAPI.list(applicationId, themeId),
      queryParameters: <String, dynamic>{
        if (includeUrl) 'includeUrl': 'true',
        if (includeUrl && urlTtlSec != null) 'urlTtlSec': urlTtlSec,
        if (kind != null && kind.isNotEmpty) 'kind': kind,
      },
    );
    final data = resp.data ?? const [];
    return data
        .cast<Map<String, dynamic>>()
        .map(AssetsRendition.fromJson)
        .toList();
  }

  /// Get single artifact (with optional signed URL)
  Future<AssetsRendition> getArtifact({
    required String applicationId,
    required String themeId,
    required String id,
    bool includeUrl = true,
    int? urlTtlSec,
  }) async {
    final resp = await _client.get<Map<String, dynamic>>(
      ArtifactsConfiguratorBackendAPI.item(applicationId, themeId, id),
      queryParameters: <String, dynamic>{
        if (includeUrl) 'includeUrl': 'true',
        if (includeUrl && urlTtlSec != null) 'urlTtlSec': urlTtlSec,
      },
    );
    return AssetsRendition.fromJson(resp.data!);
  }
}
