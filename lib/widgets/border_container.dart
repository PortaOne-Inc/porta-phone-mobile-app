import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    this.title,
    super.key,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(8),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.borderColor = const Color.fromARGB(255, 51, 204, 255),
    this.borderWidth = 1,
    this.titleTextColor,
    this.titleFontSize,
    this.child,
    this.trailing,
    this.description,
    this.descriptionWidget,
    this.showDividerBetweenHeaderAndBody = true,
  });

  final String? title;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final Color borderColor;
  final double borderWidth;
  final Color? titleTextColor;
  final double? titleFontSize;
  final Widget? child;
  final Widget? trailing;

  final String? description;
  final Widget? descriptionWidget;
  final bool showDividerBetweenHeaderAndBody;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final titleStyle = textTheme.labelLarge?.copyWith(
      color: titleTextColor,
      fontSize: titleFontSize,
    );

    Widget? resolvedDescription;
    if (descriptionWidget != null) {
      resolvedDescription = descriptionWidget;
    } else if (description != null && description!.isNotEmpty) {
      resolvedDescription = Text(
        description!,
        style: textTheme.bodySmall?.copyWith(
          color: textTheme.bodySmall?.color?.withValues(alpha: 0.75),
        ),
      );
    }

    return Container(
      margin: margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Expanded(
                  child: Text(
                    title!,
                    style: titleStyle ?? textTheme.labelLarge,
                  ),
                ),
              if (trailing != null) trailing!,
            ],
          ),
          if (resolvedDescription != null) ...[
            const SizedBox(height: 6),
            resolvedDescription,
          ],
          if (showDividerBetweenHeaderAndBody) const SizedBox(height: 8),
          Container(
            padding: padding,
            decoration: BoxDecoration(
              border: Border.all(
                color: colorScheme.surfaceContainerHighest,
                width: borderWidth,
              ),
              borderRadius: borderRadius,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
