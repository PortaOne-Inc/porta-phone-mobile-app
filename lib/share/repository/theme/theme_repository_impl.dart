import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/core/exception/exception.dart';

import '../../data/data.dart';
import '../../entity/dto/dto.dart';

import 'theme_repository.dart';

@Injectable(as: ThemeRepository)
class ThemeRepositoryImpl extends ThemeRepository {
  ThemeRepositoryImpl({
    required this.datasource,
  });

  final RealtimeFirebaseData datasource;

  final String _themesDirectoryName = 'themes';
  final String _themeIdField = 'id';

  String _getThemesPath(
    String userId,
    String applicationId,
  ) =>
      '$_themesDirectoryName/$userId/$applicationId/';

  String _getThemePath({
    required String userId,
    required String applicationId,
    required String themeId,
  }) {
    return '${_getThemesPath(userId, applicationId)}$themeId';
  }

  @override
  Future<ThemeDTO> updateTheme(String userId, String applicationId, ThemeDTO theme) async {
    try {
      return await _tryUpdateTheme(userId, applicationId, theme);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ThemeDTO> createTheme(String userId, String applicationId, ThemeDTO theme) async {
    try {
      return await _tryCreateTheme(userId, applicationId, theme);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<List<ThemeDTO>> getThemes(String userId, String applicationId) async {
    try {
      return await _tryGetThemes(userId, applicationId);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ThemeDTO> getTheme(String userId, String applicationId, String themeId) async {
    try {
      return await _tryGetTheme(userId, applicationId, themeId);
    } on NoContentException catch (_) {
      rethrow;
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ThemeDTO> deleteTheme(String userId, String applicationId, ThemeDTO themeDTO) async {
    try {
      return await _tryDeleteTheme(userId, applicationId, themeDTO);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  Future<ThemeDTO> _tryUpdateTheme(String userId, String applicationId, ThemeDTO theme) async {
    await datasource.patch(
        _getThemePath(
          userId: userId,
          applicationId: applicationId,
          themeId: theme.id!,
        ),
        theme.toJson());
    return theme;
  }

  Future<ThemeDTO> _tryCreateTheme(String userId, String applicationId, ThemeDTO theme) async {
    final themeId = await datasource.post(_getThemesPath(userId, applicationId), theme.toJson());
    return Future.value(theme.copyWith(id: themeId));
  }

  Future<List<ThemeDTO>> _tryGetThemes(String userId, String applicationId) async {
    final themes = await datasource.get<String, Map<String, dynamic>>(_getThemesPath(userId, applicationId));
    return themes.map((it) {
      final raw = it.value..update(_themeIdField, (value) => it.key, ifAbsent: () => it.key);
      return ThemeDTO.fromJson(raw);
    }).toList();
  }

  Future<ThemeDTO> _tryGetTheme(String userId, String applicationId, String themeId) async {
    final theme = await datasource.get<String, dynamic>(_getThemePath(
      userId: userId,
      applicationId: applicationId,
      themeId: themeId,
    ));

    if (theme.isNotEmpty) {
      final map = Map<String, dynamic>.fromEntries(theme);
      final raw = map..update(_themeIdField, (value) => themeId, ifAbsent: () => themeId);
      return ThemeDTO.fromJson(raw);
    } else {
      throw NoContentException();
    }
  }

  Future<ThemeDTO> _tryDeleteTheme(String userId, String applicationId, ThemeDTO theme) async {
    await datasource.delete(_getThemePath(
      userId: userId,
      applicationId: applicationId,
      themeId: theme.id!,
    ));
    return Future.value(theme);
  }
}
