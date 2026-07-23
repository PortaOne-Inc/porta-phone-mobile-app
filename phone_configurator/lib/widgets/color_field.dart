import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/extensions/color_extension.dart';

import 'pattern_painter.dart';

class ColorField extends StatelessWidget {
  const ColorField({
    required this.title,
    this.subtitle,
    this.subtitleWidget,
    this.color,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(4),
    this.constraints,
    this.onTap,
    this.child,
    this.showCopyButton = true,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? subtitleWidget;
  final Color? color;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool showCopyButton;
  final BoxConstraints? constraints;
  final void Function(Color color)? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveColor = color ?? colorScheme.primary.withValues(alpha: 0.5);
    final inverseColor = _getTextColorForBackground(effectiveColor);

    return GestureDetector(
      onTap: () => onTap?.call(effectiveColor),
      child: Card(
        color: color,
        clipBehavior: Clip.antiAlias,
        margin: margin,
        elevation: 1,
        child: ConstrainedBox(
          constraints: constraints ?? const BoxConstraints(),
          child: Stack(
            children: [
              if (color == null)
                Positioned.fill(
                  child: CustomPaint(
                    painter: PatternPainter(primaryColor: effectiveColor),
                  ),
                ),
              Padding(
                padding: padding,
                child: _Content(
                  title: title,
                  subtitle: subtitle,
                  subtitleWidget: subtitleWidget,
                  color: color,
                  effectiveColor: effectiveColor,
                  inverseColor: inverseColor,
                  showCopyButton: showCopyButton,
                  child: child,
                  onCopy: () => _copyColorToClipboard(context, effectiveColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _copyColorToClipboard(BuildContext context, Color color) {
    final hexValue = color.toHex();
    Clipboard.setData(ClipboardData(text: hexValue));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Copied "$hexValue" to clipboard')));
  }

  Color _getTextColorForBackground(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.title,
    required this.effectiveColor,
    required this.inverseColor,
    required this.showCopyButton,
    this.subtitle,
    this.subtitleWidget,
    this.child,
    this.color,
    this.onCopy,
  });

  final String title;
  final String? subtitle;
  final Widget? subtitleWidget;
  final Color? color;
  final Color effectiveColor;
  final Color inverseColor;
  final bool showCopyButton;
  final Widget? child;
  final VoidCallback? onCopy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 1, minHeight: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelMedium?.copyWith(
              color: inverseColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Subtitle
          if (subtitle != null || subtitleWidget != null) ...[
            _buildSubtitle(context, inverseColor),
          ],
          if (showCopyButton) ...[_buildColorDisplay(context, inverseColor)],
          if (child != null) ...[child!],
        ],
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context, Color textColor) {
    if (subtitleWidget != null) {
      return IconTheme.merge(
        data: IconThemeData(color: textColor),
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: textColor.withValues(alpha: 0.9),
            height: 1.2,
          ),
          child: subtitleWidget!,
        ),
      );
    }
    return Text(
      subtitle ?? '',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: textColor.withValues(alpha: 0.9),
        height: 1.2,
      ),
    );
  }

  Widget _buildColorDisplay(BuildContext context, Color textColor) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 4,
      runSpacing: 2,
      children: [
        Text(
          color != null ? effectiveColor.toHex() : 'Not defined.',
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          style: Theme.of(
            context,
          ).textTheme.labelMedium?.copyWith(color: textColor),
        ),
        if (color != null)
          IconButton(
            icon: Icon(Icons.copy, size: 14, color: textColor),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
            visualDensity: VisualDensity.compact,
            onPressed: onCopy,
          ),
      ],
    );
  }
}
