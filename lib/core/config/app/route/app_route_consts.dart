class RouteData {
  final String name;
  final String path;

  const RouteData({required this.name, required this.path});
}

abstract class AppRoutInfo {
  static const login = RouteData(
    name: 'login',
    path: '/',
  );
  static const vendors = RouteData(
    name: 'vendors',
    path: '/vendors',
  );
  static const applicationsCreate = RouteData(
    name: 'applicationsCreate',
    path: '/applications/create',
  );
  static const themes = RouteData(
    name: 'themes',
    path: '/applications/:$keyAppId/themes',
  );
  static const themesCreate = RouteData(
    name: 'themesCreate',
    path: '/applications/:$keyAppId',
  );
  static const themesEdit = RouteData(
    name: 'themesEdit',
    path: '/applications/:$keyAppId/:$keyThemeId',
  );

  static const String keyAppId = 'appId';
  static const String keyThemeId = 'themeId';
}
