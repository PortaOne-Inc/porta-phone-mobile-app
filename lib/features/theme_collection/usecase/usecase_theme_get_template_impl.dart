import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/entity/entity.dart';

import 'usecase_theme_get_template.dart';

@Injectable(as: UsecaseThemeGetTemplate)
class GetThemTemplateUseCase extends UsecaseThemeGetTemplate {
  @override
  FutureOr<AppConfigurationModel> execute({
    String? primaryColor,
    String? themeName,
  }) {
    return AppConfigurationModel(
      images: ConfiguratorImagesSetting(
        onboarding: ImageModel(),
        applicationLogo: ImageModel(),
        notificationLogo: ImageModel(),
        adaptiveIconBackground: ImageModel(),
        adaptiveIconForeground: ImageModel(),
        androidLauncherIcon: ImageModel(),
        iosLauncherIcon: ImageModel(),
        webLauncherIcon: ImageModel(),
      ),
      commonConfig: CommonConfigModel(
        appName: themeName ?? '',
      ),
    );
  }
}
