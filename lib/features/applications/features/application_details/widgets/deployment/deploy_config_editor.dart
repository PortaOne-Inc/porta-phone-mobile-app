import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/localization/localization.dart';

import 'branch_selector.dart';
import 'platform_checkbox.dart';
import 'play_store_config_form.dart';

/// Presentational editor for a single [ApplicationDeploy] configuration:
/// platforms, Play Store config and dependency branches.
///
/// It is intentionally decoupled from any BLoC/Cubit: callers pass the current
/// [value] and receive a fully updated [ApplicationDeploy] through [onChanged].
/// This lets the same surface drive the single-application deployment screen,
/// the group default configuration and the per-application override drawer.
class DeployConfigEditor extends StatelessWidget {
  const DeployConfigEditor({required this.value, required this.onChanged, super.key});

  final ApplicationDeploy value;
  final ValueChanged<ApplicationDeploy> onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            context.l10n.feature_application_details_ApplicationDetailsScreen_platforms,
            style: textTheme.titleMedium,
          ),
          subtitle: Wrap(
            spacing: 8,
            runSpacing: 16,
            children: [
              PlatformCheckbox(platform: value.android.key, deploy: value.android.deploy, onTap: _updateAndroidDeploy),
              PlatformCheckbox(platform: value.ios.key, deploy: value.ios.deploy, onTap: _updateIosDeploy),
            ],
          ),
        ),
        if (value.isAndroidPlatformSelected)
          Padding(
            padding: const EdgeInsets.all(16),
            child: ExpansionTile(
              title: Text(context.l10n.feature_application_details_ApplicationDetailsScreen_android_configuration),
              childrenPadding: const EdgeInsets.symmetric(vertical: 16),
              tilePadding: const EdgeInsets.only(left: 16, right: 8),
              collapsedBackgroundColor: colorScheme.primary.withValues(alpha: .05),
              children: <Widget>[
                PlayStoreConfigForm(
                  track: value.android.playStoreConfig.track,
                  availableTrack: value.android.playStoreConfig.availableTracks,
                  status: value.android.playStoreConfig.status,
                  availableStatuses: value.android.playStoreConfig.availableStatuses,
                  updatePriority: value.android.playStoreConfig.updatePriority,
                  userFraction: value.android.playStoreConfig.userFraction,
                  userFractionAvailability: value.android.playStoreConfig.isUserFractionAvailable,
                  onChangedTrack: _updateTrack,
                  onChangedStatus: _updateStatus,
                  onChangedUpdatePriority: _updateUpdatePriority,
                  onChangedUserFraction: _updateUserFraction,
                ),
              ],
            ),
          ),
        Divider(thickness: 4, color: colorScheme.surfaceContainerLow),
        BranchSelector(
          title: context.l10n.feature_application_details_ApplicationDetailsScreen_select_branch_for_phone,
          titleStyle: textTheme.titleMedium,
          initialBranch: value.applicationDependencyBranches.phoneSourceBranch,
          branches: value.applicationDependencyBranches.phoneBranches.map((it) => it.name).toList(),
          onUpdate: _updatePhoneBranch,
        ),
        ListTile(
          title: Text(
            context.l10n.feature_application_details_ApplicationDetailsScreen_additional_configuration,
            style: textTheme.titleMedium,
          ),
          subtitle: ExpansionTile(
            title: Text(context.l10n.feature_application_details_ApplicationDetailsScreen_branches),
            collapsedBackgroundColor: colorScheme.primary.withValues(alpha: .05),
            children: _additionalBranchFields(context)
                .map(
                  (field) => BranchSelector(
                    title: field.title,
                    initialBranch: field.initialBranch,
                    branches: field.branches,
                    onUpdate: (branch) => onChanged(field.apply(value, branch)),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  List<_BranchField> _additionalBranchFields(BuildContext context) {
    final branches = value.applicationDependencyBranches;

    return [
      _BranchField(
        title: 'Enter branch for  Configurator: (Using data layer in build flow)',
        initialBranch: branches.configuratorSourceBranch,
        branches: branches.defaultConfiguratorBranches,
        apply: (deploy, branch) => deploy.copyWith(
          applicationDependencyBranches: deploy.applicationDependencyBranches.copyWith(
            configuratorSourceBranch: branch,
          ),
        ),
      ),
      _BranchField(
        title:
            context.l10n.feature_application_details_ApplicationDetailsScreen_enter_branch_for_phone_configurator_tool,
        initialBranch: branches.phoneConfiguratorToolSourceBranch,
        branches: branches.defaultPhoneConfiguratorToolBranches,
        apply: (deploy, branch) => deploy.copyWith(
          applicationDependencyBranches: deploy.applicationDependencyBranches.copyWith(
            phoneConfiguratorToolSourceBranch: branch,
          ),
        ),
      ),
      _BranchField(
        title: context.l10n.feature_application_details_ApplicationDetailsScreen_enter_branch_for_keystore,
        initialBranch: branches.keystoreSourceBranch,
        branches: branches.defaultKeystoreBranches,
        apply: (deploy, branch) => deploy.copyWith(
          applicationDependencyBranches: deploy.applicationDependencyBranches.copyWith(keystoreSourceBranch: branch),
        ),
      ),
    ];
  }

  void _updateAndroidDeploy(bool deploy) {
    onChanged(value.copyWith(android: value.android.copyWith(deploy: deploy)));
  }

  void _updateIosDeploy(bool deploy) {
    onChanged(value.copyWith(ios: value.ios.copyWith(deploy: deploy)));
  }

  void _updateTrack(String track) {
    onChanged(
      value.copyWith(
        android: value.android.copyWith(playStoreConfig: value.android.playStoreConfig.copyWith(track: track)),
      ),
    );
  }

  void _updateStatus(String status) {
    onChanged(
      value.copyWith(
        android: value.android.copyWith(playStoreConfig: value.android.playStoreConfig.copyWith(status: status)),
      ),
    );
  }

  void _updateUpdatePriority(int priority) {
    onChanged(
      value.copyWith(
        android: value.android.copyWith(
          playStoreConfig: value.android.playStoreConfig.copyWith(updatePriority: priority),
        ),
      ),
    );
  }

  void _updateUserFraction(double fraction) {
    onChanged(
      value.copyWith(
        android: value.android.copyWith(
          playStoreConfig: value.android.playStoreConfig.copyWith(userFraction: fraction),
        ),
      ),
    );
  }

  void _updatePhoneBranch(String branch) {
    onChanged(
      value.copyWith(
        applicationDependencyBranches: value.applicationDependencyBranches.copyWith(phoneSourceBranch: branch),
      ),
    );
  }
}

class _BranchField {
  const _BranchField({required this.title, required this.initialBranch, required this.branches, required this.apply});

  final String title;
  final String initialBranch;
  final List<String> branches;
  final ApplicationDeploy Function(ApplicationDeploy deploy, String branch) apply;
}
