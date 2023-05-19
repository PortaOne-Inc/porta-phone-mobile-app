import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_model.dart';

part 'image_scheme_model.freezed.dart';

@freezed
class ImageSchemeModel with _$ImageSchemeModel {
  const ImageSchemeModel._();

  const factory ImageSchemeModel({
    ImageModel? onboarding,
    ImageModel? applicationLogo,
    ImageModel? notificationLogo,
    ImageModel? adaptiveIconBackground,
    ImageModel? adaptiveIconForeground,
    ImageModel? androidLauncherIcon,
    ImageModel? iosLauncherIcon,
    ImageModel? webLauncherIcon,
  }) = _ImageSchemeModel;
}
