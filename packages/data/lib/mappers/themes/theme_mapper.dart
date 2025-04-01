import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:data/dto/dto.dart';
import 'package:data/mappers/mappers.dart';

@Injectable(as: CommonMapper<ThemeModel, ThemeDTO>)
class ThemeMapper extends CommonMapper<ThemeModel, ThemeDTO> {
  ThemeMapper(this.themeAssetMapper, this.launchAssetsMapper, this.splashAssetsMapper);

  final CommonMapper<ThemeAssetModel, ThemeAssetDto> themeAssetMapper;
  final CommonMapper<LaunchAssetsModel?, LaunchAssetsDto?> launchAssetsMapper;
  final CommonMapper<SplashAssetModel?, SplashAssetsDto?> splashAssetsMapper;

  @override
  ThemeDTO convertTo(ThemeModel it) {
    return ThemeDTO(
      id: it.id,
      name: it.name,
      colorSchemeConfig: ColorSchemeConfig.fromJson(it.colorSchemeConfig),
      themeWidgetConfig: ThemeWidgetConfig.fromJson(it.themeWidgetConfig),
      themePageConfig: ThemePageConfig.fromJson(it.themePageConfig),
      appConfig: AppConfig.fromJson(it.appConfig),
      assets: themeAssetMapper.convertListTo(it.assets),
      splashAssets: splashAssetsMapper.convertTo(it.splashAsset) ?? const SplashAssetsDto(),
      launchAssets: launchAssetsMapper.convertTo(it.launchAssets) ?? const LaunchAssetsDto(),
    );
  }

  @override
  ThemeModel convertFrom(ThemeDTO it) {
    return ThemeModel(
      id: it.id,
      applicationId: it.applicationId,
      name: it.name,
      colorSchemeConfig: it.colorSchemeConfig.toJson(),
      themeWidgetConfig: it.themeWidgetConfig.toJson(),
      themePageConfig: it.themePageConfig.toJson(),
      appConfig: it.appConfig.toJson(),
      assets: themeAssetMapper.convertListFrom(it.assets),
      splashAsset: splashAssetsMapper.convertFrom(it.splashAssets) ?? const SplashAssetModel(),
      launchAssets: launchAssetsMapper.convertFrom(it.launchAssets) ?? const LaunchAssetsModel(),
    );
  }
}
