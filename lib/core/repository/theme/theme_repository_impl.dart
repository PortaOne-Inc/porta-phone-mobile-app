import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/core/core.dart';

@Injectable(as: ThemeRepository)
class ThemeRepositoryImpl extends ThemeRepository {
  ThemeRepositoryImpl({
    required this.firebaseStorage,
    required this.httpDatasource,
  });

  final FirebaseStorage firebaseStorage;
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
  Future deleteTheme(String applicationId, String themeId) async {
    try {
      return httpDatasource.deleteTheme(applicationId, themeId);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<String> uploadThemeImage(ImageDTO imageDTO) async {
    final storageRef = firebaseStorage.ref();
    final mountainImagesRef = storageRef.child('theme/${imageDTO.name}');
    final res = await mountainImagesRef.putString(imageDTO.data!, format: PutStringFormat.base64);
    return res.ref.getDownloadURL();
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
}
