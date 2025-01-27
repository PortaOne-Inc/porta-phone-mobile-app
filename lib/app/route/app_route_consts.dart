class DestinationInfo {
  const DestinationInfo({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;
}

abstract class AppRoutInfo {
  static const login = DestinationInfo(
    name: 'login',
    path: '/',
  );
  static const reset = DestinationInfo(
    name: 'reset',
    path: '/auth/reset',
  );
  static const applicationCollection = DestinationInfo(
    name: 'applications',
    path: '/applications',
  );
  static const admin = DestinationInfo(
    name: 'admin',
    path: '/admin',
  );
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
    name: 'applications/env',
    path: 'env',
  );
  static const translations = DestinationInfo(
    name: 'applications/translations',
    path: '/applications/:$keyApplicationId/translations',
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

  static const String keyApplicationId = 'applicationId';
  static const String keyThemeId = 'themeId';
  static const values = [
    login,
    reset,
    applicationCollection,
    admin,
    applicationCreate,
    applicationEdit,
    applicationDetails,
    translations,
    themesCreate,
    themesEdit,
    themesPreview,
  ];
}

// TODO(vlad): Add theme segment key to theme paths to avoid interfering with new features
