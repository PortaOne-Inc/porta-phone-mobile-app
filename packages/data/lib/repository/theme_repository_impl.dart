import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:dto/dto.dart';
import 'package:domain/domain.dart';

import 'package:data/mappers/mappers.dart';
import 'package:data/datasource/datasource.dart';

@Injectable(as: ThemeRepository)
class ThemeRepositoryImpl extends ThemeRepository {
  ThemeRepositoryImpl({
    required this.configuratorBackandDatasource,
    required this.themeMapper,
  });

  final ConfiguratorBackandDatasource configuratorBackandDatasource;
  final CommonMapper<ThemeModel, ThemeDTO> themeMapper;

  @override
  Future<ThemeModel> updateTheme(String applicationId, ThemeModel? theme) async {
    try {
      final param = themeMapper.convertTo(theme!);
      final dto = await configuratorBackandDatasource.updateTheme(applicationId, param);
      return themeMapper.convertFrom(dto);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ThemeModel> updateStaticTheme(ThemeModel? theme) {
    // Method retained for backward compatibility; planned for removal.
    throw UnimplementedError('This method is scheduled for removal.');
  }

  @override
  Future<ThemeModel> createTheme(String applicationId, ThemeModel theme) async {
    try {
      final param = themeMapper.convertTo(theme);
      final dto = await configuratorBackandDatasource.createTheme(applicationId, param);
      return themeMapper.convertFrom(dto);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<List<ThemeModel>> getThemes(String applicationId) async {
    final dtos = await configuratorBackandDatasource.getThemes(applicationId);
    return dtos.map(themeMapper.convertFrom).toList();
  }

  @override
  Future<ThemeModel> getTheme(String applicationId, String themeId) async {
    final dto = await configuratorBackandDatasource.getTheme(applicationId, themeId);
    return themeMapper.convertFrom(dto);
  }

  @override
  Future<void> deleteTheme(String applicationId, String themeId) async {
    try {
      await configuratorBackandDatasource.deleteTheme(applicationId, themeId);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ThemeModel> getStaticTheme() async {
    // Method retained for backward compatibility; planned for removal.
    throw UnimplementedError('This method is scheduled for removal.');
  }

  @override
  Future<void> downloadTheme(String applicationId, String themeId) {
    // Method retained for backward compatibility; planned for removal.
    throw UnimplementedError('This method is scheduled for removal.');
  }
}
