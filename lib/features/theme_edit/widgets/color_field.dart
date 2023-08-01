import 'package:flutter/material.dart';

import 'package:webtrit_configurator/share/extension/extension.dart';

class ColorField extends StatelessWidget {
  const ColorField({
    super.key,
    required this.title,
    this.color = Colors.white,
    this.margin = EdgeInsets.zero,
    this.onTap,
  });

  final String title;
  final Color? color;
  final EdgeInsets margin;
  final Function(Color color)? onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: GestureDetector(
        child: Card(
          margin: margin,
          elevation: 1,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          color == null ? '' : color!.toHex(),
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(color: color),
                        ),
                      ],
                    ),
                    const SizedBox(width: 4),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () => onTap?.call(color ?? Colors.white),
      ),
    );
  }
}
