import 'package:flutter/material.dart';

class ToolbarLabelItem extends StatelessWidget {
  const ToolbarLabelItem({
    super.key,
    required this.text,
    this.onTap,
    this.color,
  });

  final Function()? onTap;
  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight-8,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.all(8),
            textStyle: Theme.of(context).textTheme.titleSmall),
        onPressed: onTap,
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
