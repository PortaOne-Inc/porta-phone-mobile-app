import 'package:flutter/material.dart';

import 'package:webtrit_configurator/localization/localization.dart';

class FailureDialog extends StatelessWidget {
  const FailureDialog({required this.message, super.key});

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
