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
  static const applicationCollection = RouteData(
    name: 'applications',
    path: '/applications',
  );
  static const applicationCreate = RouteData(
    name: 'applications/create',
    path: '/applications/create',
  );
  static const applicationEdit = RouteData(
    name: 'applications/edit',
    path: '/applications/:$keyApplicationId/edit',
  );
  static const themes = RouteData(
    name: 'themes',
    path: '/applications/:$keyApplicationId/themes',
  );
  static const themesCreate = RouteData(
    name: 'themes/create',
    path: '/applications/:$keyApplicationId',
  );
  static const themesEdit = RouteData(
    name: 'themes/edit',
    path: '/applications/:$keyApplicationId/themes/:$keyThemeId',
  );

  static const String keyApplicationId = 'applicationId';
  static const String keyThemeId = 'themeId';
}
