import 'package:flutter/material.dart';

class ConfigSection extends StatelessWidget {
  const ConfigSection({
    required this.title,
    required this.fields,
    super.key,
  });

  final String title;
  final List<Widget> fields;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: textTheme.titleMedium),
          const SizedBox(height: 8),
          ...fields,
        ],
      ),
    );
  }
}
