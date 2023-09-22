// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';

class ApplicationDetailsScreen extends StatelessWidget {
  const ApplicationDetailsScreen({
    super.key,
    required this.application,
    required this.onOpenDefaultTheme,
  });

  final ApplicationModel? application;
  final Function(String applicationId, String themeId) onOpenDefaultTheme;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text('Project name:'),
          subtitle: SelectableText(application?.name ?? ''),
          minLeadingWidth: 4,
          leading: Container(
            width: 8,
            color: colorScheme.primary.withOpacity(0.2),
          ),
        ),
        ListTile(
          title: const Text('Project id:'),
          subtitle: SelectableText(
            application?.id ?? '',
          ),
          minLeadingWidth: 4,
          leading: Container(
            width: 8,
            color: colorScheme.primary.withOpacity(0.2),
          ),
        ),
        ListTile(
          title: const Text('Platform identifier: '),
          subtitle: SelectableText(application?.platformIdentifier ?? ''),
          minLeadingWidth: 4,
          leading: Container(
            width: 8,
            color: colorScheme.primary.withOpacity(0.2),
          ),
        ),
        ListTile(
          title: const Text('Application core: '),
          subtitle: SelectableText(application?.coreUrl ?? 'Not define'),
          minLeadingWidth: 4,
          leading: Container(
            width: 8,
            color: colorScheme.primary.withOpacity(0.2),
          ),
        ),
        ListTile(
          title: const Text('Version:'),
          subtitle: SelectableText(application?.version.toString() ?? '0'),
          minLeadingWidth: 4,
          leading: Container(
            width: 8,
            color: colorScheme.primary.withOpacity(0.2),
          ),
        ),
        ListTile(
          title: const Text('Default theme:'),
          trailing: InkWell(
            child: Visibility(
              visible: application?.isApplicationHasDefaultThem ?? false,
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
            onTap: () => onOpenDefaultTheme(application!.id!, application!.theme!),
          ),
          subtitle: application?.isApplicationHasDefaultThem ?? false
              ? SelectableText(application?.theme ?? '')
              : const Text('Not selected default theme yet'),
          minLeadingWidth: 4,
          leading: Container(
            width: 8,
            color: colorScheme.primary.withOpacity(0.2),
          ),
        ),
        ListTile(
          title: const Text('Google services:'),
          subtitle: Container(
            margin: const EdgeInsets.only(top: 8),
            child: application?.isGoogleServicesAvailable ?? false
                ? Row(
                    children: [
                      if (application?.googleServices?.androidUrl != null)
                        GoogleServicesPreview(
                          type: GoogleServicesPreviewType.download,
                          platform: TargetPlatform.android,
                          onTap: () => _downloadFile(application!.googleServices!.androidUrl!),
                        ),
                      const SizedBox(
                        width: 8,
                      ),
                      if (application?.googleServices?.iosUrl != null)
                        GoogleServicesPreview(
                          platform: TargetPlatform.iOS,
                          type: GoogleServicesPreviewType.download,
                          onTap: () => _downloadFile(application!.googleServices!.iosUrl!),
                        )
                    ],
                  )
                : const Text('Google services has not uploaded'),
          ),
          minLeadingWidth: 4,
          leading: Container(
            width: 8,
            color: colorScheme.primary.withOpacity(0.2),
          ),
        ),
      ],
    );
  }

  // TODO: Move logic of downloading to helper
  void _downloadFile(String url) {
    html.AnchorElement anchorElement = html.AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }
}
