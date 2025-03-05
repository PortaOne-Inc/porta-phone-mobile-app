import 'package:webtrit_configurator/exports/exports.dart';

/// Extension for `LoginPageConfig` to update asset URIs dynamically.
///
/// This extension ensures that when the configuration is used in a web-based
/// environment, the picture asset is updated with a URL retrieved from metadata.
/// If a URL is available, it replaces the existing picture reference; otherwise,
/// the original value remains unchanged.
extension LoginPageConfigExt on LoginPageConfig {
  /// Returns a copy of `LoginPageConfig` with an updated picture URI.
  ///
  /// If a picture URL is available in metadata, it is assigned to the `picture` field.
  /// Otherwise, the existing value is retained.
  LoginPageConfig copyWithUrlResources() {
    return copyWith(
      picture: pictureUrl ?? picture,
    );
  }

  /// Retrieves the picture URL from metadata, if available.
  String? get pictureUrl => metadata.getString(LoginPageConfig.metadataPictureUrl);
}
