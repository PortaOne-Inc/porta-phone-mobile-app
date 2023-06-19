import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'package:webtrit_configurator/core/env/env.dart';
import 'package:webtrit_configurator/core/l10n/l10n.dart';
import 'package:webtrit_configurator/core/theme/theme.dart';

import 'route/app_route.dart';

class MaterialApplication extends StatefulWidget {
  final GetIt getIt;

  const MaterialApplication({
    super.key,
    required this.getIt,
  });

  @override
  State<MaterialApplication> createState() => _MaterialApplicationState();
}

class _MaterialApplicationState extends State<MaterialApplication> {
  late final route = AppRoute().build(widget.getIt, context);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => MaterialApp.router(
        title: EnvironmentConfig.APP_NAME,
        theme: FlexThemeData.light(scheme: FlexScheme.sakura),
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.sakura),
        themeMode: ThemeMode.dark,
        localizationsDelegates: const [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('ar', ''), // Spanish, no country code
        ],
        builder: (context, widget) => ResponsiveBreakpoints.builder(
          child: BouncingScrollWrapper.builder(context, widget!),
          debugLog: false,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K')
          ],
        ),
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'App',
        routeInformationProvider: route.routeInformationProvider,
        routeInformationParser: route.routeInformationParser,
        routerDelegate: route.routerDelegate,
        backButtonDispatcher: route.backButtonDispatcher,
      ),
    );
  }
}
