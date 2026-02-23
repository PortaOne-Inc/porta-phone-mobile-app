import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/app/route/route.dart';
import 'package:webtrit_configurator/localization/localization.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.2,
          ),
          child: Padding(
            padding: const EdgeInsets.all(64),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  context.l10n.common_not_fount_title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 32),
                Text(
                  context.l10n.common_not_fount_description,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                TextButton(
                  onPressed: () =>
                      GoRouter.of(context).goNamed(AppRoutInfo.login.name),
                  child: Text(context.l10n.common_not_fount_go_home),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
