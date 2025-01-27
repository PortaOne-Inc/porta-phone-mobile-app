// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/localization/localization.dart';

import '../../../model/models.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';
import '../extensions/extensions.dart';

class ApplicationDetailsScreen extends StatelessWidget {
  const ApplicationDetailsScreen({
    required this.application,
    required this.applicationDeploy,
    required this.applicationValidateErrors,
    required this.onOpenDefaultTheme,
    required this.onUpdateApplicationDeploy,
    required this.onDeploy,
    required this.onUpdateBuildNameVersion,
    required this.onUpdateBuildNumberVersion,
    required this.applicationBuildVersionProgress,
    super.key,
  });

  final ApplicationModel? application;
  final ApplicationDeploy applicationDeploy;
  final List<ApplicationValidateError> applicationValidateErrors;
  final ApplicationBuildVersionProgress applicationBuildVersionProgress;

  final void Function(String applicationId, String themeId) onOpenDefaultTheme;
  final ObjectCallback<ApplicationDeploy> onUpdateApplicationDeploy;
  final VoidCallback onDeploy;

  final ObjectCallbackPair<BuildPlatform, VersionPart> onUpdateBuildNameVersion;
  final ObjectCallback<BuildPlatform> onUpdateBuildNumberVersion;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final applicationValidateErrorMessages = applicationValidateErrors.map((it) => it.l10n(context));

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
                title: const Text('Application core: '),
                subtitle: SelectableText(application?.coreUrl ?? 'Not defined'),
                minLeadingWidth: 4,
                leading: Container(
                  width: 8,
                  color: colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              ListTile(
                title: const Text('Contact email: '),
                subtitle: SelectableText(application?.contactEmail ?? 'Not defined'),
                minLeadingWidth: 4,
                leading: Container(
                  width: 8,
                  color: colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              ListTile(
                title: const Text('Terms and conditions: '),
                subtitle: SelectableText(application?.termsConditionsUrl ?? 'Not defined'),
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
                  onTap: () => onOpenDefaultTheme(application!.id!, application!.theme!),
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
            ],
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
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.history, color: colorScheme.primary),
            title: const Text(
              'Versioning',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            subtitle: const Text(
              'Manage application versioning .',
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.local_fire_department, color: colorScheme.primary),
            title: const Text(
              'Deployment',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            subtitle: const Text(
              'Manage deployment process .',
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => {},
          ),
          // Builds configuration section
          Section(
            title: context.l10n.feature_application_details_ApplicationDetailsScreen_builds_configuration,
            children: [
              ListTile(
                title: Text(context.l10n.feature_application_details_ApplicationDetailsScreen_android_platform_id),
                subtitle: SelectableText(application?.androidPlatformId ?? ''),
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
                title: Text(context.l10n.feature_application_details_ApplicationDetailsScreen_ios_platform_id),
                subtitle: SelectableText(application?.iosPlatformId ?? ''),
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
                title: const Text('App version'),
                subtitle: SelectableText(application?.appVersion?.buildName ?? 'Latest build version data is missing.'),
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
                title: Text(context.l10n.feature_application_details_ApplicationDetailsScreen_android_build_name),
                subtitle: SelectableText(application?.androidVersion?.buildName ?? ''),
                minLeadingWidth: 4,
                trailing: Builder(
                  builder: (context) {
                    const platform = BuildPlatform.android;
                    final isUpdating = applicationBuildVersionProgress.isNameProgress(platform);

                    return UpdaterChooserButton(
                      progress: isUpdating,
                      onPressed: (it) => onUpdateBuildNameVersion(platform, VersionPart.values.byName(it)),
                      initial: VersionPart.patch.name,
                      items: VersionPart.values.map((it) => it.name).toList(),
                    );
                  },
                ),
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
                title: Text(context.l10n.feature_application_details_ApplicationDetailsScreen_android_build_number),
                subtitle: SelectableText(application?.androidVersion?.buildNumber?.toString() ?? ''),
                minLeadingWidth: 4,
                trailing: Builder(
                  builder: (context) {
                    const platform = BuildPlatform.android;
                    final isUpdating = applicationBuildVersionProgress.isNumberProgress(platform);

                    return UpdaterButton(
                      progress: isUpdating,
                      onPressed: () => onUpdateBuildNumberVersion(platform),
                    );
                  },
                ),
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
                title: Text(context.l10n.feature_application_details_ApplicationDetailsScreen_ios_build_name),
                subtitle: SelectableText(application?.iosVersion?.buildName ?? ''),
                minLeadingWidth: 4,
                trailing: Builder(
                  builder: (context) {
                    const platform = BuildPlatform.ios;
                    final isUpdating = applicationBuildVersionProgress.isNameProgress(platform);

                    return UpdaterChooserButton(
                      progress: isUpdating,
                      onPressed: (it) => onUpdateBuildNameVersion(platform, VersionPart.values.byName(it)),
                      initial: VersionPart.patch.name,
                      items: VersionPart.values.map((it) => it.name).toList(),
                    );
                  },
                ),
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
                title: Text(context.l10n.feature_application_details_ApplicationDetailsScreen_ios_build_number),
                subtitle: SelectableText(application?.iosVersion?.buildNumber?.toString() ?? ''),
                minLeadingWidth: 4,
                trailing: Builder(
                  builder: (context) {
                    const platform = BuildPlatform.ios;
                    final isUpdating = applicationBuildVersionProgress.isNumberProgress(platform);

                    return UpdaterButton(
                      progress: isUpdating,
                      onPressed: () => onUpdateBuildNumberVersion(platform),
                    );
                  },
                ),
                leading: Container(
                  width: 8,
                  color: colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              Divider(
                thickness: 4,
                color: colorScheme.surfaceContainerLow,
              ),
            ],
          ),
          // Deployment Section
          Section(
            title: context.l10n.feature_application_details_ApplicationDetailsScreen_deployment,
            children: [
              if (applicationValidateErrorMessages.isNotEmpty)
                ValidationLabel(messages: applicationValidateErrorMessages),
              Divider(
                thickness: 4,
                color: colorScheme.surfaceContainerLow,
              ),
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
                    collapsedBackgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: .05),
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
              Divider(
                thickness: 4,
                color: colorScheme.surfaceContainerLow,
              ),
              CheckboxListTile(
                value: applicationDeploy.demo,
                onChanged: (demo) {
                  onUpdateApplicationDeploy(applicationDeploy.copyWith(demo: demo!));
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
              Divider(
                thickness: 4,
                color: colorScheme.surfaceContainerLow,
              ),
              BranchSelector(
                title: context.l10n.feature_application_details_ApplicationDetailsScreen_select_branch_for_phone,
                titleStyle: Theme.of(context).textTheme.titleMedium,
                initialBranch: applicationDeploy.applicationDependencyBranches.phoneSourceBranch,
                branches: applicationDeploy.applicationDependencyBranches.phoneBranches.map((it) => it.name).toList(),
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
                  collapsedBackgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: .05),
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
                  title: context.l10n.feature_application_details_ApplicationDetailsScreen_deploy,
                  onPressed: applicationDeploy.anyDeployPlatformAvailable && applicationValidateErrorMessages.isEmpty
                      ? onDeploy
                      : null,
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}

