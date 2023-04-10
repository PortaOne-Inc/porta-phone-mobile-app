import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/l10n/l10n.dart';

class FailureDialog extends StatelessWidget {
  const FailureDialog({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.common_failure_message),
      content: Text(message),
      actions: [
        ElevatedButton(
          child: Text(context.l10n.common_text_ok),
          onPressed: () => Navigator.maybePop(context),
        ),
      ],
    );
  }
}
