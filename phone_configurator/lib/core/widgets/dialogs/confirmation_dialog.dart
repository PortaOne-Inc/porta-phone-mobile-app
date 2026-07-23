import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    required this.title,
    required this.description,
    required this.onConfirm,
    required this.onDecline,
    this.confirmText = 'Yes',
    this.declineText = 'No',
    super.key,
  });

  final VoidCallback onConfirm;
  final VoidCallback onDecline;

  final String title;
  final String description;
  final String confirmText;
  final String declineText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return AlertDialog(
      title: Text(title, style: textTheme.titleLarge),
      content: Text(
        description,
        style: textTheme.bodyMedium,
        textAlign: TextAlign.start,
      ),
      actions: [
        TextButton(
          onPressed: onDecline,
          child: Text(
            declineText,
            style: textTheme.labelLarge?.copyWith(color: colorScheme.primary),
          ),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text(
            confirmText,
            style: textTheme.labelLarge?.copyWith(color: colorScheme.error),
          ),
        ),
      ],
    );
  }
}
