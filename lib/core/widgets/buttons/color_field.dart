import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:webtrit_configurator/core/core.dart';

class ColorField extends StatelessWidget {
  const ColorField({
    required this.title,
    required this.constraints,
    this.color = Colors.white,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    super.key,
  });

  final String title;
  final Color? color;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BoxConstraints constraints;
  final void Function(Color color)? onTap;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Colors.white;
    final inverseColor = _textForBackground(effectiveColor);

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final colorText = color != null ? inverseColor : colorScheme.onSurface;

    return GestureDetector(
      onTap: () => onTap?.call(effectiveColor),
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: margin,
        elevation: 1,
        child: ConstrainedBox(
          constraints: constraints,
          child: ColoredBox(
            color: effectiveColor,
            child: Padding(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: textTheme.labelLarge?.copyWith(
                      color: colorText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        color != null ? effectiveColor.toHex() : 'Not defined.',
                        style: textTheme.labelMedium?.copyWith(color: colorText),
                      ),
                      if (color != null)
                        IconButton(
                          icon: Icon(Icons.copy, size: 16, color: colorText),
                          tooltip: 'Copy color',
                          onPressed: () {
                            final hexValue = effectiveColor.toHex();
                            Clipboard.setData(ClipboardData(text: hexValue));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Copied "$hexValue" to clipboard')),
                            );
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Utility function to determine text color based on background brightness.
  Color _textForBackground(Color backgroundColor) {
    final brightness = backgroundColor.computeLuminance();
    return brightness > 0.5 ? Colors.black : Colors.white;
  }
}
