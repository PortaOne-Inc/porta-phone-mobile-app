import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'package:webtrit_configurator/core/env/env.dart';
import 'package:webtrit_configurator/core/l10n/l10n.dart';
import 'package:webtrit_configurator/core/theme/theme.dart';

import 'route/app_route.dart';

class MaterialApplication extends StatelessWidget {
  final GetIt getIt;

  MaterialApplication({
    super.key,
    required this.getIt,
  });

  late final route = AppRoute().build(getIt);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      settings: appThemeSettings,
      lightDynamic: null,
      darkDynamic: null,
      child: Builder(
        builder: (context) => MaterialApp.router(
          title: EnvironmentConfig.APP_NAME,
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
          builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget!),
            minWidth: 450,
            defaultScale: true,
            debugLog: false,
            breakpoints: [
              const ResponsiveBreakpoint.autoScaleDown(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ],
          ),
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'App',
          routeInformationProvider: route.routeInformationProvider,
          routeInformationParser: route.routeInformationParser,
          routerDelegate: route.routerDelegate,
          backButtonDispatcher: route.backButtonDispatcher,
          theme: ThemeProvider.of(context).light(),
          darkTheme: ThemeProvider.of(context).dark(),
        ),
      ),
    );
  }
}
