class RouteData {
  final String name;
  final String path;

  const RouteData({
    required this.name,
    required this.path,
  });
}

abstract class AppRoutInfo {
  static const login = RouteData(
    name: 'login',
    path: '/',
  );
  static const reset = RouteData(
    name: 'reset',
    path: '/auth/reset',
  );
  static const applicationCollection = RouteData(
    name: 'applications',
    path: '/applications',
  );
  static const admin = RouteData(
    name: 'admin',
    path: '/admin',
  );
  static const applicationCreate = RouteData(
    name: 'applications/create',
    path: '/applications/create',
  );
  static const applicationEdit = RouteData(
    name: 'applications/edit',
    path: '/applications/:$keyApplicationId/edit',
  );
  static const applicationDetails = RouteData(
    name: 'applications/detail',
    path: '/applications/:$keyApplicationId',
  );
  static const themesCreate = RouteData(
    name: 'themes/create',
    path: '/applications/:$keyApplicationId/create',
  );
  static const themesEdit = RouteData(
    name: 'themes/edit',
    path: '/applications/:$keyApplicationId/:$keyThemeId',
  );

  static const String keyApplicationId = 'applicationId';
  static const String keyThemeId = 'themeId';
}
