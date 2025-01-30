import 'package:freezed_annotation/freezed_annotation.dart';

part 'system_assets_dto.freezed.dart';

part 'system_assets_dto.g.dart';

@freezed
class LaunchAssetsDto with _$LaunchAssetsDto {
  @JsonSerializable(explicitToJson: true)
  const factory LaunchAssetsDto({
    LaunchAssetResourceDto? notificationLogo,
    LaunchAssetResourceDto? adaptiveIconBackground,
    LaunchAssetResourceDto? adaptiveIconForeground,
    LaunchAssetResourceDto? androidLauncherIcon,
    LaunchAssetResourceDto? iosLauncherIcon,
    LaunchAssetResourceDto? webLauncherIcon,
  }) = _LaunchAssetsDto;

  factory LaunchAssetsDto.fromJson(Map<String, dynamic> json) => _$LaunchAssetsDtoFromJson(json);
}

@freezed
class LaunchAssetResourceDto with _$LaunchAssetResourceDto {
  @JsonSerializable()
  const factory LaunchAssetResourceDto({
     String? url,
     String? originalAssetId,
  }) = _LaunchAssetResourceDto;

  factory LaunchAssetResourceDto.fromJson(Map<String, dynamic> json) => _$LaunchAssetResourceDtoFromJson(json);
}
