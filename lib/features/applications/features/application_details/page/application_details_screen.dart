// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';

import '../widgets/widgets.dart';

class ApplicationDetailsScreen extends StatelessWidget {
  const ApplicationDetailsScreen({
    required this.application,
    required this.onOpenDefaultTheme,
    required this.onDeploy,
    required this.onEnvironment,
    super.key,
  });

  final ApplicationModel? application;

  final void Function(String applicationId, String themeId) onOpenDefaultTheme;
  final VoidCallback onEnvironment;
  final VoidCallback onDeploy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final colorScheme = theme.colorScheme;

    return LayoutBuilder(builder: (context, constrains) {
      return ListView(
        children: [
          Section(
            title: 'Configuration',
            children: [
              ListTile(
                title: const Text('Project name:'),
                subtitle: SelectableText(application?.name ?? ''),
                minLeadingWidth: 4,
                leading: Container(
                  width: 8,
                  color: colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              ListTile(
                title: const Text('Project id:'),
                subtitle: SelectableText(application?.id ?? ''),
                minLeadingWidth: 4,
                leading: Container(
                  width: 8,
                  color: colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              ListTile(
                title: const Text('Default theme:'),
                trailing: InkWell(
                  child: Visibility(
                    visible: application?.theme != null,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Open'),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(Icons.open_in_new_outlined),
                      ],
                    ),
                  ),
                  onTap: () => onOpenDefaultTheme(
                    application!.id!,
                    application!.theme!,
                  ),
                ),
                subtitle: application?.theme != null
                    ? SelectableText(application?.theme ?? '')
                    : const Text('Not selected default theme yet'),
                minLeadingWidth: 4,
                leading: Container(
                  width: 8,
                  color: colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              ListTile(
                title: const Text('Application core: '),
                subtitle: SelectableText(application?.coreUrl ?? 'Not defined'),
                minLeadingWidth: 4,
                leading: Container(
                  width: 8,
                  color: colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              Divider(
                thickness: 4,
                color: colorScheme.surfaceContainerLow,
              ),
              ListTile(
                leading: Icon(Icons.line_weight_rounded, color: colorScheme.primary),
                title: const Text(
                  'Dart define build Environment',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle: const Text(
                  'Set up and configure build environments .',
                ),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: onEnvironment,
              ),
              ListTile(
                leading: Icon(Icons.new_releases, color: colorScheme.primary),
                title: const Text(
                  'Publication resources',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle: const Text(
                  'Resources for help release builds',
                ),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: onDeploy,
              ),
              ListTile(
                leading: Icon(Icons.publish, color: colorScheme.primary),
                title: const Text(
                  'Deploy applications',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle: const Text(
                  'Deploy applications to the Play Store and App Store.',
                ),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: onDeploy,
              ),
            ],
          ),
        ],
      );
    });
  }
}
