
import 'image_model.dart';

class ConfiguratorImagesSetting {
  ImageModel onboarding;
  ImageModel logo;

  ConfiguratorImagesSetting({required this.onboarding, required this.logo});

  ConfiguratorImagesSetting copyWith({
    ImageModel? onboarding,
    ImageModel? logo,
  }) {
    return ConfiguratorImagesSetting(
      onboarding: onboarding ?? this.onboarding,
      logo: logo ?? this.logo,
    );
  }
}
