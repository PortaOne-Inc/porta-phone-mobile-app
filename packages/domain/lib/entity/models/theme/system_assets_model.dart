import 'package:freezed_annotation/freezed_annotation.dart';

part 'system_assets_model.freezed.dart';

@freezed
class SystemAssetsModel with _$SystemAssetsModel {
  const factory SystemAssetsModel({
    String? notificationLogo,
    String? adaptiveIconBackground,
    String? adaptiveIconForeground,
    String? androidLauncherIcon,
    String? iosLauncherIcon,
    String? webLauncherIcon,
  }) = _SystemAssetsModel;

  const SystemAssetsModel._();
}
