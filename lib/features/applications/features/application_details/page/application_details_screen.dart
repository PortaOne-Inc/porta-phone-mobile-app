// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/localization/localization.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class ApplicationDetailsScreen extends StatelessWidget {
  const ApplicationDetailsScreen({
    required this.application,
    required this.applicationDeploy,
    required this.onOpenDefaultTheme,
    required this.onUpdateApplicationDeploy,
    required this.onDeploy,
    super.key,
  });

  final ApplicationModel? application;
  final ApplicationDeploy applicationDeploy;

  final void Function(String applicationId, String themeId) onOpenDefaultTheme;
  final ObjectCallback<ApplicationDeploy> onUpdateApplicationDeploy;
  final VoidCallback onDeploy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return LayoutBuilder(builder: (context, constrains) {
      return ListView(
        children: [
          // Configuration Section
          Section(
            title: 'Configuration',
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
                subtitle: SelectableText(application?.id ?? ''),
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
                title: const Text('Android platform ID: '),
                subtitle: SelectableText(application?.androidPlatformId ?? ''),
                minLeadingWidth: 4,
                leading: Container(
                  width: 8,
                  color: colorScheme.primary.withOpacity(0.2),
                ),
              ),
              ListTile(
                title: const Text('iOS platform ID: '),
                subtitle: SelectableText(application?.iosPlatformId ?? ''),
                minLeadingWidth: 4,
                leading: Container(
                  width: 8,
                  color: colorScheme.primary.withOpacity(0.2),
                ),
              ),
              ListTile(
                title: const Text('Android build name: '),
                subtitle: SelectableText(application?.androidVersion?.buildName ?? ''),
                minLeadingWidth: 4,
                leading: Container(
                  width: 8,
                  color: colorScheme.primary.withOpacity(0.2),
                ),
              ),
              ListTile(
                title: const Text('Android build number: '),
                subtitle: SelectableText(application?.androidVersion?.buildNumber?.toString() ?? ''),
                minLeadingWidth: 4,
                leading: Container(
                  width: 8,
                  color: colorScheme.primary.withOpacity(0.2),
                ),
              ),
              ListTile(
                title: const Text('iOS build name: '),
                subtitle: SelectableText(application?.iosVersion?.buildName ?? ''),
                minLeadingWidth: 4,
                leading: Container(
                  width: 8,
                  color: colorScheme.primary.withOpacity(0.2),
                ),
              ),
              ListTile(
                title: const Text('iOS build number: '),
                subtitle: SelectableText(application?.iosVersion?.buildNumber?.toString() ?? ''),
                minLeadingWidth: 4,
                leading: Container(
                  width: 8,
                  color: colorScheme.primary.withOpacity(0.2),
                ),
              ),
              ListTile(
                title: const Text('Application core: '),
                subtitle: SelectableText(application?.coreUrl ?? 'Not defined'),
                minLeadingWidth: 4,
                leading: Container(
                  width: 8,
                  color: colorScheme.primary.withOpacity(0.2),
                ),
              ),
              ListTile(
                title: const Text('Terms and conditions: '),
                subtitle: SelectableText(application?.termsConditionsUrl ?? 'Not defined'),
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
                      : const Text('Google services have not been uploaded'),
                ),
                minLeadingWidth: 4,
                leading: Container(
                  width: 8,
                  color: colorScheme.primary.withOpacity(0.2),
                ),
              ),
            ],
          ),
          // Deployment Section
          Section(
            title: context.l10n.feature_application_details_ApplicationDetailsScreen_deployment,
            children: [
              const Divider(),
              ListTile(
                title: Text(
                  context.l10n.feature_application_details_ApplicationDetailsScreen_platforms,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Wrap(spacing: 8, runSpacing: 16, children: [
                  PlatformCheckbox(
                    platform: applicationDeploy.android.key,
                    deploy: applicationDeploy.android.deploy,
                    onTap: (deploy) => onUpdateApplicationDeploy(applicationDeploy.copyWith(
                      android: applicationDeploy.android.copyWith(deploy: deploy),
                    )),
                  ),
                  PlatformCheckbox(
                    platform: applicationDeploy.ios.key,
                    deploy: applicationDeploy.ios.deploy,
                    onTap: (deploy) => onUpdateApplicationDeploy(applicationDeploy.copyWith(
                      ios: applicationDeploy.ios.copyWith(deploy: deploy),
                    )),
                  ),
                ]),
              ),
              if (applicationDeploy.isAndroidPlatformSelected)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ExpansionTile(
                    title:
                        Text(context.l10n.feature_application_details_ApplicationDetailsScreen_android_configuration),
                    childrenPadding: const EdgeInsets.symmetric(vertical: 16),
                    tilePadding: const EdgeInsets.only(left: 16, right: 8),
                    collapsedBackgroundColor: Theme.of(context).colorScheme.primary.withOpacity(.05),
                    children: <Widget>[
                      PlayStoreConfigForm(
                        track: applicationDeploy.android.playStoreConfig.track,
                        availableTrack: applicationDeploy.android.playStoreConfig.availableTracks,
                        status: applicationDeploy.android.playStoreConfig.status,
                        availableStatuses: applicationDeploy.android.playStoreConfig.availableStatuses,
                        updatePriority: applicationDeploy.android.playStoreConfig.updatePriority,
                        userFraction: applicationDeploy.android.playStoreConfig.userFraction,
                        userFractionAvailability: applicationDeploy.android.playStoreConfig.isUserFractionAvailable,
                        onChangedTrack: (String value) {
                          final config = applicationDeploy.android.playStoreConfig.copyWith(track: value);
                          final platform = applicationDeploy.copyWithAndroidPlayStoreConfig(config);
                          onUpdateApplicationDeploy(platform);
                        },
                        onChangedStatus: (String value) {
                          final config = applicationDeploy.android.playStoreConfig.copyWith(status: value);
                          final platform = applicationDeploy.copyWithAndroidPlayStoreConfig(config);
                          onUpdateApplicationDeploy(platform);
                        },
                        onChangedUpdatePriority: (int value) {
                          final config = applicationDeploy.android.playStoreConfig.copyWith(updatePriority: value);
                          final platform = applicationDeploy.copyWithAndroidPlayStoreConfig(config);
                          onUpdateApplicationDeploy(platform);
                        },
                        onChangedUserFraction: (double value) {
                          final config = applicationDeploy.android.playStoreConfig.copyWith(userFraction: value);
                          final platform = applicationDeploy.copyWithAndroidPlayStoreConfig(config);
                          onUpdateApplicationDeploy(platform);
                        },
                      ),
                    ],
                  ),
                ),
              const Divider(),
              CheckboxListTile(
                value: applicationDeploy.isBuildDemoFlow,
                onChanged: (demo) {
                  final flow = true == demo ? ApplicationFlow.demo : ApplicationFlow.classic;
                  onUpdateApplicationDeploy(applicationDeploy.copyWith(
                    appFlow: flow,
                  ));
                },
                title: Text(
                  context.l10n.feature_application_details_ApplicationDetailsScreen_demo_flow_title,
                  style: textTheme.titleMedium,
                ),
                subtitle: Text(
                  context.l10n.feature_application_details_ApplicationDetailsScreen_demo_flow_subtitle,
                ),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              const Divider(),
              BranchSelector(
                title: context.l10n.feature_application_details_ApplicationDetailsScreen_select_branch_for_phone,
                titleStyle: Theme.of(context).textTheme.titleMedium,
                initialBranch: applicationDeploy.applicationDependencyBranches.phoneSourceBranch,
                branches: applicationDeploy.applicationDependencyBranches.defaultPhoneBranches,
                onUpdate: (value) => onUpdateApplicationDeploy(
                  applicationDeploy.copyWith(
                    applicationDependencyBranches: applicationDeploy.applicationDependencyBranches.copyWith(
                      phoneSourceBranch: value,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  context.l10n.feature_application_details_ApplicationDetailsScreen_additional_configuration,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: ExpansionTile(
                  title: Text(context.l10n.feature_application_details_ApplicationDetailsScreen_branches),
                  collapsedBackgroundColor: Theme.of(context).colorScheme.primary.withOpacity(.05),
                  children: <Widget>[
                    BranchSelector(
                      title:
                          context.l10n.feature_application_details_ApplicationDetailsScreen_enter_branch_for_callkeep,
                      initialBranch: applicationDeploy.applicationDependencyBranches.callkeepSourceBranch,
                      branches: applicationDeploy.applicationDependencyBranches.defaultCallkeepBranches,
                      onUpdate: (value) => onUpdateApplicationDeploy(
                        applicationDeploy.copyWith(
                          applicationDependencyBranches: applicationDeploy.applicationDependencyBranches.copyWith(
                            callkeepSourceBranch: value,
                          ),
                        ),
                      ),
                    ),
                    BranchSelector(
                      title: context
                          .l10n.feature_application_details_ApplicationDetailsScreen_enter_branch_for_common_dependency,
                      initialBranch: applicationDeploy.applicationDependencyBranches.commonDependencySourceBranch,
                      branches: applicationDeploy.applicationDependencyBranches.defaultCommonDependencyBranches,
                      onUpdate: (value) => onUpdateApplicationDeploy(
                        applicationDeploy.copyWith(
                          applicationDependencyBranches: applicationDeploy.applicationDependencyBranches.copyWith(
                            commonDependencySourceBranch: value,
                          ),
                        ),
                      ),
                    ),
                    BranchSelector(
                      title: context.l10n
                          .feature_application_details_ApplicationDetailsScreen_enter_branch_for_phone_configurator_tool,
                      initialBranch: applicationDeploy.applicationDependencyBranches.phoneConfiguratorToolSourceBranch,
                      branches: applicationDeploy.applicationDependencyBranches.defaultPhoneConfiguratorToolBranches,
                      onUpdate: (value) => onUpdateApplicationDeploy(
                        applicationDeploy.copyWith(
                          applicationDependencyBranches: applicationDeploy.applicationDependencyBranches.copyWith(
                            phoneConfiguratorToolSourceBranch: value,
                          ),
                        ),
                      ),
                    ),
                    BranchSelector(
                      title:
                          context.l10n.feature_application_details_ApplicationDetailsScreen_enter_branch_for_keystore,
                      initialBranch: applicationDeploy.applicationDependencyBranches.keystoreSourceBranch,
                      branches: applicationDeploy.applicationDependencyBranches.defaultKeystoreBranches,
                      onUpdate: (value) => onUpdateApplicationDeploy(
                        applicationDeploy.copyWith(
                          applicationDependencyBranches: applicationDeploy.applicationDependencyBranches.copyWith(
                            keystoreSourceBranch: value,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Button(
                  isEnable: applicationDeploy.anyDeployPlatformAvailable,
                  title: context.l10n.feature_application_details_ApplicationDetailsScreen_deploy,
                  onPressed: onDeploy,
                ),
              ),
            ],
          ),
        ],
      );
    });
  }

  // TODO(dmitry): Move logic of downloading to helper
  void _downloadFile(String url) {
    html.AnchorElement(href: url)
      ..download = url
      ..click();
  }
}

class Section extends StatelessWidget {
  const Section({
    required this.title,
    required this.children,
    super.key,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
