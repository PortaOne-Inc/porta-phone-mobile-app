import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../features/schemes/schemes.dart';
import '../features/features.dart';

import 'assets_shell_route.dart';

class SchemeRoute {
  SchemeRoute(this.getIt);

  static DestinationInfo menu(String applicationId, String themeId) => DestinationInfo(
        name: 'theme-scheme-menu',
        path: '/applications/$applicationId/$themeId/edit',
      );

  static const colorScheme = DestinationInfo(
    name: 'color-scheme',
    path: '/colors',
  );

  static const widgetConfiguration = DestinationInfo(
    name: 'widget-scheme',
    path: '/widgets',
  );

  static const pagesConfiguration = DestinationInfo(
    name: 'pages-configuration',
    path: '/pages',
  );

  static const assetsScheme = DestinationInfo(
    name: 'asset-scheme',
    path: '/assets',
  );

  static const assetsSchemeAddAsset = DestinationInfo(
    name: 'asset-scheme-add',
    path: '/assets/add',
  );

  static const launchScheme = DestinationInfo(
    name: 'launch-scheme',
    path: '/launch',
  );

  static const appFeatureConfiguration = DestinationInfo(
    name: 'feature-scheme',
    path: '/features',
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

  final GetIt getIt;

  GoRouter build(BuildContext context, String applicationId, String themeId) {
    return GoRouter(
      initialLocation: menu(applicationId, themeId).path,
      routerNeglect: true,
      requestFocus: false,
      restorationScopeId: 'scheme-route',
      errorBuilder: (BuildContext context, GoRouterState state) {
        return const ThemeSchemeScreen();
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
                    name: colorScheme.name,
                    path: colorScheme.path,
                    builder: (BuildContext context, GoRouterState state) {
                      return const ColorSchemeConfigurationView();
                    },
                  ),
                  GoRoute(
                    name: widgetConfiguration.name,
                    path: widgetConfiguration.path,
                    builder: (BuildContext context, GoRouterState state) {
                      return const ConfigureWidgetsView();
                    },
                  ),
                  GoRoute(
                    name: pagesConfiguration.name,
                    path: pagesConfiguration.path,
                    builder: (BuildContext context, GoRouterState state) {
                      return const ConfigureThemePageView();
                    },
                  ),
                  GoRoute(
                    name: appFeatureConfiguration.name,
                    path: appFeatureConfiguration.path,
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
                    name: assetsScheme.name,
                    path: assetsScheme.path,
                    builder: (BuildContext context, GoRouterState state) {
                      return const Scaffold(
                        body: AssetsScreen(),
                      );
                    },
                    routes: [
                      GoRoute(
                          name: assetsSchemeAddAsset.name,
                          path: assetsSchemeAddAsset.path,
                          builder: (BuildContext context, GoRouterState state) {
                            return BlocProvider(
                              create: (BuildContext context) => AssetsCubit(
                                applicationId,
                                themeId,
                                getIt.get(),
                                getIt.get(),
                              ),
                              child: const AddAssetScreen(),
                            );
                          })
                    ],
                  ),
                  GoRoute(
                    name: launchScheme.name,
                    path: launchScheme.path,
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
