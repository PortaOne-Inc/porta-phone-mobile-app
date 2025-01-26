import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

class AssetCard extends StatelessWidget {
  const AssetCard({
    required this.asset,
    super.key,
  });

  final ThemeAssetModel asset;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 180, height: 120),
      child: Card(
        color: colorScheme.surface,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.web,
            ),
            const SizedBox(height: 8),
            Text(
              asset.name,
              textAlign: TextAlign.center,
              style: textTheme.labelLarge,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              asset.description,
              textAlign: TextAlign.center,
              style: textTheme.labelMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
