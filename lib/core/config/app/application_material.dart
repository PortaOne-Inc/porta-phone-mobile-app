import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:webtrit_configurator/core/config/di/di.dart';

import '../../providers/providers.dart';
import '../../theme/theme.dart';
import '../l10n/l10n.dart';
import 'route/app_route.dart';

class MaterialApplication extends StatelessWidget {
  const MaterialApplication({super.key});

  @override
  Widget build(BuildContext context) {
    final route = AppRoute().build(InjectionProvider.of(context).getIt);
    return ProviderTheme(
      settings: appThemeSettings,
      lightDynamic: null,
      darkDynamic: null,
      child: Builder(
        builder: (context) => MaterialApp.router(
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
          builder: (context, widget) => ResponsiveWrapper.builder(BouncingScrollWrapper.builder(context, widget!),
              minWidth: 450,
              defaultScale: true,
              debugLog: false,
              breakpoints: [
                const ResponsiveBreakpoint.autoScaleDown(800, name: TABLET),
                const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ],
              background: Container(color: const Color(0xFFF5F5F5))),
          debugShowCheckedModeBanner: false,
          routeInformationProvider: route.routeInformationProvider,
          routeInformationParser: route.routeInformationParser,
          routerDelegate: route.routerDelegate,
          backButtonDispatcher: route.backButtonDispatcher,
          theme: ProviderTheme.of(context).light(),
          darkTheme: ProviderTheme.of(context).dark(),
        ),
      ),
    );
  }
}
