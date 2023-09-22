import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../entity/entity.dart';

abstract class UsecaseThemeGetTemplate {
  FutureOr<ThemeModel> execute({
    final String? primaryColor,
    final String? themeName,
  });
}

@Injectable(as: UsecaseThemeGetTemplate)
class GetThemTemplateUseCase extends UsecaseThemeGetTemplate {
  @override
  FutureOr<ThemeModel> execute({
    String? primaryColor,
    String? themeName,
  }) {
    return ThemeModel(
      name: themeName,
      images: const ImageSchemeModel(
        primaryOnboardingLogo: ImageModel(),
        secondaryOnboardingLogo: ImageModel(),
      ),
      systemAssets: const SystemAssetsModel(
        notificationLogo: ImageModel(),
        adaptiveIconBackground: ImageModel(),
        adaptiveIconForeground: ImageModel(),
        androidLauncherIcon: ImageModel(),
        iosLauncherIcon: ImageModel(),
        webLauncherIcon: ImageModel(),
      ),
    );
  }
}
