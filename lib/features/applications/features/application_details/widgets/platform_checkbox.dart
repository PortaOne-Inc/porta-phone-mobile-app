import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

class PlatformCheckbox extends StatelessWidget {
  const PlatformCheckbox({
    required this.platform,
    required this.deploy,
    required this.onTap,
    super.key,
  });

  final String platform;
  final bool deploy;
  final ObjectCallback<bool> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Card(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                platform,
                style: textTheme.labelLarge,
              ),
              const SizedBox(width: 8),
              Icon(
                deploy ? Icons.check_box : Icons.check_box_outline_blank,
                color: deploy ? colorScheme.primary : colorScheme.onBackground.withOpacity(.5),
              ),
            ],
          ),
        ),
        onTap: () => onTap(!deploy),
      ),
    );
  }
}
