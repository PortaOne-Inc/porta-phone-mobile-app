import 'package:flutter/material.dart';

class ItemOfListButton extends StatelessWidget {
  const ItemOfListButton({
    required this.name,
    required this.description,
    required this.onTab,
    super.key,
  });

  final String name;
  final String description;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      color: colorScheme.primary,
      child: InkWell(
        onTap: onTab,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                textAlign: TextAlign.start,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: colorScheme.surface,
                ),
                overflow: TextOverflow.fade,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.start,
                overflow: TextOverflow.fade,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: colorScheme.surface.withValues(alpha: 0.75),
                ),
              ),
              Divider(
                height: 0,
                color: colorScheme.surface.withValues(alpha: 0.5),
              ),
              const SizedBox(height: 8),
              Expanded(
                flex: 0,
                child: Row(
                  children: [
                    Text(
                      'Create',
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.surface,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_right_alt_outlined,
                      color: colorScheme.surface,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
