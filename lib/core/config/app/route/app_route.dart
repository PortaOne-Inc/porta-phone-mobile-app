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
            child: const ApplicationCollectionPage(),
          ),
        ),
        GoRoute(
          path: AppRoutInfo.vendorCreate.path,
          name: AppRoutInfo.vendorCreate.name,
          builder: (BuildContext context, GoRouterState state) => BlocProvider<ApplicationCreateCubit>(
            create: (BuildContext context) => ApplicationCreateCubit(
              vendorCreateUsecase: getIt.get(),
            ),
            child: const ApplicationCreatePage(),
          ),
        ),
        GoRoute(
          path: AppRoutInfo.themes.path,
          name: AppRoutInfo.themes.name,
          builder: (BuildContext context, GoRouterState state) => BlocProvider<ThemeCollectionCubit>(
            child: const ThemeCollectionPage(),
            create: (BuildContext context) => ThemeCollectionCubit(
              applicationId: state.params[AppRoutInfo.keyVendorId]!,
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
                    BlocProvider<FocusGroupCubit>(
                      create: (BuildContext context) => FocusGroupCubit(),
                    ),
                    BlocProvider<SynchronizeCubit>(
                      create: (BuildContext context) => SynchronizeCubit(
                        updateThemeUseCase: getIt.get(),
                        getThemeUseCase: getIt.get(),
                        getUserUsecase: getIt.get(),
                        applicationId: state.params[AppRoutInfo.keyVendorId]!,
                        themeId: state.params[AppRoutInfo.keyThemeId]!,
                      ),
                    ),
                  ],
                  child: const PageThemeEdit(),
                ))
      ],
      redirect: (context, state) => handleMain(context, state, getIt.get<UsecaseAuthIsLoggedIn>()),
      routerNeglect: false,
      initialLocation: AppRoutInfo.vendors.path,
    );
  }

  FutureOr<String?> handleMain(
    BuildContext context,
    GoRouterState state,
    UsecaseAuthIsLoggedIn isLoggedIn,
  ) async {
    final isAuth = await isLoggedIn.execute();

    final currentLocation = state.location;

    if (!isAuth) {
      return AppRoutInfo.login.path;
    } else {
      if (currentLocation == AppRoutInfo.login.path) {
        return AppRoutInfo.vendors.path;
      }
    }

    return null;
  }
}
