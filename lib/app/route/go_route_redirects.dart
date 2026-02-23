import 'package:go_router/go_router.dart';

// Utility class to generate GoRoutes with varying paths
typedef RedirectCallback = String? Function(GoRouterState state);

class GoRouteRedirects {
  GoRouteRedirects({
    required this.basePath,
    this.maxExtraPaths = 0,
    this.redirectCallback,
  }) : assert(basePath.isNotEmpty, 'basePath cannot be empty'),
       assert(maxExtraPaths >= 0, 'maxExtraPaths cannot be negative');

  final String basePath;
  final int maxExtraPaths;
  final RedirectCallback? redirectCallback;

  List<GoRoute> generateRoutes() {
    final routes = <GoRoute>[
      GoRoute(
        path: basePath,
        redirect: redirectCallback != null
            ? (context, state) => redirectCallback!(state)
            : null,
      ),
    ];

    // Generate routes with extra path segments
    for (var i = 1; i <= maxExtraPaths; i++) {
      final fullPath = _constructPathWithSegments(basePath, i);
      routes.add(
        GoRoute(
          path: fullPath,
          redirect: redirectCallback != null
              ? (context, state) => redirectCallback!(state)
              : null,
        ),
      );
    }
    return routes;
  }

  String _constructPathWithSegments(String base, int segmentCount) {
    final buffer = StringBuffer(base);
    for (var i = 0; i < segmentCount; i++) {
      buffer.write('/:path$i');
    }
    return buffer.toString();
  }
}
