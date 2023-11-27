import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/features/features.dart';
import 'package:webtrit_configurator/core/core.dart';

import 'app_route_consts.dart';

class AppRoute {
  GoRouter build(GetIt getIt, BuildContext context) {
    return GoRouter(
      routes: [
        ShellRoute(
          builder: (BuildContext context, GoRouterState state, Widget child) => child,
          routes: [
            GoRoute(
              path: AppRoutInfo.login.path,
              name: AppRoutInfo.login.name,
              builder: (BuildContext context, GoRouterState state) => BlocProvider<AuthCubit>(
                child: const AuthPage(),
                create: (BuildContext context) => AuthCubit(
                  usecaseAuthSignIn: getIt.get(),
                  isUserAuthorized: getIt.get(),
                ),
              ),
            ),
            GoRoute(
              path: AppRoutInfo.reset.path,
              name: AppRoutInfo.reset.name,
              builder: (BuildContext context, GoRouterState state) => BlocProvider<ResetPasswordCubit>(
                child: const ResetPage(),
                create: (BuildContext context) => ResetPasswordCubit(
                  usecaseAuthResetPassword: getIt.get(),
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
                  applicationEditUsecase: getIt.get(),
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
                  getTemplateThemeUseCase: getIt.get(),
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
                ),
              ),
            ),
            GoRoute(
              path: AppRoutInfo.themesEdit.path,
              name: AppRoutInfo.themesEdit.name,
              builder: (BuildContext context, GoRouterState state) => BlocProvider<ThemePropertyCubit>(
                create: (BuildContext context) => ThemePropertyCubit(
                  updateThemeUseCase: getIt<UsecaseThemeUpdate>(
                    param1: state.pathParameters[AppRoutInfo.keyApplicationId]!,
                  ),
                  getApplicationUseCase: getIt<UsecaseApplicationGet>(
                    param1: state.pathParameters[AppRoutInfo.keyApplicationId]!,
                  ),
                  getThemeUseCase: getIt<UsecaseThemeGet>(
                    instanceName: UsecaseThemeGet.applicationUsecaseKey,
                    param1: state.pathParameters[AppRoutInfo.keyApplicationId]!,
                    param2: state.pathParameters[AppRoutInfo.keyThemeId]!,
                  ),
                  applicationId: state.pathParameters[AppRoutInfo.keyApplicationId]!,
                  themeId: state.pathParameters[AppRoutInfo.keyThemeId]!,
                  colorSchemeCreate: getIt<UsecaseColorSchemeCreate>(),
                ),
                child: PageThemeEdit(
                  title: context.l10n.feature_theme_edit_Toolbar_dashboard,
                ),
              ),
            ),
            GoRoute(
              path: AppRoutInfo.themesPreview.path,
              name: AppRoutInfo.themesPreview.name,
              builder: (BuildContext context, GoRouterState state) => BlocProvider<ThemePreviewCubit>(
                create: (BuildContext context) => ThemePreviewCubit(
                  getApplicationUseCase: getIt<UsecaseApplicationGet>(
                    param1: state.pathParameters[AppRoutInfo.keyApplicationId]!,
                  ),
                  getThemeUseCase: getIt<UsecaseThemeGet>(
                    instanceName: UsecaseThemeGet.applicationUsecaseKey,
                    param1: state.pathParameters[AppRoutInfo.keyApplicationId]!,
                    param2: state.pathParameters[AppRoutInfo.keyThemeId]!,
                  ),
                  applicationId: state.pathParameters[AppRoutInfo.keyApplicationId]!,
                  themeId: state.pathParameters[AppRoutInfo.keyThemeId]!,
                ),
                child: ThemePreviewPage(
                  title: context.l10n.feature_theme_edit_Toolbar_dashboard,
                ),
              ),
            )
          ],
        )
      ],
      redirect: (context, state) => handleMain(context, state, getIt.get<UsecaseAuthIsLoggedIn>()),
      errorBuilder: (context, state) => const NotFoundPage(),
      routerNeglect: false,
      initialLocation: AppRoutInfo.applicationCollection.path,
    );
  }

  FutureOr<String?> handleMain(
    BuildContext context,
    GoRouterState state,
    UsecaseAuthIsLoggedIn isLoggedIn,
  ) async {
    final isAuth = await isLoggedIn.execute();
    final currentLocation = state.fullPath;

    if (isAuth) {
      return currentLocation == AppRoutInfo.login.path ? AppRoutInfo.applicationCollection.path : null;
    } else {
      return currentLocation == AppRoutInfo.reset.path
          ? null
          : currentLocation == AppRoutInfo.themesPreview.path
              ? null
              : AppRoutInfo.login.path;
    }
  }
}
