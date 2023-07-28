import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/entity/entity.dart';

import 'usecase_theme_get_template.dart';

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
