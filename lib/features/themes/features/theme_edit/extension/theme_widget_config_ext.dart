import 'package:webtrit_configurator/core/core.dart';

extension ThemeWidgetConfigExt on ThemeWidgetConfig {
  ThemeWidgetConfig copyWIthUrlResources() {
    final primaryOnboardingLogoUrl = picture.metadata.getValue(PictureWidgetConfig.primaryOnboardingLogoUrlKey);
    final secondaryOnboardingLogoUrlKey = picture.metadata.getValue(PictureWidgetConfig.secondaryOnboardingLogoUrlKey);

    return copyWith(
      picture: picture.copyWith(
        primaryOnboardingLogo: primaryOnboardingLogoUrl ?? picture.primaryOnboardingLogo,
        secondaryOnboardingLogo: secondaryOnboardingLogoUrlKey ?? picture.secondaryOnboardingLogo,
      ),
    );
  }
}
