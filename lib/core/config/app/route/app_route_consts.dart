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
    name: 'application/collection',
    path: '/application/collection',
  );
  static const applicationCreate = RouteData(
    name: 'application/create',
    path: '/application/create',
  );
  static const themes = RouteData(
    name: 'theme/collection',
    path: '/application/:$keyApplicationId/theme/collection',
  );
  static const themesCreate = RouteData(
    name: 'themesCreate',
    path: '/application/:$keyApplicationId',
  );
  static const themesEdit = RouteData(
    name: 'themesEdit',
    path: '/application/:$keyApplicationId/theme/:$keyThemeId',
  );

  static const String keyApplicationId = 'applicationId';
  static const String keyThemeId = 'themeId';
}
