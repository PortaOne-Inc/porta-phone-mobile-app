import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/widgets/widgets.dart';
import 'package:webtrit_configurator/features/themes/widgets/widgets.dart';

class ColorSchemeActionBar extends StatelessWidget {
  const ColorSchemeActionBar({required this.onBack, super.key});

  final void Function() onBack;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return MenuSpace(
      isTopPosition: true,
      background: colorScheme.surfaceDim.withValues(alpha: 0.2),
      children: [
        Expanded(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: IconButton(
                  onPressed: onBack,
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
            ],
          ),
        ),
        Text(
          'Color scheme',
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Dropdown(
                icon: const Icon(Icons.light_mode_outlined),
                constraints: const BoxConstraints(maxWidth: 124),
                items: const ['Light mode', 'Dark mode'],
                onSelect: (int position) {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
