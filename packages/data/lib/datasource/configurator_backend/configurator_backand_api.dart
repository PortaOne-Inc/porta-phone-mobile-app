class AuthConfiguratorBackandAPI {
  static String get login => '/auth/login';

  static String get register => '/auth/register';
}

class ApplicationConfiguratorBackandAPI {
  static String get applications => '/applications';

  static String application(String applicationId) => '/applications/$applicationId';

  static String applicationVersion(String applicationId) => '/applications/$applicationId/version';

  static String applicationEnvironment(String applicationId) => '/applications/$applicationId/environment';
}

class ThemeConfiguratorBackandAPI {
  static String allThemes() => '/applications/themes';

  static String applicationThemes(String applicationId) => '/applications/$applicationId/themes';

  static String theme(String applicationId, String themeId) => '/applications/$applicationId/themes/$themeId';

  static String themeVersion(String applicationId) => '/applications/$applicationId/version';
}

class DeployConfiguratorBackandAPI {
  static String get deployApplications => '/github-proxy/dispatch-workflow';

  static String get phoneBranched => '/github-proxy/phone-branches';

  static const String getAppVersionByBranch = '/github-proxy/app-version';
}

class TranslationConfiguratorBackandAPI {
  static String get translations => '/translations';

  static String translationOverrides(String applicationId) => '/translations/overrides/$applicationId';
}
