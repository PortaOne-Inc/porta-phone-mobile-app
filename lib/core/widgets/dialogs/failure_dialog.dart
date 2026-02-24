import 'package:flutter/material.dart';

import 'package:webtrit_configurator/localization/localization.dart';

class FailureDialog extends StatelessWidget {
  const FailureDialog({required this.message, this.onRetry, super.key});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.common_failure_message),
      content: Text(message),
      actions: [
        if (onRetry != null)
          TextButton(
            onPressed: () {
              Navigator.maybePop(context);
              onRetry!();
            },
            child: const Text('Retry'),
          ),
        ElevatedButton(
          child: Text(context.l10n.common_text_ok),
          onPressed: () => Navigator.maybePop(context),
        ),
      ],
    );
  }
}
