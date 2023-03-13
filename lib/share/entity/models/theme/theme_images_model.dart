import 'image_model.dart';

class ConfiguratorImagesSetting {
  ImageModel onboarding;
  ImageModel applicationLogo;
  ImageModel notificationLogo;
  ImageModel adaptiveIconBackground;
  ImageModel adaptiveIconForeground;
  ImageModel androidLauncherIcon;
  ImageModel iosLauncherIcon;
  ImageModel webLauncherIcon;

  ConfiguratorImagesSetting({
    required this.onboarding,
    required this.applicationLogo,
    required this.notificationLogo,
    required this.adaptiveIconBackground,
    required this.adaptiveIconForeground,
    required this.androidLauncherIcon,
    required this.iosLauncherIcon,
    required this.webLauncherIcon,
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
