import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_model.dart';

part 'system_assets_model.freezed.dart';

@freezed
class SystemAssetsModel with _$SystemAssetsModel {
  const SystemAssetsModel._();

  const factory SystemAssetsModel({
    @Default(ImageModel()) ImageModel notificationLogo,
    @Default(ImageModel()) ImageModel adaptiveIconBackground,
    @Default(ImageModel()) ImageModel adaptiveIconForeground,
    @Default(ImageModel()) ImageModel androidLauncherIcon,
    @Default(ImageModel()) ImageModel iosLauncherIcon,
    @Default(ImageModel()) ImageModel webLauncherIcon,
  }) = _SystemAssetsModel;
}
