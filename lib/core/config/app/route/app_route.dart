import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/features/features.dart';

import 'app_route_consts.dart';

class AppRoute {
  GoRouter build(GetIt getIt) {
    return GoRouter(
      routes: <GoRoute>[
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
          path: AppRoutInfo.vendors.path,
          name: AppRoutInfo.vendors.name,
          builder: (BuildContext context, GoRouterState state) => BlocProvider<VendorCollectionCubit>(
            create: (BuildContext context) => VendorCollectionCubit(
              vendorCollectionUsecase: getIt.get(),
              vendorDeleteUsecase: getIt.get(),
            ),
            child: const VendorCollectionPage(),
          ),
        ),
        GoRoute(
          path: AppRoutInfo.applicationsCreate.path,
          name: AppRoutInfo.applicationsCreate.name,
          builder: (BuildContext context, GoRouterState state) => BlocProvider<VendorCreateCubit>(
            create: (BuildContext context) => VendorCreateCubit(
              vendorCreateUsecase: getIt.get(),
              vendorGetTemplateUsecase: getIt.get(),
            ),
            child: const VendorCreatePage(),
          ),
        ),
        GoRoute(
          path: AppRoutInfo.themes.path,
          name: AppRoutInfo.themes.name,
          builder: (BuildContext context, GoRouterState state) => BlocProvider<ThemesCubit>(
            child: const ThemesPage(),
            create: (BuildContext context) =>
                ThemesCubit(getIt.get(), getIt.get(), getIt.get(), state.params[AppRoutInfo.keyAppId]!),
          ),
        ),
        GoRoute(
            path: AppRoutInfo.themesCreate.path,
            name: AppRoutInfo.themesCreate.name,
            builder: (BuildContext context, GoRouterState state) => BlocProvider<ThemesCreateCubit>(
                  create: (BuildContext context) => ThemesCreateCubit(
                    state.params[AppRoutInfo.keyAppId]!,
                    getIt.get(),
                    getIt.get(),
                  ),
                  child: const ThemesCreatePage(),
                )),
        GoRoute(
            path: AppRoutInfo.themesEdit.path,
            name: AppRoutInfo.themesEdit.name,
            builder: (BuildContext context, GoRouterState state) => MultiBlocProvider(
                  providers: [
                    BlocProvider<ThemePropertyCubit>(
                      create: (BuildContext context) => ThemePropertyCubit(),
                    ),
                    BlocProvider<FocusGroupCubit>(
                      create: (BuildContext context) => FocusGroupCubit(),
                    ),
                    BlocProvider<SynchronizeCubit>(
                      create: (BuildContext context) => SynchronizeCubit(
                        updateThemeUseCase: getIt.get(),
                        getThemeUseCase: getIt.get(),
                        getUserUsecase: getIt.get(),
                        applicationId: state.params[AppRoutInfo.keyAppId]!,
                        themeId: state.params[AppRoutInfo.keyThemeId]!,
                      ),
                    ),
                  ],
                  child: const PageThemeEdit(),
                ))
      ],
      redirect: handleMain,
      routerNeglect: false,
      initialLocation: '/',
    );
  }

  FutureOr<String?> handleMain(BuildContext context, GoRouterState state) async {
    return null;
  }
}
