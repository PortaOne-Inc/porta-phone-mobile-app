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
      child: Column(
        children: [
          Card(
            elevation: 2,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 64,
                  bottom: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.feature_application_Input_title,
                      style: textScheme.labelLarge,
                    ),
                    const SizedBox(height: 4),
                    TextFormField(
                      initialValue: nameInput?.value,
                      onChanged: updateName,
                      maxLength: ApplicationConsts.maxNameLimit,
                      decoration: InputDecoration(
                        errorText: nameInput?.errorL10n(context),
                        hintText: 'Will be displayed in the app',
                        suffixIcon: Tooltip(
                          message: context
                              .l10n
                              .feature_application_create_Tooltip_name_info,
                          child: Icon(
                            Icons.info_outlined,
                            color: colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            horizontalTitleGap: 8,
                            title: Text(
                              context
                                  .l10n
                                  .feature_application_android_identifier,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            subtitle: TextFormField(
                              initialValue: androidPlatformIdInput?.value,
                              onChanged: updateAndroidPlatformId,
                              maxLength: ApplicationConsts.maxIdentifierLimit,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.android),
                                hintText: 'com.example.app',
                                helperText: 'com.example.app',
                                errorText: androidPlatformIdInput?.errorL10n(
                                  context,
                                ),
                                suffixIcon: Tooltip(
                                  message: context
                                      .l10n
                                      .feature_application_create_Tooltip_identifier_info,
                                  child: Icon(
                                    Icons.info_outlined,
                                    color: colorScheme.secondary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            horizontalTitleGap: 8,
                            title: Text(
                              context.l10n.feature_application_ios_identifier,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            subtitle: TextFormField(
                              initialValue: iosPlatformIdInput?.value,
                              onChanged: updateIosPlatformId,
                              maxLength: ApplicationConsts.maxIdentifierLimit,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.apple),
                                hintText: 'com.example.app',
                                helperText: 'com.example.app',
                                errorText: iosPlatformIdInput?.errorL10n(
                                  context,
                                ),
                                suffixIcon: Tooltip(
                                  message: context
                                      .l10n
                                      .feature_application_create_Tooltip_identifier_info,
                                  child: Icon(
                                    Icons.info_outlined,
                                    color: colorScheme.secondary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 2,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 32,
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    inputDecorationTheme: Theme.of(context).inputDecorationTheme
                        .copyWith(
                          filled: true,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest
                              .withValues(alpha: 0.5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Theme.of(
                                context,
                              ).colorScheme.outlineVariant,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1.5,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                        ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              horizontalTitleGap: 8,
                              title: Text(
                                'Android build name',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              subtitle: TextFormField(
                                initialValue: androidBuildNameInput?.value,
                                onChanged: updateAndroidBuildName,
                                maxLength: ApplicationConsts.maxCoreLimit,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.]'),
                                  ),
                                ],
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.android),
                                  hintText: '1.0.0',
                                  helperText: 'Example: 1.0.0',
                                  errorText: androidBuildNameInput?.errorL10n(
                                    context,
                                  ),
                                  counterText: '', // hide counter
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              horizontalTitleGap: 8,
                              title: Text(
                                'Android build number',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              subtitle: TextFormField(
                                initialValue: androidBuildNumberInput?.value,
                                onChanged: updateAndroidBuildNumber,
                                maxLength: ApplicationConsts.maxCoreLimit,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.confirmation_number,
                                  ),
                                  hintText: '1',
                                  helperText: 'Integer number, e.g.: 1',
                                  errorText: androidBuildNumberInput?.errorL10n(
                                    context,
                                  ),
                                  counterText: '',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              horizontalTitleGap: 8,
                              title: Text(
                                'iOS build name',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              subtitle: TextFormField(
                                initialValue: iosBuildNameInput?.value,
                                onChanged: updateIosBuildName,
                                maxLength: ApplicationConsts.maxCoreLimit,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.]'),
                                  ),
                                ],
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.apple),
                                  hintText: '1.0.0',
                                  helperText: 'Example: 1.0.0',
                                  errorText: iosBuildNameInput?.errorL10n(
                                    context,
                                  ),
                                  counterText: '',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              horizontalTitleGap: 8,
                              title: Text(
                                'iOS build number',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              subtitle: TextFormField(
                                initialValue: iosBuildNumberInput?.value,
                                onChanged: updateIosBuildNumber,
                                maxLength: ApplicationConsts.maxCoreLimit,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.confirmation_number,
                                  ),
                                  hintText: '1',
                                  helperText: 'Integer number, e.g.: 1',
                                  errorText: iosBuildNumberInput?.errorL10n(
                                    context,
                                  ),
                                  counterText: '',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Button(title: action, onPressed: actionManage),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
