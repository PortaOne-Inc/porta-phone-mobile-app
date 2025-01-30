import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:data/dto/dto.dart';
import 'package:data/mappers/mappers.dart';

@Injectable(as: CommonMapper<ThemeModel, ThemeDTO>)
class ThemeMapper extends CommonMapper<ThemeModel, ThemeDTO> {
  ThemeMapper(this.themeAssetMapper);

  final CommonMapper<ThemeAssetModel, ThemeAssetDto> themeAssetMapper;

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
      launchAssets: LaunchAssetsDto(
          notificationLogo: LaunchAssetResourceDto(
              url: it.systemAssets.notificationLogo?.url,
              originalAssetId: it.systemAssets.notificationLogo?.originalAssetId),
          adaptiveIconBackground: LaunchAssetResourceDto(
              url: it.systemAssets.adaptiveIconBackground?.url,
              originalAssetId: it.systemAssets.adaptiveIconBackground?.originalAssetId),
          adaptiveIconForeground: LaunchAssetResourceDto(
              url: it.systemAssets.adaptiveIconForeground?.url,
              originalAssetId: it.systemAssets.adaptiveIconForeground?.originalAssetId),
          androidLauncherIcon: LaunchAssetResourceDto(
              url: it.systemAssets.androidLauncherIcon?.url,
              originalAssetId: it.systemAssets.androidLauncherIcon?.originalAssetId),
          iosLauncherIcon: LaunchAssetResourceDto(
              url: it.systemAssets.iosLauncherIcon?.url,
              originalAssetId: it.systemAssets.iosLauncherIcon?.originalAssetId),
          webLauncherIcon: LaunchAssetResourceDto(
              url: it.systemAssets.webLauncherIcon?.url,
              originalAssetId: it.systemAssets.webLauncherIcon?.originalAssetId)),
    );
  }

  @override
  ThemeModel convertFrom(ThemeDTO it) {
    return ThemeModel(
        id: it.id,
        name: it.name,
        colorSchemeConfig: it.colorSchemeConfig.toJson(),
        themeWidgetConfig: it.themeWidgetConfig.toJson(),
        themePageConfig: it.themePageConfig.toJson(),
        appConfig: it.appConfig.toJson(),
        assets: themeAssetMapper.convertListFrom(it.assets),
        systemAssets: SystemAssetsModel(
          notificationLogo: LaunchImageResource(
            url: it.launchAssets.notificationLogo?.url,
            originalAssetId: it.launchAssets.notificationLogo?.originalAssetId,
          ),
          adaptiveIconBackground: LaunchImageResource(
            url: it.launchAssets.adaptiveIconBackground?.url,
            originalAssetId: it.launchAssets.adaptiveIconBackground?.originalAssetId,
          ),
          adaptiveIconForeground: LaunchImageResource(
            url: it.launchAssets.adaptiveIconForeground?.url,
            originalAssetId: it.launchAssets.adaptiveIconForeground?.originalAssetId,
          ),
          androidLauncherIcon: LaunchImageResource(
            url: it.launchAssets.androidLauncherIcon?.url,
            originalAssetId: it.launchAssets.androidLauncherIcon?.originalAssetId,
          ),
          iosLauncherIcon: LaunchImageResource(
            url: it.launchAssets.iosLauncherIcon?.url,
            originalAssetId: it.launchAssets.iosLauncherIcon?.originalAssetId,
          ),
          webLauncherIcon: LaunchImageResource(
            url: it.launchAssets.webLauncherIcon?.url,
            originalAssetId: it.launchAssets.webLauncherIcon?.originalAssetId,
          ),
        ));
  }
}
