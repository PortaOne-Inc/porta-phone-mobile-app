import 'dart:async';

import 'package:data/dto/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/features/features.dart';
import 'package:webtrit_configurator/core/core.dart';

import 'app_route_consts.dart';
import 'go_route_redirects.dart';
import 'go_router_wrapper.dart';

final _logger = Logger('AppRoute');

class AppRoute {
  GoRouter build(GetIt getIt, BuildContext context) {
    return GoRouter(
      routes: [
        ShellRoute(
          builder: (BuildContext context, GoRouterState state, Widget child) => AuthReLoginShell(
            relogin: BlocProvider<LoginCubit>(
              child: LoginScreen(
                title: 'Your session has expired, please log in again',
                onLogin: () => context.pop(),
              ),
              create: (BuildContext context) => LoginCubit(
                signInUsecase: getIt.get(),
                getAuthStatusUsecase: getIt.get(),
              ),
            ),
            child: child,
          ),
          routes: [
            GoRoute(
              path: AppRoutInfo.login.path,
              name: AppRoutInfo.login.name,
              builder: (BuildContext context, GoRouterState state) => WelcomeScreen(
                child: BlocProvider<LoginCubit>(
                  child: LoginScreen(
                    title: context.l10n.authorization_title,
                    onLogin: () => GoRouter.of(context).goNamed(AppRoutInfo.applicationCollection.name),
                  ),
                  create: (BuildContext context) => LoginCubit(
                    signInUsecase: getIt.get(),
                    getAuthStatusUsecase: getIt.get(),
                  ),
                ),
              ),
            ),
            GoRoute(
              path: AppRoutInfo.reset.path,
              name: AppRoutInfo.reset.name,
              builder: (BuildContext context, GoRouterState state) => BlocProvider<ResetPasswordCubit>(
                child: const ResetPage(),
                create: (BuildContext context) => ResetPasswordCubit(
                  resetAuthPassword: getIt.get(),
                ),
              ),
            ),
            GoRoute(
              path: AppRoutInfo.applicationCollection.path,
              name: AppRoutInfo.applicationCollection.name,
              builder: (BuildContext context, GoRouterState state) => BlocProvider<ApplicationCollectionCubit>(
                create: (BuildContext context) => ApplicationCollectionCubit(
                  applicationCollectionUsecase: getIt.get(),
                  applicationDeleteUsecase: getIt.get(),
                  applicationIncVersion: getIt.get(),
                  getUserUsecase: getIt.get(),
                ),
                child: const ApplicationCollectionPage(),
              ),
            ),
            GoRoute(
              path: AppRoutInfo.applicationCreate.path,
              name: AppRoutInfo.applicationCreate.name,
              builder: (BuildContext context, GoRouterState state) => BlocProvider<ApplicationCreateCubit>(
                create: (BuildContext context) => ApplicationCreateCubit(
                  applicationCreateUsecase: getIt.get(),
                ),
                child: const ApplicationCreatePage(),
              ),
            ),
            GoRoute(
              path: AppRoutInfo.applicationEdit.path,
              name: AppRoutInfo.applicationEdit.name,
              builder: (BuildContext context, GoRouterState state) => BlocProvider<ApplicationEditCubit>(
                create: (BuildContext context) => ApplicationEditCubit(
                  updateApplicationUsecase: getIt.get(),
                  applicationGetUsecase: getIt.get(),
                  applicationId: state.pathParameters[AppRoutInfo.keyApplicationId]!,
                ),
                child: const ApplicationEditPage(),
              ),
            ),
            GoRoute(
              path: AppRoutInfo.themesCreate.path,
              name: AppRoutInfo.themesCreate.name,
              builder: (BuildContext context, GoRouterState state) => BlocProvider<ThemeCreateCubit>(
                create: (BuildContext context) => ThemeCreateCubit(
                  applicationId: state.pathParameters[AppRoutInfo.keyApplicationId]!,
                  createThemeUseCase: getIt.get(),
                  defaultFeatureAccess: getIt.get(),
                  defaultThemeConfig: getIt.get(),
                ),
                child: const ThemeCreatePage(),
              ),
            ),
            GoRoute(
                path: AppRoutInfo.applicationDetails.path,
                name: AppRoutInfo.applicationDetails.name,
                builder: (BuildContext context, GoRouterState state) => BlocProvider<ApplicationDetailsCubit>(
                      child: const ApplicationDetailsPage(),
                      create: (BuildContext context) => ApplicationDetailsCubit(
                        applicationModel: state.extra as ApplicationModel?,
                        applicationId: state.pathParameters[AppRoutInfo.keyApplicationId]!,
                        getThemesUseCase: getIt.get(),
                        makeThemeAsDefaultUseCase: getIt.get(),
                        deleteThemeUseCase: getIt.get(),
                        getApplicationGet: getIt.get(),
                        applicationDeleteUsecase: getIt.get(),
                        updateBuildNameUseCase: getIt.get(),
                        updateBuildNumberUseCase: getIt.get(),
                        updateApplicationUsecase: getIt.get(),
                      ),
                    ),
                routes: [
                  GoRoute(
                    name: AppRoutInfo.applicationDetailsEnv.name,
                    path: AppRoutInfo.applicationDetailsEnv.path,
                    builder: (BuildContext context, GoRouterState state) => BlocProvider(
                      create: (context) => EnvironmentCubit(
                        applicationId: state.pathParameters[AppRoutInfo.keyApplicationId]!,
                        updateApplicationEnvironmentUsecase: getIt.get(),
                        getApplicationEnvironmentUsecase: getIt.get(),
                      ),
                      child: const EnvironmentConfigurationView(),
                    ),
                  ),
                  GoRoute(
                    name: AppRoutInfo.applicationDeployment.name,
                    path: AppRoutInfo.applicationDeployment.path,
                    builder: (BuildContext context, GoRouterState state) => BlocProvider(
                      create: (context) => DeploymentCubit(
                        applicationId: state.pathParameters[AppRoutInfo.keyApplicationId]!,
                        getApplicationGet: getIt.get(),
                        updateBuildNameUseCase: getIt.get(),
                        updateBuildNumberUseCase: getIt.get(),
                        updateApplicationUsecase: getIt.get(),
                        getPhoneBranchesUsecase: getIt.get(),
                        usecaseDeployBuilds: getIt.get(),
                      ),
                      child: const DeploymentView(),
                    ),
                  ),
                ]),
            GoRoute(
              path: AppRoutInfo.translations.path,
              name: AppRoutInfo.translations.name,
              builder: (BuildContext context, GoRouterState state) => BlocProvider<TranslationsCubit>(
                create: (context) => TranslationsCubit(
                  appId: state.pathParameters[AppRoutInfo.keyApplicationId]!,
                  usecaseTranslationsGetAll: getIt.get(),
                  usecaseTranslationsGetOverridesByAppId: getIt.get(),
                  usecaseTranslationsSetOverride: getIt.get(),
                  usecaseTranslationsDeleteOverride: getIt.get(),
                ),
                child: const TranslationsPage(),
              ),
            ),

            // Added redirect for all theme details paths for avoid conflicts with nested routes
            ...GoRouteRedirects(
              basePath: '/applications/:applicationId/:themeId/:path',
              maxExtraPaths: 5,
              redirectCallback: _handleThemeDetailsRedirects,
            ).generateRoutes(),
            GoRoute(
              path: AppRoutInfo.themesEdit.path,
              name: AppRoutInfo.themesEdit.name,
              builder: (BuildContext context, GoRouterState state) {
                final applicationId = state.pathParameters[AppRoutInfo.keyApplicationId]!;
                final themeId = state.pathParameters[AppRoutInfo.keyThemeId]!;

                return MultiBlocProvider(
                  providers: [
                    BlocProvider<UpdateThemCubit>(
                      create: (BuildContext context) => UpdateThemCubit(
                        defaultThemeSettings: getIt.get<ThemeSettings>(),
                        appConfig: getIt.get<AppConfig>(),
                        updateThemeUseCase: getIt<UsecaseThemeUpdate>(param1: applicationId),
                        getApplicationUseCase: getIt<UsecaseApplicationGet>(param1: applicationId),
                        getThemeUseCase: getIt<UsecaseThemeGet>(param1: applicationId, param2: themeId),
                        applicationId: applicationId,
                        themeId: themeId,
                      ),
                    ),
                    BlocProvider<PreviewThemeCubit>(create: (BuildContext context) => PreviewThemeCubit())
                  ],
                  child: PageThemeEdit(
                    title: context.l10n.feature_theme_edit_Toolbar_dashboard,
                    children: [
                      GoRouterWrapper(
                        router: SchemeRoute(getIt).build(
                          context,
                          state.pathParameters[AppRoutInfo.keyApplicationId]!,
                          state.pathParameters[AppRoutInfo.keyThemeId]!,
                        ),
                      ),
                      GoRouterWrapper(
                        router: PreviewRoute(getIt).build(
                          context,
                          state.pathParameters[AppRoutInfo.keyApplicationId]!,
                          state.pathParameters[AppRoutInfo.keyThemeId]!,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        )
      ],
      redirect: (context, state) => context.read<AuthCubit>().redirectGuard(state),
      errorBuilder: (context, state) => const NotFoundPage(),
      initialLocation: AppRoutInfo.applicationCollection.path,
    );
  }

  String? _handleThemeDetailsRedirects(GoRouterState state) {
    final applicationId = state.pathParameters['applicationId'];
    final themeId = state.pathParameters['themeId'];

    _logger.info('Redirecting to applicationId: $applicationId, themeId: $themeId');

    if (applicationId == null || themeId == null) {
      return '/applications';
    }

    return '/applications/$applicationId';
  }
}
