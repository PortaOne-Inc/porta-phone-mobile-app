import 'image_model.dart';

class ConfiguratorImagesSetting {
  ImageModel? onboarding;
  ImageModel? applicationLogo;
  ImageModel? notificationLogo;
  ImageModel? adaptiveIconBackground;
  ImageModel? adaptiveIconForeground;
  ImageModel? androidLauncherIcon;
  ImageModel? iosLauncherIcon;
  ImageModel? webLauncherIcon;

  ConfiguratorImagesSetting({
    this.onboarding,
    this.applicationLogo,
    this.notificationLogo,
    this.adaptiveIconBackground,
    this.adaptiveIconForeground,
    this.androidLauncherIcon,
    this.iosLauncherIcon,
    this.webLauncherIcon,
  });

  ConfiguratorImagesSetting copyWith({
    ImageModel? onboarding,
    ImageModel? applicationLogo,
    ImageModel? notificationLogo,
    ImageModel? adaptiveIconBackground,
    ImageModel? adaptiveIconForeground,
    ImageModel? androidLauncherIcon,
    ImageModel? iosLauncherIcon,
    ImageModel? webLauncherIcon,
  }) {
    return ConfiguratorImagesSetting(
      onboarding: onboarding ?? this.onboarding,
      applicationLogo: applicationLogo ?? this.applicationLogo,
      notificationLogo: notificationLogo ?? this.notificationLogo,
      adaptiveIconBackground: adaptiveIconBackground ?? this.adaptiveIconBackground,
      adaptiveIconForeground: adaptiveIconForeground ?? this.adaptiveIconForeground,
      androidLauncherIcon: androidLauncherIcon ?? this.androidLauncherIcon,
      iosLauncherIcon: iosLauncherIcon ?? this.iosLauncherIcon,
      webLauncherIcon: webLauncherIcon ?? this.webLauncherIcon,
    );
  }
}
