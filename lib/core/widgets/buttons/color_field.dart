import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

class ColorField extends StatelessWidget {
  const ColorField({
    required this.title,
    this.color = Colors.white,
    this.margin = EdgeInsets.zero,
    this.onTap,
    super.key,
  });

  final String title;
  final Color? color;
  final EdgeInsets margin;
  final void Function(Color color)? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(color ?? Colors.white),
      child: Card(
        margin: margin,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TitleAndColorText(title: title, color: color),
              _ColorIndicator(color: color),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleAndColorText extends StatelessWidget {
  const _TitleAndColorText({
    required this.title,
    required this.color,
  });

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Text(
          color != null ? color!.toHex() : 'The color is not defined.',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: color != null ? colorScheme.onPrimaryContainer : colorScheme.error,
              ),
        ),
      ],
    );
  }
}

class _ColorIndicator extends StatelessWidget {
  const _ColorIndicator({
    required this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
        border: Border.all(color: color == null ? colorScheme.error : colorScheme.onPrimaryContainer, width: 0.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: color == null
          ? Center(
              child: Icon(
                Icons.info,
                color: colorScheme.error,
                size: 24,
              ),
            )
          : null,
    );
  }
}
