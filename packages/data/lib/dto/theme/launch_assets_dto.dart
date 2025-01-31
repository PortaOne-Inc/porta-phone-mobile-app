import 'package:freezed_annotation/freezed_annotation.dart';

part 'launch_assets_dto.freezed.dart';

part 'launch_assets_dto.g.dart';

@freezed
class LaunchAssetsDto with _$LaunchAssetsDto {
  @JsonSerializable(explicitToJson: true)
  const factory LaunchAssetsDto({
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
  }) = _LaunchAssetsDto;

  factory LaunchAssetsDto.fromJson(Map<String, dynamic> json) => _$LaunchAssetsDtoFromJson(json);
}
