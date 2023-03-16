import 'dart:async';
import 'package:flutter/material.dart';

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
      fontModel: TextThemeModel(fontFamily: null, textTheme: const TextTheme()),
      commonConfig: CommonConfigModel(
        appName: themeName ?? '',
      ),
      colors: ColorsModel(
          gradientTabColor: [
            '#FF58A1A4',
            '#FF343D77',
          ],
          primary: primaryColor ?? '#FFF5841F',
          secondary: '#FF3D5B68',
          onPrimary: '#FF000000',
          error: '#FFE74C3C',
          tertiary: '#FF75B943',
          onSecondaryContainer: '#FFC5CED2',
          outline: '#FFF3F5F6',
          onBackground: '#FF000000',
          background: '#FFFFFFFF',
          secondaryContainer: '#FFC5CED2',
          onSurface: '#FFF3F5F6',
          surface: '#FFF3F5F6'),
      id: null,
    );
  }
}
