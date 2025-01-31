import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../../dto/dto.dart';
import '../mapper.dart';

@Injectable(as: CommonMapper<LaunchAssetsModel?, LaunchAssetsDto?>)
class LaunchAssetsMapper extends CommonMapper<LaunchAssetsModel?, LaunchAssetsDto?> {
  LaunchAssetsMapper();

  @override
  LaunchAssetsDto? convertTo(LaunchAssetsModel? it) {
    return LaunchAssetsDto(
      originalAssetId: it?.originalAssetId,
      notificationLogoUrl: it?.notificationLogoUrl,
      adaptiveIconBackgroundUrl: it?.adaptiveIconBackgroundUrl,
      adaptiveIconForegroundUrl: it?.adaptiveIconForegroundUrl,
      androidLauncherIconUrl: it?.androidLauncherIconUrl,
      iosLauncherIconUrl: it?.iosLauncherIconUrl,
      webLauncherIconUrl: it?.webLauncherIconUrl,
      backgroundColor: it?.backgroundColor,
    );
  }

  @override
  LaunchAssetsModel? convertFrom(LaunchAssetsDto? it) {
    return LaunchAssetsModel(
      originalAssetId: it?.originalAssetId,
      notificationLogoUrl: it?.notificationLogoUrl,
      adaptiveIconBackgroundUrl: it?.adaptiveIconBackgroundUrl,
      adaptiveIconForegroundUrl: it?.adaptiveIconForegroundUrl,
      androidLauncherIconUrl: it?.androidLauncherIconUrl,
      iosLauncherIconUrl: it?.iosLauncherIconUrl,
      webLauncherIconUrl: it?.webLauncherIconUrl,
      backgroundColor: it?.backgroundColor,
    );
  }
}
