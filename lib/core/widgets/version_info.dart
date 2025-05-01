import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:webtrit_configurator/core/core.dart';

class VersionInfo extends StatelessWidget {
  const VersionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      color: colorScheme.primaryFixedDim.withValues(alpha: 0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Text(
          'v. ${context.read<PackageInfo>().version} - ALPHA',
          style: textTheme.labelSmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
