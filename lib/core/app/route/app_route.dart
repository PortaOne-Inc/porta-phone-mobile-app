import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:webtrit_configurator/core/env/app_environment.dart';

import 'package:webtrit_configurator/features/common/common.dart';
import 'package:webtrit_configurator/features/features.dart';
import 'package:webtrit_configurator/share/widgets/page/page.dart';

import 'app_route_consts.dart';

class AppRoute {
  GoRouter build(GetIt getIt) {
    final commonBloc = CommonBloc(
      usecaseAuthLogOut: getIt.get(),
    );

    return GoRouter(
      routes: [
        ShellRoute(
            builder: (BuildContext context, GoRouterState state, Widget child) {
              return BlocProvider(
                lazy: false,
                create: (BuildContext context) => commonBloc,
                child: BlocListener<CommonBloc, CommonState>(
                  listener: (BuildContext context, CommonState state) {
                    if (state.isLogOut) {
                      GoRouter.of(context).go(AppRoutInfo.login.name);
                    }
                  },
                  child: child,
                ),
              );
            },
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
                path: AppRoutInfo.admin.path,
                name: AppRoutInfo.admin.name,
                builder: (BuildContext context, GoRouterState state) => BlocProvider<AdminCubit>(
                  child: const AdminPage(),
                  create: (BuildContext context) => AdminCubit(),
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
                    applicationId: state.params[AppRoutInfo.keyApplicationId]!,
                  ),
                  child: const ApplicationEditPage(),
                ),
              ),
              GoRoute(
                path: AppRoutInfo.themes.path,
                name: AppRoutInfo.themes.name,
                builder: (BuildContext context, GoRouterState state) => BlocProvider<ThemeCollectionCubit>(
                  child: const ThemeCollectionPage(),
                  create: (BuildContext context) => ThemeCollectionCubit(
                    applicationId: state.params[AppRoutInfo.keyApplicationId]!,
                    getThemesUseCase: getIt.get(),
                    makeThemeAsDefaultUseCase: getIt.get(),
                    deleteThemeUseCase: getIt.get(),
                    createThemeUseCase: getIt.get(),
                    getTemplateThemeUseCase: getIt.get(),
                  ),
                ),
              ),
              GoRoute(
                  path: AppRoutInfo.themesEdit.path,
                  name: AppRoutInfo.themesEdit.name,
                  builder: (BuildContext context, GoRouterState state) => MultiBlocProvider(
                        providers: [
                          BlocProvider<ThemePropertyCubit>(
                            create: (BuildContext context) => ThemePropertyCubit(),
                          ),
                          BlocProvider<SynchronizeCubit>(
                            create: (BuildContext context) => SynchronizeCubit(
                              updateThemeUseCase: getIt.get(),
                              getThemeUseCase: getIt.get(),
                              getUserUsecase: getIt.get(),
                              applicationId: state.params[AppRoutInfo.keyApplicationId]!,
                              themeId: state.params[AppRoutInfo.keyThemeId]!,
                            ),
                          ),
                        ],
                        child: PageThemeEdit(
                          swaggerUrl: getIt.get<AppEnvironment>().endpoints.doc,
                        ),
                      ))
            ])
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

    final currentLocation = state.location;

    // TODO: Do more pretty
    if (isAuth) {
      if (currentLocation == AppRoutInfo.login.path) {
        return AppRoutInfo.applicationCollection.path;
      }
    } else {
      if (state.location == AppRoutInfo.reset.path) {
        return null;
      } else {
        return AppRoutInfo.login.path;
      }
    }
    return null;
  }
}
