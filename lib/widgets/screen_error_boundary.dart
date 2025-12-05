import 'package:flutter/material.dart';

class ErrorScreenPlaceholder extends StatelessWidget {
  const ErrorScreenPlaceholder({required this.details, super.key});

  final FlutterErrorDetails details;

  String _getSmartErrorMessage(FlutterErrorDetails details) {
    var text = details.exception.toString();

    if (text.contains('RenderFlex overflowed')) {
      return 'UI Overflow Error: Not enough space';
    }

    final lengthPattern = RegExp(r'items\.length\s*>=\s*(\d+)');
    final match = lengthPattern.firstMatch(text);

    if (match != null) {
      final number = match.group(1);
      return 'Configuration Error: Menu must have at least $number items.';
    }

    text = text.replaceAll(RegExp(r'file:\/\/[^\s]+'), '');

    text = text.replaceAll('Assertion failed:', '');
    text = text.replaceAll('is not true', '');

    text = text.trim();

    if (text.startsWith(':')) {
      text = text.substring(1).trim();
    }

    if (text.isEmpty) {
      return 'Internal Check Failed';
    }

    if (text.length > 100) {
      return '${text.substring(0, 100)}...';
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final errorMessage = _getSmartErrorMessage(details);

    return Container(
      color: theme.colorScheme.surfaceContainerHighest,
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.broken_image_rounded, size: 32, color: theme.colorScheme.error),
          const SizedBox(height: 8),
          Text(
            'Preview Unavailable',
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.error,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Tooltip(
            message: details.exception.toString(),
            child: Text(
              errorMessage,
              style: theme.textTheme.bodySmall?.copyWith(fontFamily: 'monospace'),
              textAlign: TextAlign.center,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
