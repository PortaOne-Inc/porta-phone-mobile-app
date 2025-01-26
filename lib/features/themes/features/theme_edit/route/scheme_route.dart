import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/core/core.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/view/theme_scheme_screen.dart';

import '../features/schemes//feature_access/features/features.dart';
import '../features/features.dart';

import 'assets_shell_route.dart';

class SchemeRoute {
  static DestinationInfo menu(String applicationId, String themeId) => DestinationInfo(
        name: 'theme_scheme_menu',
        path: '/applications/$applicationId/$themeId/edit',
      );

  static const colorScheme = DestinationInfo(
    name: 'color_scheme',
    path: '/color_scheme',
  );

  static const widgetConfiguration = DestinationInfo(
    name: 'widget_configuration',
    path: '/widget_configuration',
  );

  static const pagesConfiguration = DestinationInfo(
    name: 'pages_configuration',
    path: '/pages_configuration',
  );

  static const assetsConfiguration = DestinationInfo(
    name: 'assets_configuration',
    path: '/assets_configuration',
  );

  static const assetsSchemeAddAsset = DestinationInfo(
    name: 'assets_scheme_add_asset',
    path: '/assets/scheme/add/asset',
  );

  static const launchAssetsConfiguration = DestinationInfo(
    name: 'launch_assets_configuration',
    path: '/launch_assets_configuration',
  );

// App feature scheme

  static const appFeatureConfiguration = DestinationInfo(
    name: 'app_feature_configuration',
    path: '/app_feature_configuration',
  );

  static const appFeatureSchemeAddSettingSection = DestinationInfo(
    name: 'app_feature_scheme_add_setting_section',
    path: '/app/feature/setting/scheme',
  );

  static const appFeatureSchemeAddSettingSectionItem = DestinationInfo(
    name: 'app_feature_scheme_add_setting_section_item',
    path: '/app/feature/setting/scheme/item',
  );

  static const appFeatureSchemeAddEmbeddedData = DestinationInfo(
    name: 'app_feature_scheme_add_embedded_data',
    path: '/app/feature/scheme/embedded/data',
  );

  static const appFeatureSchemeMainManageTab = DestinationInfo(
    name: 'app_feature_scheme_main_manage_tab',
    path: '/app/feature/scheme/main/manage/tab',
  );

  GoRouter build(BuildContext context, String applicationId, String themeId) {
    return GoRouter(
      initialLocation: menu(applicationId, themeId).path,
      routerNeglect: true,
      requestFocus: false,
      errorBuilder: (BuildContext context, GoRouterState state) {
        return const ThemeSchemeScreen(); // Or any appropriate fallback widget
      },
      routes: [
        ShellRoute(
            builder: (BuildContext context, GoRouterState state, Widget child) {
              return AssetsShellRoute(child: child);
            },
            routes: [
              GoRoute(
                path: menu(applicationId, themeId).path,
                name: menu(applicationId, themeId).name,
                builder: (BuildContext context, GoRouterState state) {
                  return const ThemeSchemeScreen();
                },
                routes: [
                  GoRoute(
                    path: colorScheme.path,
                    name: colorScheme.name,
                    builder: (BuildContext context, GoRouterState state) {
                      return const ColorSchemeConfigurationView();
                    },
                  ),
                  GoRoute(
                    path: widgetConfiguration.path,
                    name: widgetConfiguration.name,
                    builder: (BuildContext context, GoRouterState state) {
                      return const ConfigureWidgetsView();
                    },
                  ),
                  GoRoute(
                    path: pagesConfiguration.path,
                    name: pagesConfiguration.name,
                    builder: (BuildContext context, GoRouterState state) {
                      return const ConfigureThemePageView();
                    },
                  ),
                  GoRoute(
                    path: appFeatureConfiguration.path,
                    name: appFeatureConfiguration.name,
                    builder: (BuildContext context, GoRouterState state) {
                      return const ConfigureAppConfigView();
                    },
                    routes: [
                      GoRoute(
                          path: appFeatureSchemeAddEmbeddedData.path,
                          name: appFeatureSchemeAddEmbeddedData.name,
                          builder: (BuildContext context, GoRouterState state) {
                            return const AddEmbeddedDataScreen();
                          }),
                      GoRoute(
                        path: appFeatureSchemeAddSettingSection.path,
                        name: appFeatureSchemeAddSettingSection.name,
                        builder: (BuildContext context, GoRouterState state) {
                          return const AddSettingSectionScreen(
                            assets: [],
                            embedded: [],
                          );
                        },
                      ),
                      GoRoute(
                          path: appFeatureSchemeAddSettingSectionItem.path,
                          name: appFeatureSchemeAddSettingSectionItem.name,
                          builder: (BuildContext context, GoRouterState state) {
                            return const AddSettingItemScreen(
                              assets: [],
                              embedded: [],
                            );
                          }),
                      GoRoute(
                          path: appFeatureSchemeMainManageTab.path,
                          name: appFeatureSchemeMainManageTab.name,
                          builder: (BuildContext context, GoRouterState state) {
                            return ManageMenuTabScreen(
                              bottomMenuTabScheme: state.extra as BottomMenuTabScheme?,
                            );
                          })
                    ],
                  ),
                  GoRoute(
                      path: assetsConfiguration.path,
                      name: assetsConfiguration.name,
                      builder: (BuildContext context, GoRouterState state) {
                        return const AssetsScreen();
                      },
                      routes: [
                        GoRoute(
                            path: assetsSchemeAddAsset.path,
                            name: assetsSchemeAddAsset.name,
                            builder: (BuildContext context, GoRouterState state) {
                              return const AddAssetScreen();
                            })
                      ]),
                  GoRoute(
                    path: launchAssetsConfiguration.path,
                    name: launchAssetsConfiguration.name,
                    builder: (BuildContext context, GoRouterState state) {
                      final themeModel = state.extra as ThemeModel?;
                      return LaunchAssetsConfigurationView(
                        themeModel: themeModel!,
                      );
                    },
                  ),
                ],
              )
            ]),
      ],
    );
  }
}
