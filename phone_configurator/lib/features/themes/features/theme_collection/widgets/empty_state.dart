import 'package:flutter/material.dart';

import 'package:webtrit_configurator/localization/localization.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          Text(
            context.l10n.feature_application_no_themes,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(color: Colors.deepPurple),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
