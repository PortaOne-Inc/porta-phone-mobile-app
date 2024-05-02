import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:dto/dto.dart';
import 'package:domain/exception/common/base_exception.dart';
import 'package:domain/exception/no_content_exception.dart';
import 'package:domain/repository/repository.dart';

import '../data/http_datasource.dart';

@Injectable(as: ThemeRepository)
class ThemeRepositoryImpl extends ThemeRepository {
  ThemeRepositoryImpl({
    required this.httpDatasource,
  });

  final HttpDatasource httpDatasource;

  @override
  Future<ThemeDTO> updateTheme(String applicationId, ThemeDTO? theme) async {
    try {
      return await httpDatasource.updateTheme(applicationId, theme!);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ThemeDTO> updateStaticTheme(ThemeDTO? theme) async {
    try {
      return await httpDatasource.updateStaticTheme(theme!);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ThemeDTO> createTheme(String applicationId, ThemeDTO theme) async {
    try {
      return await httpDatasource.createTheme(applicationId, theme);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<List<ThemeDTO>> getThemes(String applicationId) async {
    try {
      return httpDatasource.getThemes(applicationId);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ThemeDTO> getTheme(String applicationId, String themeId) async {
    try {
      return await httpDatasource.getTheme(applicationId, themeId);
    } on NoContentException catch (_) {
      rethrow;
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<void> deleteTheme(String applicationId, String themeId) async {
    try {
      return httpDatasource.deleteTheme(applicationId, themeId);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ThemeDTO> getStaticTheme() async {
    try {
      return httpDatasource.getStaticTheme();
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<void> downloadTheme(String applicationId, String themeId) {
    try {
      return httpDatasource.downloadTheme(applicationId, themeId);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
