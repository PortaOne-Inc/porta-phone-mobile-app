import 'dart:convert';

import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:data/mappers/mappers.dart';
import 'package:data/datasource/datasource.dart';
import 'package:data/dto/dto.dart';

import '../common/api_exception_mapper.dart';

@Injectable(as: ThemeRepository)
class ThemeRepositoryImpl extends ThemeRepository {
  ThemeRepositoryImpl({required this.configuratorBackandDatasource, required this.themeMapper});

  final ConfiguratorBackandDatasource configuratorBackandDatasource;
  final CommonMapper<ThemeModel, ThemeDTO> themeMapper;

  @override
  Future<ThemeModel> updateTheme(String applicationId, ThemeModel? theme) => guardApiCall(() async {
    final param = themeMapper.convertTo(theme!);
    final dto = await configuratorBackandDatasource.updateTheme(applicationId, param);
    return themeMapper.convertFrom(dto);
  });

  @override
  Future<ThemeModel> createTheme(String applicationId, String title, String description) => guardApiCall(() async {
    final dto = await configuratorBackandDatasource.createTheme(
      applicationId,
      CreateThemeDTO(title: title, description: description),
    );
    return themeMapper.convertFrom(dto);
  });

  @override
  Future<List<ThemeModel>> getApplicationThemes(String applicationId) async {
    try {
      final dtos = await configuratorBackandDatasource.getApplicationThemes(applicationId);
      // Mapping can throw TypeError if DTO fields are null but Model expects non-null
      return dtos.map(themeMapper.convertFrom).toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    } on Object catch (e, stackTrace) {
      // Catch both Exception (network) and Error (parsing/mapping)
      Error.throwWithStackTrace(BaseException(message: e.toString()), stackTrace);
    }
  }

  @override
  Future<ThemeModel> getTheme(String applicationId, String themeId) => guardApiCall(() async {
    final dto = await configuratorBackandDatasource.getTheme(applicationId: applicationId, themeId: themeId);
    return themeMapper.convertFrom(dto);
  });

  @override
  Future<void> deleteTheme(String applicationId, String themeId) =>
      guardApiCall(() => configuratorBackandDatasource.deleteTheme(applicationId, themeId));

  @override
  Future<void> downloadTheme(String applicationId, String themeId) {
    // Method retained for backward compatibility; planned for removal.
    throw UnimplementedError('This method is scheduled for removal.');
  }

  @override
  Future<List<ThemeModel>> getAllThemes() => guardApiCall(() async {
    final dtos = await configuratorBackandDatasource.getAllThemes();
    return dtos.map(themeMapper.convertFrom).toList();
  });

  @override
  Future<void> generateTheme({
    required String applicationId,
    required String title,
    required String description,
    required String prompt,
    String? seedColor,
    String variant = 'light',
  }) => guardApiCall(
    () => configuratorBackandDatasource.generateTheme(
      applicationId: applicationId,
      title: title,
      description: description,
      prompt: prompt,
      seedColor: seedColor,
      variant: variant,
    ),
  );

  @override
  Future<void> nudgeTheme(
    String applicationId,
    String themeId,
    String prompt, {
    List<String> targets = const ['colorScheme', 'widgetConfig', 'pageConfig'],
    String variant = 'light',
    String mode = 'patch',
    String? seedColorHint,
  }) => guardApiCall(
    () => configuratorBackandDatasource.nudgeTheme(
      applicationId: applicationId,
      themeId: themeId,
      prompt: prompt,
      targets: targets,
      variant: variant,
      mode: mode,
      seedColorHint: seedColorHint,
    ),
  );

  @override
  Future<ThemeModel> copyTheme(
    String applicationId,
    String themeId, {
    String? title,
    String? description,
    String? label, // 'dev' | 'stage' | 'prod'
  }) => guardApiCall(() async {
    final dto = await configuratorBackandDatasource.copyTheme(
      applicationId,
      themeId,
      title: title,
      description: description,
      label: label,
    );
    return themeMapper.convertFrom(dto);
  });

  @override
  Future<ThemeModel> copyThemeToApplication(
    String applicationId,
    String themeId, {
    required String targetApplicationId,
    String? title,
    String? description,
    String? label,
  }) => guardApiCall(() async {
    final dto = await configuratorBackandDatasource.copyThemeToApplication(
      applicationId,
      themeId,
      targetApplicationId: targetApplicationId,
      title: title,
      description: description,
      label: label,
    );
    return themeMapper.convertFrom(dto);
  });

  @override
  Future<String> createShareToken(String applicationId, String themeId, {String? tag}) => guardApiCall(() async {
    final resp = await configuratorBackandDatasource.createShareToken(
      applicationId: applicationId,
      themeId: themeId,
      tag: tag,
    );
    return resp['token'] as String;
  });

  @override
  Future<SharedThemePreviewModel> getSharedThemePreview(String token) => guardApiCall(() async {
    final raw = await configuratorBackandDatasource.getSharedThemePreview(token);
    final dto = SharedThemePreviewDto.fromJson(raw);
    return SharedThemePreviewModel(
      theme: dto.theme,
      colorSchemes: SharedThemePreviewVariants.fromArray(dto.colorSchemes),
      widgetConfigs: SharedThemePreviewVariants.fromArray(dto.widgetConfigs),
      pageConfigs: SharedThemePreviewVariants.fromArray(dto.pageConfigs),
      splashAsset: dto.splashAsset,
      launchAsset: dto.launchAsset,
      featureAccess: dto.featureAccess,
      embeds: dto.embeds,
      environment: _decodeSharedEnvironment(dto.environment),
    );
  });

  /// Decodes the base64-encoded environment from the shared preview response.
  /// Returns null on any malformed input so a bad value never breaks the preview.
  Map<String, dynamic>? _decodeSharedEnvironment(String? encoded) {
    if (encoded == null || encoded.isEmpty) return null;
    try {
      final decoded = utf8.decode(base64.decode(encoded));
      final parsed = jsonDecode(decoded);
      return parsed is Map<String, dynamic> ? parsed : null;
    } catch (_) {
      return null;
    }
  }
}
