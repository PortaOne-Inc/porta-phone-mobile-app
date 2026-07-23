import 'package:flutter/material.dart';

import 'package:data/common/typedefs.dart';
import 'package:webtrit_configurator/extensions/color_extension.dart';

class ColorInput extends StatelessWidget {
  const ColorInput({
    required this.label,
    required this.color,
    required this.onTap,
    required this.onClear,
    super.key,
  });

  final String label;
  final Color? color;
  final VoidCallback onTap;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          isDense: true,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: color,
                border: Border.all(
                  color: colorScheme.outline.withValues(alpha: 0.5),
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: color == null
                  ? Icon(
                      Icons.format_color_reset,
                      size: 16,
                      color: theme.hintColor,
                    )
                  : null,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                color?.toHex() ?? 'Default',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: color == null
                      ? theme.hintColor
                      : colorScheme.onSurface,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (color != null)
              InkWell(
                onTap: onClear,
                borderRadius: BorderRadius.circular(16),
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
