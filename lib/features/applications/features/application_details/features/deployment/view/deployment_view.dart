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

class DeploymentView extends StatefulWidget {
  const DeploymentView({super.key});

  @override
  State<DeploymentView> createState() => _DeploymentViewState();
}

class _DeploymentViewState extends State<DeploymentView> with MixinMessages {
  DeploymentCubit get deploymentCubit => BlocProvider.of<DeploymentCubit>(context);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocConsumer<DeploymentCubit, DeploymentState>(
      builder: (context, state) {
        final applicationValidateErrorMessages = state.applicationValidateErrors.map((it) => it.l10n(context));

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
                            titleData:
                                context.l10n.feature_application_details_ApplicationDetailsScreen_android_build_name,
                            style: textTheme.titleMedium?.copyWith(color: colorScheme.onPrimaryContainer),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                            backgroundColor: colorScheme.primary.withValues(alpha: 0.2),
                          ),
                          ListTile(
                            title: Text(
                              context.l10n.feature_application_details_ApplicationDetailsScreen_android_platform_id,
                            ),
                            subtitle: SelectableText(state.application?.androidPlatformId ?? ''),
                            minLeadingWidth: 4,
                            leading: Container(width: 8, color: colorScheme.primary.withValues(alpha: 0.2)),
                          ),
                          Divider(thickness: 4, color: colorScheme.surfaceContainerLow),
                          ListTile(
                            title: Text(
                              context.l10n.feature_application_details_ApplicationDetailsScreen_ios_platform_id,
                            ),
                            subtitle: SelectableText(state.application?.iosPlatformId ?? ''),
                            minLeadingWidth: 4,
                            leading: Container(width: 8, color: colorScheme.primary.withValues(alpha: 0.2)),
                          ),
                          GroupTitleTile(
                            titleData: 'Project Versions',
                            style: textTheme.titleMedium?.copyWith(color: colorScheme.onPrimaryContainer),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                            backgroundColor: colorScheme.primary.withValues(alpha: 0.2),
                          ),
                          ListTile(
                            title: const Text('App version'),
                            subtitle: SelectableText(
                              state.application?.appVersion?.buildName ?? 'Latest build version data is missing.',
                            ),
                            minLeadingWidth: 4,
                            leading: Container(width: 8, color: colorScheme.primary.withValues(alpha: 0.2)),
                          ),
                          GroupTitleTile(
                            titleData: 'Build Versions',
                            style: textTheme.titleMedium?.copyWith(color: colorScheme.onPrimaryContainer),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                            backgroundColor: colorScheme.primary.withValues(alpha: 0.2),
                          ),
                          ListTile(
                            title: Text(
                              context.l10n.feature_application_details_ApplicationDetailsScreen_android_build_name,
                            ),
                            subtitle: SelectableText(state.application?.androidVersion?.buildName ?? ''),
                            minLeadingWidth: 4,
                            trailing: Builder(
                              builder: (context) {
                                const platform = BuildPlatform.android;
                                final isUpdating = state.buildVersionProgress.isNameProgress(platform);

                                return UpdaterChooserButton(
                                  progress: isUpdating,
                                  onPressed: (it) =>
                                      deploymentCubit.updateBuildName(platform, VersionPart.values.byName(it)),
                                  initial: VersionPart.patch.name,
                                  items: VersionPart.values.map((it) => it.name).toList(),
                                );
                              },
                            ),
                            leading: Container(width: 8, color: colorScheme.primary.withValues(alpha: 0.2)),
                          ),
                          Divider(thickness: 4, color: colorScheme.surfaceContainerLow),
                          ListTile(
                            title: Text(
                              context.l10n.feature_application_details_ApplicationDetailsScreen_android_build_number,
                            ),
                            subtitle: SelectableText(state.application?.androidVersion?.buildNumber?.toString() ?? ''),
                            minLeadingWidth: 4,
                            trailing: Builder(
                              builder: (context) {
                                const platform = BuildPlatform.android;
                                final isUpdating = state.buildVersionProgress.isNumberProgress(platform);

                                return UpdaterButton(
                                  progress: isUpdating,
                                  onPressed: () => deploymentCubit.updateBuildNumber(platform),
                                );
                              },
                            ),
                            leading: Container(width: 8, color: colorScheme.primary.withValues(alpha: 0.2)),
                          ),
                          Divider(thickness: 4, color: colorScheme.surfaceContainerLow),
                          ListTile(
                            title: Text(
                              context.l10n.feature_application_details_ApplicationDetailsScreen_ios_build_name,
                            ),
                            subtitle: SelectableText(state.application?.iosVersion?.buildName ?? ''),
                            minLeadingWidth: 4,
                            trailing: Builder(
                              builder: (context) {
                                const platform = BuildPlatform.ios;
                                final isUpdating = state.buildVersionProgress.isNameProgress(platform);

                                return UpdaterChooserButton(
                                  progress: isUpdating,
                                  onPressed: (it) =>
                                      deploymentCubit.updateBuildName(platform, VersionPart.values.byName(it)),
                                  initial: VersionPart.patch.name,
                                  items: VersionPart.values.map((it) => it.name).toList(),
                                );
                              },
                            ),
                            leading: Container(width: 8, color: colorScheme.primary.withValues(alpha: 0.2)),
                          ),
                          Divider(thickness: 4, color: colorScheme.surfaceContainerLow),
                          ListTile(
                            title: Text(
                              context.l10n.feature_application_details_ApplicationDetailsScreen_ios_build_number,
                            ),
                            subtitle: SelectableText(state.application?.iosVersion?.buildNumber?.toString() ?? ''),
                            minLeadingWidth: 4,
                            trailing: Builder(
                              builder: (context) {
                                const platform = BuildPlatform.ios;
                                final isUpdating = state.buildVersionProgress.isNumberProgress(platform);

                                return UpdaterButton(
                                  progress: isUpdating,
                                  onPressed: () => deploymentCubit.updateBuildNumber(platform),
                                );
                              },
                            ),
                            leading: Container(width: 8, color: colorScheme.primary.withValues(alpha: 0.2)),
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
                    style: textTheme.titleMedium?.copyWith(color: colorScheme.onPrimaryContainer),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    backgroundColor: colorScheme.surfaceTint.withValues(alpha: 0.2),
                    trailing: ElevatedButton(
                      onPressed:
                          state.applicationDeploy.anyDeployPlatformAvailable && applicationValidateErrorMessages.isEmpty
                          ? deploymentCubit.deployBuilds
                          : null,
                      child: const Text('Deploy'),
                    ),
                  ),
                  DeployConfigEditor(
                    value: state.applicationDeploy,
                    onChanged: deploymentCubit.updateApplicationDeploy,
                  ),
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
        context.l10n.feature_application_details_ApplicationDetailsScreen_deploy_success_message,
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
