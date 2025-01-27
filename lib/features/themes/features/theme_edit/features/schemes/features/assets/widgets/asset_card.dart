import 'package:flutter/material.dart';

import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';

final _logger = Logger('AssetCard');

class AssetCard extends StatelessWidget {
  const AssetCard({
    required this.asset,
    this.onTap,
    super.key,
  });

  final ThemeAssetModel asset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 180, height: 180),
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: colorScheme.surface,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              if (asset.url != null) ImageRenderer(resource: UrlResource(asset.url!)),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        colorScheme.surface.withValues(alpha: 0),
                        colorScheme.surface.withValues(alpha: 0.2),
                        colorScheme.surface.withValues(alpha: 0.3),
                        colorScheme.surface.withValues(alpha: 0.6),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 8,
                top: 8,
                child: Icon(
                  asset.inferredType.icon,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isDense: true,
                    items: [
                      DropdownMenuItem(
                        value: 'open_link',
                        child: Text(
                          'Open Link',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) async {
                      if (value == 'open_link') {
                        final uri = Uri.parse(asset.url!);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri, mode: LaunchMode.externalApplication);
                        } else {
                          _logger.warning('Could not launch URL: $uri');
                        }
                      }
                    },
                    icon: const Icon(
                      Icons.more_vert,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
