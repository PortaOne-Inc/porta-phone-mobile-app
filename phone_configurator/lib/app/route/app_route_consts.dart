class DestinationInfo {
  const DestinationInfo({required this.name, required this.path});

  final String name;
  final String path;
}

abstract class AppRoutInfo {
  static const login = DestinationInfo(name: 'login', path: '/');
  static const reset = DestinationInfo(name: 'reset', path: '/auth/reset');
  static const applicationCollection = DestinationInfo(
    name: 'applications',
    path: '/applications',
  );
  static const admin = DestinationInfo(name: 'admin', path: '/admin');
  static const applicationCreate = DestinationInfo(
    name: 'applications/create',
    path: '/applications/create',
  );
  static const applicationEdit = DestinationInfo(
    name: 'applications/edit',
    path: '/applications/:$keyApplicationId/edit',
  );
  static const applicationDetails = DestinationInfo(
    name: 'applications/detail',
    path: '/applications/:$keyApplicationId',
  );
  static const applicationDetailsEnv = DestinationInfo(
    name: 'applications/environments',
    path: 'environments',
  );
  static const applicationCapabilities = DestinationInfo(
    name: 'features',
    path: '/applications/:$keyApplicationId/capabilities',
  );
  static const applicationEmbeds = DestinationInfo(
    name: 'applications/embeds',
    path: 'embeds',
  );
  static const applicationPublicationResources = DestinationInfo(
    name: 'applications/publication-resources',
    path: 'publication-resources',
  );
  static const applicationEmbedsManage = DestinationInfo(
    name: 'applications/embeds/:$keyEmbedsId',
    path: 'manage-embeds',
  );
  static const applicationAssets = DestinationInfo(
    name: 'applications/assets/:$keyEmbedsId',
    path: 'assets',
  );
  static const applicationDeployment = DestinationInfo(
    name: 'applications/deployment',
    path: 'deployment',
  );
  static const translations = DestinationInfo(
    name: 'applications/translations',
    path: '/applications/:$keyApplicationId/translations',
  );
  static const themesCollection = DestinationInfo(
    name: 'themes/collection',
    path: '/themes',
  );
  static const themesCreate = DestinationInfo(
    name: 'themes/create',
    path: '/applications/:$keyApplicationId/create',
  );
  static const themesEdit = DestinationInfo(
    name: 'themes/edit',
    path: '/applications/:$keyApplicationId/:$keyThemeId',
  );
  static const themesPreview = DestinationInfo(
    name: 'themes/edit/preview',
    path: '/applications/:$keyApplicationId/:$keyThemeId/preview',
  );

  static const sharePreview = DestinationInfo(
    name: 'share-preview',
    path: '/share/:$keyShareToken',
  );

  static const String keyEmbedsId = 'id';
  static const String keyApplicationId = 'applicationId';
  static const String keyThemeId = 'themeId';
  static const String keyShareToken = 'shareToken';
}

// TODO(vlad): Add theme segment key to theme paths to avoid interfering with new features
