import 'package:domain/entity/models/theme/splash_asset_model.dart';
import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:data/mappers/mappers.dart';
import 'package:data/datasource/datasource.dart';
import 'package:data/dto/dto.dart';

@Injectable(as: ThemeRepository)
class ThemeRepositoryImpl extends ThemeRepository {
  ThemeRepositoryImpl({
    required this.configuratorBackandDatasource,
    required this.themeMapper,
    required this.themeAssetMapper,
    required this.launchAssetsMapper,
    required this.splashAssetsMapper,
  });

  final ConfiguratorBackandDatasource configuratorBackandDatasource;
  final CommonMapper<ThemeModel, ThemeDTO> themeMapper;
  final CommonMapper<ThemeAssetModel, ThemeAssetDto> themeAssetMapper;
  final CommonMapper<LaunchAssetsModel?, LaunchAssetsDto?> launchAssetsMapper;
  final CommonMapper<SplashAssetModel?, SplashAssetsDto?> splashAssetsMapper;

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
  Future<ThemeModel> createTheme(String applicationId, ThemeModel theme) async {
    try {
      final param = themeMapper.convertTo(theme);
      final dto = await configuratorBackandDatasource.createTheme(applicationId, param);
      return themeMapper.convertFrom(dto);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    }
  }

  @override
  Future<List<ThemeModel>> getThemes(String applicationId) async {
    final dtos = await configuratorBackandDatasource.getThemes(applicationId);
    return dtos.map(themeMapper.convertFrom).toList();
  }

  @override
  Future<ThemeModel> getTheme(String applicationId, String themeId) async {
    final dto = await configuratorBackandDatasource.getTheme(applicationId: applicationId, themeId: themeId);
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
  Future<void> downloadTheme(String applicationId, String themeId) {
    // Method retained for backward compatibility; planned for removal.
    throw UnimplementedError('This method is scheduled for removal.');
  }

  @override
  Future<List<ThemeAssetModel>> addThemeAssets(
    String applicationId,
    String themeId,
    List<ThemeAssetModel> assets,
  ) async {
    final assetDtos = themeAssetMapper.convertListTo(assets);
    final response = await configuratorBackandDatasource.addAssets(applicationId, themeId, assetDtos);

    return themeAssetMapper.convertListFrom(response);
  }

  @override
  Future<ThemeModel> updateLaunchAssets(String applicationId, String themeId, LaunchAssetsModel launchAssets) async {
    final dto = await configuratorBackandDatasource.updateLaunchAssets(
      applicationId,
      themeId,
      launchAssetsMapper.convertTo(launchAssets)!,
    );
    return themeMapper.convertFrom(dto);
  }

  @override
  Future<void> deleteLaunchAssets(String applicationId, String themeId) async {
    await configuratorBackandDatasource.deleteLaunchAssets(applicationId, themeId);
  }

  @override
  Future<ThemeModel> updateSplashAsset(String applicationId, String themeId, SplashAssetModel splashAsset) async {
    final dto = await configuratorBackandDatasource.updateSplashAsset(
        applicationId, themeId, splashAssetsMapper.convertTo(splashAsset)!);
    return themeMapper.convertFrom(dto);
  }
}
