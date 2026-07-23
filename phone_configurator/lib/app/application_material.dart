import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:webtrit_configurator/core/core.dart';

import 'package:webtrit_configurator/features/common/common.dart';

import '../features/auth/bloc/auth_cubit.dart';
import '../localization/localization.dart';

import 'application.dart';
import 'route/app_route.dart';

class MaterialApplication extends StatefulWidget {
  const MaterialApplication({required this.getIt, super.key});

  final GetIt getIt;

  @override
  State<MaterialApplication> createState() => _MaterialApplicationState();
}

class _MaterialApplicationState extends State<MaterialApplication> {
  late final route = AppRoute().build(widget.getIt, context);

  @override
  Widget build(BuildContext context) {
    final themeSettings = widget.getIt.get<ConfiguratorThemeSettings>();

    final responsiveBreakpoints = [
      const Breakpoint(start: 0, end: 450, name: MOBILE),
      const Breakpoint(start: 451, end: 800, name: TABLET),
      const Breakpoint(start: 801, end: 1920, name: DESKTOP),
      const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
    ];

    const localizationsDelegates = [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];

    const supportedLocales = [Locale('en', '')];

    return MultiProvider(
      providers: [
        Provider<PackageInfo>(
          create: (context) => widget.getIt.get<PackageInfo>(),
        ),
      ],
      child: Builder(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              lazy: false,
              create: (BuildContext context) =>
                  CommonBloc(usecaseAuthLogOut: widget.getIt.get()),
            ),
            BlocProvider<AuthCubit>(
              create: (BuildContext context) => AuthCubit(widget.getIt.get()),
            ),
          ],
          child: BlocConsumer<CommonBloc, CommonState>(
            listener: (BuildContext context, CommonState state) {
              if (state is CommonStateLogout) {
                route.go(AppRoutInfo.login.name);
              }
            },
            builder: (BuildContext context, CommonState state) {
              return MaterialApp.router(
                title: ApplicationEnvironment.APP_NAME,
                theme: themeSettings.light(),
                darkTheme: themeSettings.dark(),
                themeMode: state.themeMode,
                localizationsDelegates: localizationsDelegates,
                supportedLocales: supportedLocales,
                debugShowCheckedModeBanner: false,
                restorationScopeId: 'App',
                routeInformationProvider: route.routeInformationProvider,
                routeInformationParser: route.routeInformationParser,
                routerDelegate: route.routerDelegate,
                backButtonDispatcher: route.backButtonDispatcher,
                builder: (context, widget) => ResponsiveBreakpoints.builder(
                  child: BouncingScrollWrapper.builder(context, widget!),
                  breakpoints: responsiveBreakpoints,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
