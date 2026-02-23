import 'package:flutter/material.dart';

class ConfigSection extends StatelessWidget {
  const ConfigSection({
    required this.title,
    required this.fields,
    this.leading,
    this.trailing,
    super.key,
  });

  final String title;
  final List<Widget> fields;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (leading != null) ...[leading!, const SizedBox(width: 8)],
              Expanded(child: Text(title, style: textTheme.titleMedium)),
              if (trailing != null) ...[const SizedBox(width: 8), trailing!],
            ],
          ),
          const SizedBox(height: 8),
          ...fields,
        ],
      ),
    );
  }
}
