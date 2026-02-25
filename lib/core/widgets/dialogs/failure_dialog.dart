import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'package:webtrit_configurator/localization/localization.dart';

class FailureDialog extends StatelessWidget {
  const FailureDialog({required this.error, this.onRetry, super.key});

  final Object error;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final baseException = error is BaseException ? error as BaseException : null;
    final message = baseException?.message ?? error.toString();
    final statusCode = baseException?.statusCode;

    return AlertDialog(
      title: Text(context.l10n.common_failure_message),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message),
          if (statusCode != null) ...[
            const SizedBox(height: 8),
            Text(
              'HTTP $statusCode',
              style: textTheme.bodySmall?.copyWith(
                color: textTheme.bodySmall?.color?.withValues(alpha: 0.6),
              ),
            ),
          ],
        ],
      ),
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
