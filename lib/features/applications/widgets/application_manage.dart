import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:webtrit_configurator/core/widgets/widgets.dart';
import 'package:webtrit_configurator/localization/localization.dart';

import '../model/models.dart';

class ApplicationManage extends StatelessWidget {
  const ApplicationManage({
    required this.updateName,
    required this.updateAndroidPlatformId,
    required this.updateIosPlatformId,
    required this.updateAndroidBuildName,
    required this.updateAndroidBuildNumber,
    required this.updateIosBuildName,
    required this.updateIosBuildNumber,
    required this.nameInput,
    required this.androidPlatformIdInput,
    required this.iosPlatformIdInput,
    required this.androidBuildNameInput,
    required this.androidBuildNumberInput,
    required this.iosBuildNameInput,
    required this.iosBuildNumberInput,
    required this.actionManage,
    required this.action,
    super.key,
  });

  final void Function(String value) updateName;
  final void Function(String value) updateAndroidPlatformId;
  final void Function(String value) updateIosPlatformId;
  final void Function(String value) updateAndroidBuildName;
  final void Function(String value) updateAndroidBuildNumber;
  final void Function(String value) updateIosBuildName;
  final void Function(String value) updateIosBuildNumber;

  final void Function() actionManage;
  final String action;

  final ApplicationNameInput? nameInput;
  final ApplicationIdentifierInput? androidPlatformIdInput;
  final ApplicationIdentifierInput? iosPlatformIdInput;
  final ApplicationBuildNameInput? androidBuildNameInput;
  final ApplicationBuildNumberInput? androidBuildNumberInput;
  final ApplicationBuildNameInput? iosBuildNameInput;
  final ApplicationBuildNumberInput? iosBuildNumberInput;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textScheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800, minWidth: 200),
      child: Card(
        elevation: 2,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.feature_application_Input_title,
                  style: textScheme.labelLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                TextFormField(
                  initialValue: nameInput?.value,
                  onChanged: updateName,
                  maxLength: ApplicationConsts.maxNameLimit,
                  decoration: InputDecoration(
                      errorText: nameInput?.errorL10n(context),
                      hintText: 'Will be displayed in the app',
                      suffixIcon: Tooltip(
                        message: context.l10n.feature_application_create_Tooltip_name_info,
                        child: Icon(Icons.info_outlined, color: colorScheme.secondary),
                      )),
                ),
                Text(
                  context.l10n.feature_application_android_identifier,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                TextFormField(
                  initialValue: androidPlatformIdInput?.value,
                  onChanged: updateAndroidPlatformId,
                  maxLength: ApplicationConsts.maxIdentifierLimit,
                  decoration: InputDecoration(
                    errorText: androidPlatformIdInput?.errorL10n(context),
                    hintText: "Bundle ID is an app's unique identifier.",
                    suffixIcon: Tooltip(
                      message: context.l10n.feature_application_create_Tooltip_identifier_info,
                      child: Icon(Icons.info_outlined, color: colorScheme.secondary),
                    ),
                  ),
                ),
                Text(
                  context.l10n.feature_application_ios_identifier,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                TextFormField(
                  initialValue: iosPlatformIdInput?.value,
                  onChanged: updateIosPlatformId,
                  maxLength: ApplicationConsts.maxIdentifierLimit,
                  decoration: InputDecoration(
                    errorText: iosPlatformIdInput?.errorL10n(context),
                    hintText: "Bundle ID is an app's unique identifier.",
                    suffixIcon: Tooltip(
                      message: context.l10n.feature_application_create_Tooltip_identifier_info,
                      child: Icon(Icons.info_outlined, color: colorScheme.secondary),
                    ),
                  ),
                ),
                Text(
                  'Android build name',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                TextFormField(
                  initialValue: androidBuildNameInput?.value,
                  onChanged: updateAndroidBuildName,
                  maxLength: ApplicationConsts.maxCoreLimit,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.]'))],
                  decoration: InputDecoration(
                    hintText: '1.0.0',
                    errorText: androidBuildNameInput?.errorL10n(context),
                    suffixIcon: Tooltip(
                      message: 'The version name shown to users',
                      child: Icon(Icons.info_outlined, color: colorScheme.secondary),
                    ),
                  ),
                ),
                Text(
                  'Android build number',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                TextFormField(
                  initialValue: androidBuildNumberInput?.value,
                  onChanged: updateAndroidBuildNumber,
                  maxLength: ApplicationConsts.maxCoreLimit,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: '1',
                    errorText: androidBuildNumberInput?.errorL10n(context),
                    suffixIcon: Tooltip(
                      message: 'The version code shown to users',
                      child: Icon(Icons.info_outlined, color: colorScheme.secondary),
                    ),
                  ),
                ),
                Text(
                  'iOS build name',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                TextFormField(
                  initialValue: iosBuildNameInput?.value,
                  onChanged: updateIosBuildName,
                  maxLength: ApplicationConsts.maxCoreLimit,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.]'))],
                  decoration: InputDecoration(
                    hintText: '1.0.0',
                    errorText: iosBuildNameInput?.errorL10n(context),
                    suffixIcon: Tooltip(
                      message: 'The version name shown to users',
                      child: Icon(Icons.info_outlined, color: colorScheme.secondary),
                    ),
                  ),
                ),
                Text(
                  'iOS build number',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                TextFormField(
                  initialValue: iosBuildNumberInput?.value,
                  onChanged: updateIosBuildNumber,
                  maxLength: ApplicationConsts.maxCoreLimit,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: '1',
                    errorText: iosBuildNumberInput?.errorL10n(context),
                    suffixIcon: Tooltip(
                      message: 'The version code shown to users',
                      child: Icon(Icons.info_outlined, color: colorScheme.secondary),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Button(
                  title: action,
                  onPressed: actionManage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
