import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/localization/localization.dart';

class DeployConfirmDialog extends StatelessWidget {
  const DeployConfirmDialog({
    required this.deployInfo,
    required this.onCancel,
    required this.onAccept,
    super.key,
  });

  final ApplicationDeploy deployInfo;
  final VoidCallback onCancel;
  final VoidCallback onAccept;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(
        context
            .l10n
            .feature_application_details_DeployConfirmDialog_confirm_deployment,
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (deployInfo.android.deploy) ...[
              AndroidDeploymentDetails(deployInfo: deployInfo),
            ],
            if (deployInfo.ios.deploy) ...[
              const Divider(),
              IOSDeploymentDetails(deployInfo: deployInfo),
            ],
            const Divider(),
            const SizedBox(height: 8),
            BranchInfoRow(
              title: context
                  .l10n
                  .feature_application_details_DeployConfirmDialog_phone_source_branch,
              branch:
                  deployInfo.applicationDependencyBranches.phoneSourceBranch,
            ),
            BranchInfoRow(
              title: context
                  .l10n
                  .feature_application_details_DeployConfirmDialog_callkeep_source_branch,
              branch:
                  deployInfo.applicationDependencyBranches.callkeepSourceBranch,
            ),
            BranchInfoRow(
              title: context
                  .l10n
                  .feature_application_details_DeployConfirmDialog_common_dependency_source_branch,
              branch: deployInfo
                  .applicationDependencyBranches
                  .configuratorSourceBranch,
            ),
            BranchInfoRow(
              title: context
                  .l10n
                  .feature_application_details_DeployConfirmDialog_phone_configurator_tool_source_branch,
              branch: deployInfo
                  .applicationDependencyBranches
                  .phoneConfiguratorToolSourceBranch,
            ),
            BranchInfoRow(
              title: context
                  .l10n
                  .feature_application_details_DeployConfirmDialog_keystore_source_branch,
              branch:
                  deployInfo.applicationDependencyBranches.keystoreSourceBranch,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onCancel,
          child: Text(
            context.l10n.feature_application_details_DeployConfirmDialog_cancel,
          ),
        ),
        ElevatedButton(
          onPressed: onAccept,
          child: Text(
            context.l10n.feature_application_details_DeployConfirmDialog_accept,
          ),
        ),
      ],
    );
  }
}

class AndroidDeploymentDetails extends StatelessWidget {
  const AndroidDeploymentDetails({required this.deployInfo, super.key});

  final ApplicationDeploy deployInfo;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context
              .l10n
              .feature_application_details_DeployConfirmDialog_android_deployment,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        PlayStoreConfigInfo(config: deployInfo.android.playStoreConfig),
      ],
    );
  }
}

class IOSDeploymentDetails extends StatelessWidget {
  const IOSDeploymentDetails({required this.deployInfo, super.key});

  final ApplicationDeploy deployInfo;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context
              .l10n
              .feature_application_details_DeployConfirmDialog_ios_deployment,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ConfigInfoRow(
          title: context
              .l10n
              .feature_application_details_DeployConfirmDialog_track,
          value: 'Testflight',
        ),
      ],
    );
  }
}

class PlayStoreConfigInfo extends StatelessWidget {
  const PlayStoreConfigInfo({required this.config, super.key});

  final AndroidPlayStoreConfig config;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Divider(),
        ConfigInfoRow(
          title: context
              .l10n
              .feature_application_details_DeployConfirmDialog_track,
          value: config.track,
        ),
        ConfigInfoRow(
          title: context
              .l10n
              .feature_application_details_DeployConfirmDialog_status,
          value: config.status,
        ),
        ConfigInfoRow(
          title: context
              .l10n
              .feature_application_details_DeployConfirmDialog_update_priority,
          value: config.updatePriority.toString(),
        ),
        ConfigInfoRow(
          title: context
              .l10n
              .feature_application_details_DeployConfirmDialog_user_fraction,
          value: config.userFraction.toString(),
        ),
      ],
    );
  }
}

class ConfigInfoRow extends StatelessWidget {
  const ConfigInfoRow({required this.title, required this.value, super.key});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(child: Text(title)),
        Flexible(
          child: Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class BranchInfoRow extends StatelessWidget {
  const BranchInfoRow({required this.title, required this.branch, super.key});

  final String title;
  final String branch;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(child: Text(title)),
        Flexible(
          child: GestureDetector(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: branch,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const WidgetSpan(child: SizedBox(width: 8)),
                  WidgetSpan(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Icon(
                        Icons.copy,
                        size: 16,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () => Clipboard.setData(ClipboardData(text: branch)),
          ),
        ),
      ],
    );
  }
}
