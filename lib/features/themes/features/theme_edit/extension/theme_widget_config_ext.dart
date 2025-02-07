import 'package:webtrit_configurator/core/core.dart';

/// Extension that updates image asset URIs based on metadata.
///
/// This extension ensures that when the configuration is used on a phone,
/// local assets are utilized, assuming they have been preloaded by the user or a CLI tool.
/// However, when used in a web-based configurator, asset URLs must be provided
/// dynamically at runtime.
///
/// This extension retrieves URLs from metadata and updates the corresponding URIs.
extension ThemeWidgetConfigExt on ThemeWidgetConfig {
  /// Returns a copy of `ThemeWidgetConfig` with updated asset URIs.
  ///
  /// If a URL is available in the metadata, it is assigned to the `uri` field.
  /// Otherwise, the existing URI remains unchanged.
  ThemeWidgetConfig copyWIthUrlResources() {
    final primaryOnboardingLogo = imageAssets.primaryOnboardingLogo;
    final secondaryOnboardingLogo = imageAssets.secondaryOnboardingLogo;

    final primaryOnboardingLogoUrl =
        primaryOnboardingLogo.metadata.getString(ImageAssetsConfig.metadataPrimaryOnboardingLogoUrl);
    final secondaryOnboardingLogoUrl =
        secondaryOnboardingLogo.metadata.getString(ImageAssetsConfig.metadataSecondaryOnboardingLogoUrl);

    return copyWith(
      imageAssets: imageAssets.copyWith(
        primaryOnboardingLogo:
            primaryOnboardingLogo.copyWith(uri: primaryOnboardingLogoUrl ?? primaryOnboardingLogo.uri),
        secondaryOnboardingLogo:
            secondaryOnboardingLogo.copyWith(uri: secondaryOnboardingLogoUrl ?? secondaryOnboardingLogo.uri),
      ),
    );
  }
}

/// Extension for retrieving asset URLs from metadata.
///
/// This extension provides convenient accessors for fetching URLs of primary
/// and secondary onboarding logos from their metadata.
extension PictureWidgetConfigExt on ImageAssetsConfig {
  /// Retrieves the URL of the primary onboarding logo from metadata, if available.
  String? get primaryOnboardingLogoUrl =>
      primaryOnboardingLogo.metadata.getString(ImageAssetsConfig.metadataPrimaryOnboardingLogoUrl);

  /// Retrieves the URL of the secondary onboarding logo from metadata, if available.
  String? get secondaryOnboardingLogoUrl =>
      secondaryOnboardingLogo.metadata.getString(ImageAssetsConfig.metadataSecondaryOnboardingLogoUrl);
}
