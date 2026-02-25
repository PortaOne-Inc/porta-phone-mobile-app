import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resizable_columns/resizable_columns.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/applications/applications.dart';
import 'package:webtrit_configurator/features/applications/features/application_details/extensions/extensions.dart';
import 'package:webtrit_configurator/features/applications/features/application_details/widgets/widgets.dart';
import 'package:webtrit_configurator/features/common/common.dart';
import 'package:webtrit_configurator/localization/localization.dart';

import '../widgets/widgets.dart';

class DeploymentView extends StatefulWidget {
  const DeploymentView({super.key});

  @override
  State<DeploymentView> createState() => _DeploymentViewState();
}

class _DeploymentViewState extends State<DeploymentView> with MixinMessages {
  DeploymentCubit get deploymentCubit =>
      BlocProvider.of<DeploymentCubit>(context);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocConsumer<DeploymentCubit, DeploymentState>(
      builder: (context, state) {
        final applicationValidateErrorMessages = state.applicationValidateErrors
            .map((it) => it.l10n(context));

        return Scaffold(
          appBar: AppToolbar(
            name: 'Deployment',
            themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
            onThemeChange: (mode) => _onThemeModeChanged(context, mode),
          ),
          body: ResizableColumns(
            dividerColor: colorScheme.surfaceContainerLow,
            dividerThickness: 4,
            children: [
              (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GroupTitleTile(
                            titleData: context
                                .l10n
                                .feature_application_details_ApplicationDetailsScreen_android_build_name,
                            style: textTheme.titleMedium?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            backgroundColor: colorScheme.primary.withValues(
                              alpha: 0.2,
                            ),
                          ),
                          ListTile(
                            title: Text(
                              context
                                  .l10n
                                  .feature_application_details_ApplicationDetailsScreen_android_platform_id,
                            ),
                            subtitle: SelectableText(
                              state.application?.androidPlatformId ?? '',
                            ),
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
                            title: Text(
                              context
                                  .l10n
                                  .feature_application_details_ApplicationDetailsScreen_ios_platform_id,
                            ),
                            subtitle: SelectableText(
                              state.application?.iosPlatformId ?? '',
                            ),
                            minLeadingWidth: 4,
                            leading: Container(
                              width: 8,
                              color: colorScheme.primary.withValues(alpha: 0.2),
                            ),
                          ),
                          GroupTitleTile(
                            titleData: 'Project Versions',
                            style: textTheme.titleMedium?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            backgroundColor: colorScheme.primary.withValues(
                              alpha: 0.2,
                            ),
                          ),
                          ListTile(
                            title: const Text('App version'),
                            subtitle: SelectableText(
                              state.application?.appVersion?.buildName ??
                                  'Latest build version data is missing.',
                            ),
                            minLeadingWidth: 4,
                            leading: Container(
                              width: 8,
                              color: colorScheme.primary.withValues(alpha: 0.2),
                            ),
                          ),
                          GroupTitleTile(
                            titleData: 'Build Versions',
                            style: textTheme.titleMedium?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            backgroundColor: colorScheme.primary.withValues(
                              alpha: 0.2,
                            ),
                          ),
                          ListTile(
                            title: Text(
                              context
                                  .l10n
                                  .feature_application_details_ApplicationDetailsScreen_android_build_name,
                            ),
                            subtitle: SelectableText(
                              state.application?.androidVersion?.buildName ??
                                  '',
                            ),
                            minLeadingWidth: 4,
                            trailing: Builder(
                              builder: (context) {
                                const platform = BuildPlatform.android;
                                final isUpdating = state.buildVersionProgress
                                    .isNameProgress(platform);

                                return UpdaterChooserButton(
                                  progress: isUpdating,
                                  onPressed: (it) =>
                                      deploymentCubit.updateBuildName(
                                        platform,
                                        VersionPart.values.byName(it),
                                      ),
                                  initial: VersionPart.patch.name,
                                  items: VersionPart.values
                                      .map((it) => it.name)
                                      .toList(),
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
                            title: Text(
                              context
                                  .l10n
                                  .feature_application_details_ApplicationDetailsScreen_android_build_number,
                            ),
                            subtitle: SelectableText(
                              state.application?.androidVersion?.buildNumber
                                      ?.toString() ??
                                  '',
                            ),
                            minLeadingWidth: 4,
                            trailing: Builder(
                              builder: (context) {
                                const platform = BuildPlatform.android;
                                final isUpdating = state.buildVersionProgress
                                    .isNumberProgress(platform);

                                return UpdaterButton(
                                  progress: isUpdating,
                                  onPressed: () => deploymentCubit
                                      .updateBuildNumber(platform),
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
                            title: Text(
                              context
                                  .l10n
                                  .feature_application_details_ApplicationDetailsScreen_ios_build_name,
                            ),
                            subtitle: SelectableText(
                              state.application?.iosVersion?.buildName ?? '',
                            ),
                            minLeadingWidth: 4,
                            trailing: Builder(
                              builder: (context) {
                                const platform = BuildPlatform.ios;
                                final isUpdating = state.buildVersionProgress
                                    .isNameProgress(platform);

                                return UpdaterChooserButton(
                                  progress: isUpdating,
                                  onPressed: (it) =>
                                      deploymentCubit.updateBuildName(
                                        platform,
                                        VersionPart.values.byName(it),
                                      ),
                                  initial: VersionPart.patch.name,
                                  items: VersionPart.values
                                      .map((it) => it.name)
                                      .toList(),
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
                            title: Text(
                              context
                                  .l10n
                                  .feature_application_details_ApplicationDetailsScreen_ios_build_number,
                            ),
                            subtitle: SelectableText(
                              state.application?.iosVersion?.buildNumber
                                      ?.toString() ??
                                  '',
                            ),
                            minLeadingWidth: 4,
                            trailing: Builder(
                              builder: (context) {
                                const platform = BuildPlatform.ios;
                                final isUpdating = state.buildVersionProgress
                                    .isNumberProgress(platform);

                                return UpdaterButton(
                                  progress: isUpdating,
                                  onPressed: () => deploymentCubit
                                      .updateBuildNumber(platform),
                                );
                              },
                            ),
                            leading: Container(
                              width: 8,
                              color: colorScheme.primary.withValues(alpha: 0.2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (applicationValidateErrorMessages.isNotEmpty)
                    ValidationLabel(messages: applicationValidateErrorMessages),
                  GroupTitleTile(
                    titleData: 'Publishing',
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    backgroundColor: colorScheme.surfaceTint.withValues(
                      alpha: 0.2,
                    ),
                    trailing: ElevatedButton(
                      onPressed:
                          state.applicationDeploy.anyDeployPlatformAvailable &&
                              applicationValidateErrorMessages.isEmpty
                          ? deploymentCubit.deployBuilds
                          : null,
                      child: const Text('Deploy'),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      context
                          .l10n
                          .feature_application_details_ApplicationDetailsScreen_platforms,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Wrap(
                      spacing: 8,
                      runSpacing: 16,
                      children: [
                        PlatformCheckbox(
                          platform: state.applicationDeploy.android.key,
                          deploy: state.applicationDeploy.android.deploy,
                          onTap: (deploy) =>
                              deploymentCubit.updateApplicationDeploy(
                                state.applicationDeploy.copyWith(
                                  android: state.applicationDeploy.android
                                      .copyWith(deploy: deploy),
                                ),
                              ),
                        ),
                        PlatformCheckbox(
                          platform: state.applicationDeploy.ios.key,
                          deploy: state.applicationDeploy.ios.deploy,
                          onTap: (deploy) =>
                              deploymentCubit.updateApplicationDeploy(
                                state.applicationDeploy.copyWith(
                                  ios: state.applicationDeploy.ios.copyWith(
                                    deploy: deploy,
                                  ),
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                  if (state.applicationDeploy.isAndroidPlatformSelected)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ExpansionTile(
                        title: Text(
                          context
                              .l10n
                              .feature_application_details_ApplicationDetailsScreen_android_configuration,
                        ),
                        childrenPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        tilePadding: const EdgeInsets.only(left: 16, right: 8),
                        collapsedBackgroundColor: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: .05),
                        children: <Widget>[
                          PlayStoreConfigForm(
                            track: state
                                .applicationDeploy
                                .android
                                .playStoreConfig
                                .track,
                            availableTrack: state
                                .applicationDeploy
                                .android
                                .playStoreConfig
                                .availableTracks,
                            status: state
                                .applicationDeploy
                                .android
                                .playStoreConfig
                                .status,
                            availableStatuses: state
                                .applicationDeploy
                                .android
                                .playStoreConfig
                                .availableStatuses,
                            updatePriority: state
                                .applicationDeploy
                                .android
                                .playStoreConfig
                                .updatePriority,
                            userFraction: state
                                .applicationDeploy
                                .android
                                .playStoreConfig
                                .userFraction,
                            userFractionAvailability: state
                                .applicationDeploy
                                .android
                                .playStoreConfig
                                .isUserFractionAvailable,
                            onChangedTrack: (String value) {
                              final config = state
                                  .applicationDeploy
                                  .android
                                  .playStoreConfig
                                  .copyWith(track: value);
                              final platform = state.applicationDeploy.copyWith(
                                android: state.applicationDeploy.android
                                    .copyWith(playStoreConfig: config),
                              );
                              deploymentCubit.updateApplicationDeploy(platform);
                            },
                            onChangedStatus: (String value) {
                              final config = state
                                  .applicationDeploy
                                  .android
                                  .playStoreConfig
                                  .copyWith(status: value);
                              final platform = state.applicationDeploy.copyWith(
                                android: state.applicationDeploy.android
                                    .copyWith(playStoreConfig: config),
                              );
                              deploymentCubit.updateApplicationDeploy(platform);
                            },
                            onChangedUpdatePriority: (int value) {
                              final config = state
                                  .applicationDeploy
                                  .android
                                  .playStoreConfig
                                  .copyWith(updatePriority: value);
                              final platform = state.applicationDeploy.copyWith(
                                android: state.applicationDeploy.android
                                    .copyWith(playStoreConfig: config),
                              );
                              deploymentCubit.updateApplicationDeploy(platform);
                            },
                            onChangedUserFraction: (double value) {
                              final config = state
                                  .applicationDeploy
                                  .android
                                  .playStoreConfig
                                  .copyWith(userFraction: value);
                              final platform = state.applicationDeploy.copyWith(
                                android: state.applicationDeploy.android
                                    .copyWith(playStoreConfig: config),
                              );
                              deploymentCubit.updateApplicationDeploy(platform);
                            },
                          ),
                        ],
                      ),
                    ),
                  Divider(thickness: 4, color: colorScheme.surfaceContainerLow),
                  BranchSelector(
                    title: context
                        .l10n
                        .feature_application_details_ApplicationDetailsScreen_select_branch_for_phone,
                    titleStyle: Theme.of(context).textTheme.titleMedium,
                    initialBranch: state
                        .applicationDeploy
                        .applicationDependencyBranches
                        .phoneSourceBranch,
                    branches: state
                        .applicationDeploy
                        .applicationDependencyBranches
                        .phoneBranches
                        .map((it) => it.name)
                        .toList(),
                    onUpdate: (value) =>
                        deploymentCubit.updateApplicationDeploy(
                          state.applicationDeploy.copyWith(
                            applicationDependencyBranches: state
                                .applicationDeploy
                                .applicationDependencyBranches
                                .copyWith(phoneSourceBranch: value),
                          ),
                        ),
                  ),
                  ListTile(
                    title: Text(
                      context
                          .l10n
                          .feature_application_details_ApplicationDetailsScreen_additional_configuration,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: ExpansionTile(
                      title: Text(
                        context
                            .l10n
                            .feature_application_details_ApplicationDetailsScreen_branches,
                      ),
                      collapsedBackgroundColor: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: .05),
                      children: <Widget>[
                        BranchSelector(
                          title: context
                              .l10n
                              .feature_application_details_ApplicationDetailsScreen_enter_branch_for_callkeep,
                          initialBranch: state
                              .applicationDeploy
                              .applicationDependencyBranches
                              .callkeepSourceBranch,
                          branches: state
                              .applicationDeploy
                              .applicationDependencyBranches
                              .callkeepBranches
                              .map((it) => it.name)
                              .toList(),
                          onUpdate: (value) =>
                              deploymentCubit.updateApplicationDeploy(
                                state.applicationDeploy.copyWith(
                                  applicationDependencyBranches: state
                                      .applicationDeploy
                                      .applicationDependencyBranches
                                      .copyWith(callkeepSourceBranch: value),
                                ),
                              ),
                        ),
                        BranchSelector(
                          title:
                              'Enter branch for  Configurator: (Using data layer in build flow)',
                          initialBranch: state
                              .applicationDeploy
                              .applicationDependencyBranches
                              .configuratorSourceBranch,
                          branches: state
                              .applicationDeploy
                              .applicationDependencyBranches
                              .defaultConfiguratorBranches,
                          onUpdate: (value) =>
                              deploymentCubit.updateApplicationDeploy(
                                state.applicationDeploy.copyWith(
                                  applicationDependencyBranches: state
                                      .applicationDeploy
                                      .applicationDependencyBranches
                                      .copyWith(
                                        configuratorSourceBranch: value,
                                      ),
                                ),
                              ),
                        ),
                        BranchSelector(
                          title: context
                              .l10n
                              .feature_application_details_ApplicationDetailsScreen_enter_branch_for_phone_configurator_tool,
                          initialBranch: state
                              .applicationDeploy
                              .applicationDependencyBranches
                              .phoneConfiguratorToolSourceBranch,
                          branches: state
                              .applicationDeploy
                              .applicationDependencyBranches
                              .defaultPhoneConfiguratorToolBranches,
                          onUpdate: (value) =>
                              deploymentCubit.updateApplicationDeploy(
                                state.applicationDeploy.copyWith(
                                  applicationDependencyBranches: state
                                      .applicationDeploy
                                      .applicationDependencyBranches
                                      .copyWith(
                                        phoneConfiguratorToolSourceBranch:
                                            value,
                                      ),
                                ),
                              ),
                        ),
                        BranchSelector(
                          title: context
                              .l10n
                              .feature_application_details_ApplicationDetailsScreen_enter_branch_for_keystore,
                          initialBranch: state
                              .applicationDeploy
                              .applicationDependencyBranches
                              .keystoreSourceBranch,
                          branches: state
                              .applicationDeploy
                              .applicationDependencyBranches
                              .defaultKeystoreBranches,
                          onUpdate: (value) =>
                              deploymentCubit.updateApplicationDeploy(
                                state.applicationDeploy.copyWith(
                                  applicationDependencyBranches: state
                                      .applicationDeploy
                                      .applicationDependencyBranches
                                      .copyWith(keystoreSourceBranch: value),
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ],
            orientation: ResizableOrientation.horizontal,
          ),
        );
      },
      listener: _listenThemesState,
    );
  }

  void _listenThemesState(BuildContext context, DeploymentState state) {
    if (state.status == DeploymentDetailsStatus.error) {
      showFailureMessage(context, state.error ?? 'Unknown error');
    }

    if (state.status == DeploymentDetailsStatus.deployConfirm) {
      _showDeployConfirm(state);
    }

    if (state.status == DeploymentDetailsStatus.deploySuccess) {
      showTopSnakeMessageSuccess(
        context,
        context
            .l10n
            .feature_application_details_ApplicationDetailsScreen_deploy_success_message,
        duration: const Duration(seconds: 4),
      );
    }
  }

  Future<void> _showDeployConfirm(DeploymentState state) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return DeployConfirmDialog(
          deployInfo: state.applicationDeploy,
          onCancel: () {
            Navigator.maybePop(context);
          },
          onAccept: () {
            Navigator.maybePop(context);
            deploymentCubit.confirmDeployBuilds();
          },
        );
      },
    );
  }

  void _onThemeModeChanged(BuildContext context, ThemeMode themeMode) {
    BlocProvider.of<CommonBloc>(context).setThemeMode(themeMode);
  }
}
