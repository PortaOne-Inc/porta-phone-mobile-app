import 'package:freezed_annotation/freezed_annotation.dart';

part 'system_assets_model.freezed.dart';

@freezed
class SystemAssetsModel with _$SystemAssetsModel {
  const factory SystemAssetsModel({
    LaunchImageResource? notificationLogo,
    LaunchImageResource? adaptiveIconBackground,
    LaunchImageResource? adaptiveIconForeground,
    LaunchImageResource? androidLauncherIcon,
    LaunchImageResource? iosLauncherIcon,
    LaunchImageResource? webLauncherIcon,
  }) = _SystemAssetsModel;

  const SystemAssetsModel._();
}

@freezed
class LaunchImageResource with _$LaunchImageResource {
  const factory LaunchImageResource({
    String? url,
    String? originalAssetId,
  }) = _LaunchImageResource;

  const LaunchImageResource._();
}
