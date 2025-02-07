import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({
    required this.title,
    required this.children,
    this.titleStyle,
    super.key,
  });

  final String title;
  final List<Widget> children;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              style: titleStyle ?? Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
