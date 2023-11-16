import 'package:flutter/material.dart';

class PropertyIconTextButton extends StatelessWidget {
  const PropertyIconTextButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: theme.colorScheme.primary),
            ),
            child: Icon(
              icon,
              size: 16,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
