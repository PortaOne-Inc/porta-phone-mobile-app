class AuthConfiguratorBackandAPI {
  static String get login => '/auth/login';

  static String get register => '/auth/register';
}

class ApplicationConfiguratorBackandAPI {
  static String get applications => '/applications';

  static String application(String applicationId) =>
      '/applications/$applicationId';

  static String applicationVersion(String applicationId) =>
      '/applications/$applicationId/version';

  static String applicationEnvironment(String applicationId) =>
      '/applications/$applicationId/environment';

  static String themeBindings(String applicationId) =>
      '/applications/$applicationId/theme-bindings';

  static String resolveTheme(String applicationId) =>
      '/applications/$applicationId/resolve-theme';
}

class ThemeConfiguratorBackandAPI {
  static String allThemes() => '/applications/themes';

  static String applicationThemes(String applicationId) =>
      '/applications/$applicationId/themes';

  static String themeLegacy(String applicationId, String themeId) =>
      '/applications/$applicationId/themes/$themeId/legacy';

  static String theme(String applicationId, String themeId) =>
      '/applications/$applicationId/themes/$themeId';

  static String themeVersion(String applicationId) =>
      '/applications/$applicationId/version';

  static String generate(String applicationId) =>
      '/applications/$applicationId/themes/generate';

  static String nudge(String applicationId, String themeId) =>
      '/applications/$applicationId/themes/$themeId/nudge';

  static String copy(String applicationId, String themeId) =>
      '/applications/$applicationId/themes/$themeId/copy';

  static String copyToApplication(String applicationId, String themeId) =>
      '/applications/$applicationId/themes/$themeId/copy-to-application';
}

class DeployConfiguratorBackandAPI {
  static String get deployApplications => '/github-proxy/dispatch-workflow';

  static String get phoneBranched => '/github-proxy/phone-branches';

  static String get callkeepBranches => '/github-proxy/callkeep-branches';

  static const String getAppVersionByBranch = '/github-proxy/app-version';
}

class TranslationConfiguratorBackandAPI {
  static String get translations => '/translations';

  static String translationOverrides(String applicationId) =>
      '/translations/overrides/$applicationId';
}

class AssetConfiguratorBackandAPI {
  static String assets(String appId) => '/applications/$appId/assets';

  static String asset(String appId, String assetId) =>
      '/applications/$appId/assets/$assetId';

  static String link(String appId, String assetId) =>
      '/applications/$appId/assets/$assetId/link';

  static String unlink(String appId, String assetId) =>
      '/applications/$appId/assets/$assetId/unlink';

  static String downloadUrl(String appId, String assetId) =>
      '/applications/$appId/assets/$assetId/url';

  static String upload(String appId) => '/applications/$appId/assets/upload';
}

class EmbedConfiguratorBackandAPI {
  static String embeds(String applicationId) =>
      '/applications/$applicationId/embeds';

  static String embed(String applicationId, String embedId) =>
      '/applications/$applicationId/embeds/$embedId';
}

class PublicationResourcesAPI {
  static String list(String appId) =>
      '/applications/$appId/publication-resources';

  static String create(String appId) =>
      '/applications/$appId/publication-resources';

  static String item(String id) => '/applications/_/publication-resources/$id';
}

class FeatureAccessConfiguratorBackandAPI {
  static String list(String appId) => '/applications/$appId/feature-access';

  static String byTheme(String appId, String themeId) =>
      '/applications/$appId/feature-access/by-theme/$themeId';
}

// data/lib/datasource/configurator_backend/configurator_backand_api.dart

class ColorSchemeConfiguratorBackandAPI {
  static String list(String appId, String themeId) =>
      '/applications/$appId/themes/$themeId/color-schemes';

  static String item(String appId, String themeId, String variant) =>
      '/applications/$appId/themes/$themeId/color-schemes/$variant';

  /// ensure returns both variants (light & dark)
  static String ensurePair(String appId, String themeId) =>
      '/applications/$appId/themes/$themeId/color-schemes/ensure-pair';

  /// upsert particular variant (partial deep-merge on server)
  static String upsertVariant(String appId, String themeId, String variant) =>
      '/applications/$appId/themes/$themeId/color-schemes/$variant';
}

class WidgetConfiguratorBackendAPI {
  static String list(String appId, String themeId) =>
      '/applications/$appId/themes/$themeId/widget-configs';

  static String item(String appId, String themeId, String variant) =>
      '/applications/$appId/themes/$themeId/widget-configs/$variant';

  /// ensure returns both variants (light & dark)
  static String ensurePair(String appId, String themeId) =>
      '/applications/$appId/themes/$themeId/widget-configs/ensure-pair';

  /// upsert particular variant (partial deep-merge on server)
  static String upsertVariant(String appId, String themeId, String variant) =>
      '/applications/$appId/themes/$themeId/widget-configs/$variant';
}

class PageConfiguratorBackendAPI {
  static String list(String appId, String themeId) =>
      '/applications/$appId/themes/$themeId/page-configs';

  static String ensurePair(String appId, String themeId) =>
      '/applications/$appId/themes/$themeId/page-configs/ensure-pair';

  static String item(String appId, String themeId, String variant) =>
      '/applications/$appId/themes/$themeId/page-configs/$variant';
}

class SplashAssetConfiguratorBackendAPI {
  static String item(String appId, String themeId) =>
      '/applications/$appId/themes/$themeId/splash-asset';

  static String constraintsDefaults(String appId, String themeId) =>
      '/applications/$appId/themes/$themeId/splash-asset/constraints-defaults';

  static String uploadBatch(String appId, String themeId) =>
      '/applications/$appId/themes/$themeId/splash-asset/upload-batch';
}

class LaunchAssetsConfiguratorBackendAPI {
  static String _base(String appId, String themeId) =>
      '/applications/$appId/themes/$themeId/launch-assets';

  static String getByTheme(String appId, String themeId) =>
      _base(appId, themeId);

  static String uploadBatch(String appId, String themeId) =>
      '${_base(appId, themeId)}/upload-batch';

  static String delete(String appId, String themeId) => _base(appId, themeId);

  static String constraintsDefaults(String appId, String themeId) =>
      '${_base(appId, themeId)}/constraints-defaults';
}

class LaunchArtifactUploadWire {
  LaunchArtifactUploadWire({
    required this.target,
    required this.mimeType,
    required this.bytes,
  });

  final String target; // 'androidLegacy' | 'androidAdaptiveForeground' | ...
  final String mimeType;
  final List<int> bytes;
}

class ThemeHistoryConfiguratorBackendAPI {
  static String history(String appId, String themeId) =>
      '/applications/$appId/themes/$themeId/history';

  static String historyEntry(String appId, String themeId, String historyId) =>
      '/applications/$appId/themes/$themeId/history/$historyId';
}

class ThemeShareConfiguratorBackendAPI {
  static String get createToken => '/theme-shares';

  static String preview(String token) => '/theme-shares/$token';
}

class ArtifactsConfiguratorBackendAPI {
  static String list(String appId, String themeId) =>
      '/applications/$appId/themes/$themeId/artifacts';

  static String item(String appId, String themeId, String id) =>
      '/applications/$appId/themes/$themeId/artifacts/$id';

  static String upload(String appId, String themeId) =>
      '/applications/$appId/themes/$themeId/artifacts/upload';

  static String create(String appId, String themeId) =>
      '/applications/$appId/themes/$themeId/artifacts';

  static String update(String appId, String themeId, String id) =>
      '/applications/$appId/themes/$themeId/artifacts/$id';

  static String delete(String appId, String themeId, String id) =>
      '/applications/$appId/themes/$themeId/artifacts/$id';
}
