import 'package:freezed_annotation/freezed_annotation.dart';

part 'launch_assets_model.freezed.dart';

@freezed
class LaunchAssetsModel with _$LaunchAssetsModel {
  const factory LaunchAssetsModel({
    // Linking to the original asset
    int? originalAssetId,

    // System generated assets
    String? notificationLogoUrl,

    // Generated images
    String? adaptiveIconForegroundUrl,
    String? androidLauncherIconUrl,
    String? iosLauncherIconUrl,
    String? webLauncherIconUrl,

    // Generated background images
    String? adaptiveIconBackgroundUrl,

    // Background color
    String? backgroundColor,
  }) = _LaunchAssetsModel;

  const LaunchAssetsModel._();
}
