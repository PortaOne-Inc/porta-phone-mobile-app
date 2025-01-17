import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    super.key,
    required this.title,
    this.margin = const EdgeInsets.all(20),
    this.padding = EdgeInsets.zero,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.borderColor = const Color.fromARGB(255, 51, 204, 255),
    this.borderWidth = 1,
    this.titleTextColor = Colors.black,
    this.titleFontSize = 12,
    this.child,
  });

  final String title;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final Color borderColor;
  final double borderWidth;
  final Color titleTextColor;
  final double titleFontSize;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.titleMedium),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: colorScheme.surfaceContainerHighest),
            borderRadius: borderRadius,
          ),
          child: child,
        )
      ],
    );
  }
}
