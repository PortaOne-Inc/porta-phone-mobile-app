import 'package:flutter/material.dart';

import 'package:webtrit_phone/l10n/app_localizations.g.dart';

import '../../../../../core/core.dart';

class PhoneContext extends StatelessWidget {
  const PhoneContext({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return  Builder(
        builder: (context) => MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          restorationScopeId: 'App',
          theme: ThemeProvider.of(context).light(),
          darkTheme: ThemeProvider.of(context).dark(),
          home: child,
        ),

    );
  }
}
