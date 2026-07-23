import 'package:flutter/material.dart';

import 'package:webtrit_configurator/localization/localization.dart';

class ValidationLabel extends StatelessWidget {
  const ValidationLabel({required this.messages, super.key});

  final Iterable<String> messages;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context
                .l10n
                .feature_application_details_ApplicationDetailsScreen_invalidLabel_deploy_error,
            style: textTheme.titleMedium?.copyWith(color: colorScheme.error),
          ),
          const SizedBox(height: 8),
          ...messages.map(
            (message) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                '- $message',
                style: textTheme.labelLarge?.copyWith(color: colorScheme.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
