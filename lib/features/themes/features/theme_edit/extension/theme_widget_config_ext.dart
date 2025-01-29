import 'package:webtrit_configurator/core/core.dart';

extension ThemeWidgetConfigExt on ThemeWidgetConfig {
  ThemeWidgetConfig copyWIthUrlResources() {
    final primaryOnboardingLogoUrl = picture.metadata.getString(PictureWidgetConfig.metadataPrimaryOnboardingLogoUrl);
    final secondaryOnboardingLogoUrlKey = picture.metadata.getString(PictureWidgetConfig.metadataSecondaryOnboardingLogoUrl);

    return copyWith(
      picture: picture.copyWith(
        primaryOnboardingLogo: primaryOnboardingLogoUrl ?? picture.primaryOnboardingLogo,
        secondaryOnboardingLogo: secondaryOnboardingLogoUrlKey ?? picture.secondaryOnboardingLogo,
      ),
    );
  }
}

extension PictureWidgetConfigExt on PictureWidgetConfig {
  String? get primaryOnboardingLogoUrl => metadata.getString(PictureWidgetConfig.metadataPrimaryOnboardingLogoUrl);

  String? get secondaryOnboardingLogoUrl => metadata.getString(PictureWidgetConfig.metadataSecondaryOnboardingLogoUrl);
}
