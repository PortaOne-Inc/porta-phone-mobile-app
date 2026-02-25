import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:data/mappers/mappers.dart';
import 'package:data/datasource/datasource.dart';
import 'package:data/dto/dto.dart';

import '../common/api_exception_mapper.dart';

@Injectable(as: ThemeRepository)
class ThemeRepositoryImpl extends ThemeRepository {
  ThemeRepositoryImpl({
    required this.configuratorBackandDatasource,
    required this.themeMapper,
  });

  final ConfiguratorBackandDatasource configuratorBackandDatasource;
  final CommonMapper<ThemeModel, ThemeDTO> themeMapper;

  @override
  Future<ThemeModel> updateTheme(
    String applicationId,
    ThemeModel? theme,
  ) async {
    try {
      final param = themeMapper.convertTo(theme!);
      final dto = await configuratorBackandDatasource.updateTheme(
        applicationId,
        param,
      );
      return themeMapper.convertFrom(dto);
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ThemeModel> createTheme(
    String applicationId,
    String title,
    String description,
  ) async {
    final dto = await configuratorBackandDatasource.createTheme(
      applicationId,
      CreateThemeDTO(title: title, description: description),
    );
    return themeMapper.convertFrom(dto);
  }

  @override
  Future<List<ThemeModel>> getApplicationThemes(String applicationId) async {
    try {
      final dtos = await configuratorBackandDatasource.getApplicationThemes(
        applicationId,
      );
      // Mapping can throw TypeError if DTO fields are null but Model expects non-null
      return dtos.map(themeMapper.convertFrom).toList();
    } on Object catch (e, stackTrace) {
      // Catch both Exception (network) and Error (parsing/mapping)
      Error.throwWithStackTrace(
        BaseException(message: e.toString()),
        stackTrace,
      );
    }
  }

  @override
  Future<ThemeModel> getTheme(String applicationId, String themeId) async {
    final dto = await configuratorBackandDatasource.getTheme(
      applicationId: applicationId,
      themeId: themeId,
    );
    return themeMapper.convertFrom(dto);
  }

  @override
  Future<void> deleteTheme(String applicationId, String themeId) async {
    try {
      await configuratorBackandDatasource.deleteTheme(applicationId, themeId);
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<void> downloadTheme(String applicationId, String themeId) {
    // Method retained for backward compatibility; planned for removal.
    throw UnimplementedError('This method is scheduled for removal.');
  }

  @override
  Future<List<ThemeModel>> getAllThemes() async {
    final dtos = await configuratorBackandDatasource.getAllThemes();
    return dtos.map(themeMapper.convertFrom).toList();
  }

  @override
  Future<void> generateTheme({
    required String applicationId,
    required String title,
    required String description,
    required String prompt,
    String? seedColor,
    String variant = 'light',
  }) async {
    try {
      await configuratorBackandDatasource.generateTheme(
        applicationId: applicationId,
        title: title,
        description: description,
        prompt: prompt,
        seedColor: seedColor,
        variant: variant,
      );
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<void> nudgeTheme(
    String applicationId,
    String themeId,
    String prompt, {
    List<String> targets = const ['colorScheme', 'widgetConfig', 'pageConfig'],
    String variant = 'light',
    String mode = 'patch',
    String? seedColorHint,
  }) async {
    try {
      await configuratorBackandDatasource.nudgeTheme(
        applicationId: applicationId,
        themeId: themeId,
        prompt: prompt,
        targets: targets,
        variant: variant,
        mode: mode,
        seedColorHint: seedColorHint,
      );
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ThemeModel> copyTheme(
    String applicationId,
    String themeId, {
    String? title,
    String? description,
    String? label, // 'dev' | 'stage' | 'prod'
  }) async {
    try {
      final dto = await configuratorBackandDatasource.copyTheme(
        applicationId,
        themeId,
        title: title,
        description: description,
        label: label,
      );
      return themeMapper.convertFrom(dto);
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
