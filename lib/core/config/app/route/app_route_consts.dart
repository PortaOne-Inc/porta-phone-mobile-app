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
  static const vendorCreate = RouteData(
    name: 'vendorCreate',
    path: '/vendor/create',
  );
  static const themes = RouteData(
    name: 'themes',
    path: '/vendor/:$keyVendorId/themes',
  );
  static const themesCreate = RouteData(
    name: 'themesCreate',
    path: '/vendor/:$keyVendorId',
  );
  static const themesEdit = RouteData(
    name: 'themesEdit',
    path: '/vendor/:$keyVendorId/:$keyThemeId',
  );

  static const String keyVendorId = 'vendorId';
  static const String keyThemeId = 'themeId';
}
