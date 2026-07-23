// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';

import 'package:domain/domain.dart';
import 'package:webtrit_configurator/core/core.dart';

class ApplicationDetailsScreen extends StatelessWidget {
  const ApplicationDetailsScreen({
    required this.application,
    required this.onOpenDefaultTheme,
    required this.onDeploy,
    required this.onEnvironment,
    required this.onAssets,
    required this.onEmbeds,
    required this.onPublicationResources,
    required this.onCapabilities,
    super.key,
  });

  final ApplicationModel? application;

  final void Function(String applicationId, String themeId) onOpenDefaultTheme;
  final VoidCallback onCapabilities;
  final VoidCallback onEnvironment;
  final VoidCallback onDeploy;
  final VoidCallback onPublicationResources;
  final VoidCallback onAssets;
  final VoidCallback onEmbeds;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return LayoutBuilder(
      builder: (context, constrains) {
        return ListView(
          children: [
            ListTile(
              title: Text('Project id:', style: textTheme.titleSmall),
              subtitle: SelectableText(application?.id ?? ''),
              minLeadingWidth: 4,
              leading: Container(
                width: 8,
                color: colorScheme.primary.withValues(alpha: 0.2),
              ),
            ),
            ListTile(
              title: Text('Default theme:', style: textTheme.titleSmall),
              trailing: InkWell(
                child: Visibility(
                  visible: application?.theme != null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Open',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.open_in_new_outlined,
                        color: colorScheme.primary,
                      ),
                    ],
                  ),
                ),
                onTap: () =>
                    onOpenDefaultTheme(application!.id!, application!.theme!),
              ),
              subtitle: application?.theme != null
                  ? SelectableText(application?.theme ?? '')
                  : Text(
                      'Not selected default theme yet',
                      style: textTheme.bodySmall,
                    ),
              minLeadingWidth: 4,
              leading: Container(
                width: 8,
                color: colorScheme.primary.withValues(alpha: 0.2),
              ),
            ),
            Divider(thickness: 4, color: colorScheme.surfaceContainerLow),
            ListTile(
              leading: Icon(Icons.publish, color: colorScheme.surfaceTint),
              title: Text(
                'Deploy applications',
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.surfaceTint,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Deploy applications to the Play Store and App Store.',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.surfaceTint,
                ),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: colorScheme.surfaceTint,
              ),
              onTap: onDeploy,
            ),
            Divider(thickness: 4, color: colorScheme.surfaceContainerLow),
            ListTile(
              leading: Icon(
                Icons.line_weight_rounded,
                color: colorScheme.primary,
              ),
              title: Text(
                'Dart define build Environment',
                style: textTheme.titleMedium,
              ),
              subtitle: Text(
                'Set up and configure build environments.',
                style: textTheme.bodySmall,
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: onEnvironment,
            ),
            ListTile(
              leading: Icon(
                Icons.image_search_outlined,
                color: colorScheme.primary,
              ),
              title: Text('Assets', style: textTheme.titleMedium),
              subtitle: Text(
                'List of application assets (icons, splash screens, etc.)',
                style: textTheme.bodySmall,
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: onAssets,
            ),
            ListTile(
              leading: Icon(Icons.link, color: colorScheme.primary),
              title: Text('Embeds', style: textTheme.titleMedium),
              subtitle: Text(
                'List of application embeds (third-party integrations, etc.)',
                style: textTheme.bodySmall,
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: onEmbeds,
            ),
            ListTile(
              leading: Icon(Icons.new_releases, color: colorScheme.primary),
              title: Text(
                'Publication resources',
                style: textTheme.titleMedium,
              ),
              subtitle: Text(
                'Resources for help release builds',
                style: textTheme.bodySmall,
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: onPublicationResources,
            ),
            ListTile(
              enabled: false,
              leading: Icon(
                Icons.settings_input_component,
                color: colorScheme.primary,
              ),
              title: Text('App Capabilities', style: textTheme.titleMedium),
              subtitle: Text(
                'Select and configure the capabilities your application will use.',
                style: textTheme.bodySmall,
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: onCapabilities,
            ),
            ListTile(
              enabled: false,
              leading: Icon(
                Icons.record_voice_over_rounded,
                color: colorScheme.primary,
              ),
              title: Text('Media Settings', style: textTheme.titleMedium),
              subtitle: Text(
                'Select codec and configure the media settings.',
                style: textTheme.bodySmall,
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: onCapabilities,
            ),
          ],
        );
      },
    );
  }
}
