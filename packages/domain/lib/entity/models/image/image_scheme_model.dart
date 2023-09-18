import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_model.dart';

part 'image_scheme_model.freezed.dart';

@freezed
class ImageSchemeModel with _$ImageSchemeModel {
  const ImageSchemeModel._();

  const factory ImageSchemeModel({
    @Default(ImageModel()) ImageModel primaryOnboardingLogo,
    @Default(ImageModel()) ImageModel secondaryOnboardingLogo,
    @Default(ImageModel()) ImageModel notificationLogo,
    @Default(ImageModel()) ImageModel adaptiveIconBackground,
    @Default(ImageModel()) ImageModel adaptiveIconForeground,
    @Default(ImageModel()) ImageModel androidLauncherIcon,
    @Default(ImageModel()) ImageModel iosLauncherIcon,
    @Default(ImageModel()) ImageModel webLauncherIcon,
  }) = _ImageSchemeModel;
}
