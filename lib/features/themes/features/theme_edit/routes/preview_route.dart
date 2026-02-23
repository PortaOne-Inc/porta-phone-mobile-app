import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';

import 'package:webtrit_configurator/app/application.dart';

import '../features/features.dart';
import 'feature_access_shell_route.dart';

class PreviewRoute {
  PreviewRoute(this.getIt);

  static DestinationInfo menu(String applicationId, String themeId) =>
      DestinationInfo(
        name: 'theme_scheme_review',
        path: '/applications/$applicationId/$themeId/edit',
      );

  static DestinationInfo preview(String applicationId, String themeId) =>
      DestinationInfo(
        name: 'theme_scheme_review_preview',
        path: '/applications/$applicationId/$themeId/edit/preview',
      );

  final GetIt getIt;

  GoRouter build(BuildContext context, String applicationId, String themeId) {
    return GoRouter(
      requestFocus: false,
      routerNeglect: true,
      initialLocation: menu(applicationId, themeId).path,
      errorBuilder: (BuildContext context, GoRouterState state) {
        return const PageThemePreview();
      },
      routes: [
        ShellRoute(
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return FeatureAccessShellRoute(
              child: PreviewShellRoute(child: child),
            );
          },
          routes: [
            GoRoute(
              path: menu(applicationId, themeId).path,
              name: menu(applicationId, themeId).name,
              builder: (BuildContext context, GoRouterState state) {
                return const PageThemePreview();
              },
            ),
          ],
        ),
      ],
    );
  }
}
