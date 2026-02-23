import 'package:flutter/material.dart';

class DescriptionRow extends StatelessWidget {
  const DescriptionRow({required this.icon, required this.text, super.key});

  factory DescriptionRow.info(String text) {
    return DescriptionRow(icon: Icons.info_outline, text: text);
  }

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Theme.of(context).iconTheme.color),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(
                context,
              ).textTheme.bodySmall?.color?.withValues(alpha: 0.75),
            ),
          ),
        ),
      ],
    );
  }
}
