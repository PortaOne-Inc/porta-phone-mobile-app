import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/app/application.dart';

import '../features/preview/view/page_theme_preview.dart';
import 'feature_access_shell_route.dart';

class PreviewRoute {
  static DestinationInfo menu(String applicationId, String themeId) => DestinationInfo(
        name: 'theme_scheme_review',
        path: '/applications/$applicationId/$themeId/edit',
      );

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
              return FeatureAccessShellRoute(child: child);
            },
            routes: [
              GoRoute(
                path: menu(applicationId, themeId).path,
                name: menu(applicationId, themeId).name,
                builder: (BuildContext context, GoRouterState state) {
                  return const PageThemePreview();
                },
              )
            ])
      ],
    );
  }
}
