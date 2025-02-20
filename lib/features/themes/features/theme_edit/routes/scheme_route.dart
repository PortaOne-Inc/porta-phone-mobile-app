import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/bloc/bloc.dart';

import '../features/schemes/features/splash_screen/bloc/splash_assets_bloc.dart';
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
  static const splashScreenScheme = DestinationInfo(
    name: 'splash-screen-scheme',
    path: '/splash',
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

  static const appFeatureSchemeAddLoginModeAction = DestinationInfo(
    name: 'app_feature_scheme_add_login_mode_action',
    path: '/app/feature/scheme/login/mode-action',
  );

  static const appFeatureSchemeCollectionEmbedded = DestinationInfo(
    name: 'appFeatureSchemeCollectionEmbedded',
    path: '/app/feature/scheme/embedded/collection',
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
                          path: appFeatureSchemeCollectionEmbedded.path,
                          name: appFeatureSchemeCollectionEmbedded.name,
                          builder: (BuildContext context, GoRouterState state) {
                            final appConfig = context.read<UpdateThemCubit>().state.appConfig;
                            return CollectionEmbedded(
                              isPicker: true,
                              embeddedResources: appConfig.embeddedResources,
                              callback: (config) => context.read<UpdateThemCubit>().add(
                                    UpdateSchemeEvent.featureAccess(appConfig.copyWith(embeddedResources: config)),
                                  ),
                            );
                          }),
                      GoRoute(
                          path: appFeatureSchemeAddLoginModeAction.path,
                          name: appFeatureSchemeAddLoginModeAction.name,
                          builder: (BuildContext context, GoRouterState state) {
                            return AddModeActionPage(
                              embedded: context.read<UpdateThemCubit>().state.appConfig.embeddedResources,
                            );
                          }),
                      GoRoute(
                          path: appFeatureSchemeAddEmbeddedData.path,
                          name: appFeatureSchemeAddEmbeddedData.name,
                          builder: (BuildContext context, GoRouterState state) {
                            return BlocProvider(
                              create: (BuildContext context) => AddEmbeddedCubit(),
                              child: const AddEmbeddedDataScreen(),
                            );
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
                            return BlocProvider(
                              create: (BuildContext context) => ManageSettingItemCubit(
                                embedded: context.read<UpdateThemCubit>().state.appConfig.embeddedResources,
                                item: state.extra as AppConfigSettingsItem?,
                              ),
                              child: const AddSettingItemScreen(),
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
                      final filters = state.extra is List<ThemeAssetType>
                          ? state.extra as List<ThemeAssetType>?
                          : ThemeAssetType.values;
                      final lockFilters = state.extra is List<ThemeAssetType>;
                      return BlocProvider(
                        create: (BuildContext context) => AssetsCubit(
                          filters: filters ?? ThemeAssetType.values,
                          lockFilters: lockFilters,
                        ),
                        child: const AssetsScreen(),
                      );
                    },
                    routes: [
                      GoRoute(
                          name: assetsSchemeAddAsset.name,
                          path: assetsSchemeAddAsset.path,
                          builder: (BuildContext context, GoRouterState state) {
                            return BlocProvider(
                              create: (BuildContext context) => AddAssetCubit(
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
                      return BlocProvider(
                        create: (context) => LaunchAssetsCubit(
                          applicationId,
                          themeId,
                          getIt.get(),
                          getIt.get(),
                        ),
                        child: const LaunchAssetsScreen(),
                      );
                    },
                  ),
                  GoRoute(
                    name: splashScreenScheme.name,
                    path: splashScreenScheme.path,
                    builder: (BuildContext context, GoRouterState state) {
                      return BlocProvider(
                        create: (context) => SplashAssetsBloc(
                          applicationId: applicationId,
                          themeId: themeId,
                          uploadFileUsecase: getIt.get(),
                          updateSplashAssetsThemeUsecase: getIt.get(),
                        ),
                        child: const SplashScreen(),
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
