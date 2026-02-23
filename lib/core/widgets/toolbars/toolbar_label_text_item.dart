import 'package:flutter/material.dart';

class ToolbarLabelItem extends StatelessWidget {
  const ToolbarLabelItem({
    required this.text,
    this.onTap,
    this.color,
    super.key,
  });

  final void Function()? onTap;
  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = textTheme.titleSmall?.copyWith(
      color: colorScheme.secondary,
      fontWeight: FontWeight.bold,
    );

    return SizedBox(
      height: kToolbarHeight - 8,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(8),
          textStyle: textStyle,
        ),
        onPressed: onTap,
        child: Text(text, style: textStyle, textAlign: TextAlign.center),
      ),
    );
  }
}
