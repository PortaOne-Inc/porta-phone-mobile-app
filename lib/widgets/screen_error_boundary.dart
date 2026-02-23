import 'package:flutter/material.dart';

class ErrorScreenPlaceholder extends StatelessWidget {
  const ErrorScreenPlaceholder({
    required this.details,
    this.compact = false,
    super.key,
  });

  final FlutterErrorDetails details;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        // Перевіряємо, чи є місце для тексту.
        // Вимагаємо мінімум 100px по висоті та ширині.
        final hasSpaceForText =
            constraints.maxHeight > 100 && constraints.maxWidth > 100;
        final isVerySmall =
            constraints.maxHeight < 40 || constraints.maxWidth < 40;

        if (isVerySmall) {
          return ColoredBox(
            color: theme.colorScheme.errorContainer,
            child: Icon(
              Icons.error_outline,
              size: constraints.maxHeight < 20 ? constraints.maxHeight : 20,
              color: theme.colorScheme.error,
            ),
          );
        }

        return Container(
          color: theme.colorScheme.surfaceContainerHighest,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: ClipRect(
            child: hasSpaceForText
                ? _buildFullError(theme, constraints)
                : _buildCompactError(theme),
          ),
        );
      },
    );
  }

  // --- ВИПРАВЛЕНО ТУТ ---
  // Ми прибрали Tooltip. Тепер це просто іконка.
  Widget _buildCompactError(ThemeData theme) {
    return Center(
      child: Icon(Icons.broken_image_rounded, color: theme.colorScheme.error),
    );
  }

  // ----------------------

  Widget _buildFullError(ThemeData theme, BoxConstraints constraints) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.broken_image_rounded,
            size: 32,
            color: theme.colorScheme.error,
          ),
          const SizedBox(height: 8),
          Text(
            'Preview Error',
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.error,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            _getSmartErrorMessage(details),
            style: theme.textTheme.bodySmall?.copyWith(
              fontFamily: 'monospace',
              fontSize: 10,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  String _getSmartErrorMessage(FlutterErrorDetails details) {
    var text = details.exception.toString();

    if (text.contains('RenderFlex overflowed')) {
      return 'UI Overflow Error';
    }

    if (text.contains('ProviderNotFoundException')) {
      return 'Missing Provider/Bloc';
    }

    // Очищення тексту від зайвого шуму
    text = text.replaceAll(RegExp(r'file:\/\/[^\s]+'), '');
    text = text.replaceAll('Assertion failed:', '');
    text = text.replaceAll('is not true', '');
    text = text.trim();

    if (text.startsWith(':')) {
      text = text.substring(1).trim();
    }

    if (text.length > 100) {
      return '${text.substring(0, 100)}...';
    }

    return text;
  }
}
