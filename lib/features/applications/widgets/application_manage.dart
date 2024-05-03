import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/widgets/widgets.dart';
import 'package:webtrit_configurator/localization/localization.dart';

import '../model/models.dart';

class ApplicationManage extends StatelessWidget {
  const ApplicationManage({
    required this.updateName,
    required this.updateIdentifier,
    required this.updateAndroidPlatformId,
    required this.updateIosPlatformId,
    required this.onChangedTermsConditionsInput,
    required this.onChangedCoreInput,
    required this.nameInput,
    required this.applicationIdentifierInput,
    required this.androidPlatformIdInput,
    required this.iosPlatformIdInput,
    required this.applicationCoreInput,
    required this.applicationTermsConditionsInput,
    required this.updateAndroidGoogleService,
    required this.updateIosGoogleService,
    required this.actionManage,
    required this.isAndroidGoogleServiceSelected,
    required this.isIosGoogleServiceSelected,
    required this.action,
    super.key,
  });

  final void Function(String value) updateName;
  final void Function(String value) updateIdentifier;
  final void Function(String value) updateAndroidPlatformId;
  final void Function(String value) updateIosPlatformId;
  final void Function(String value) onChangedCoreInput;
  final void Function(String value) onChangedTermsConditionsInput;

  final bool isAndroidGoogleServiceSelected;
  final bool isIosGoogleServiceSelected;

  final void Function() updateAndroidGoogleService;
  final void Function() updateIosGoogleService;

  final void Function() actionManage;
  final String action;

  final ApplicationNameInput? nameInput;
  final ApplicationIdentifierInput? applicationIdentifierInput;
  final ApplicationIdentifierInput? androidPlatformIdInput;
  final ApplicationIdentifierInput? iosPlatformIdInput;
  final ApplicationCoreInput? applicationCoreInput;
  final ApplicationTermsConditionsInput? applicationTermsConditionsInput;

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
                  context.l10n.feature_application_identifier,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                TextFormField(
                  initialValue: applicationIdentifierInput?.value,
                  onChanged: updateIdentifier,
                  maxLength: ApplicationConsts.maxIdentifierLimit,
                  decoration: InputDecoration(
                    errorText: applicationIdentifierInput?.errorL10n(context),
                    hintText: "Bundle ID is an app's unique identifier.",
                    suffixIcon: Tooltip(
                      message: context.l10n.feature_application_create_Tooltip_identifier_info,
                      child: Icon(Icons.info_outlined, color: colorScheme.secondary),
                    ),
                  ),
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
                  'Application core',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                TextFormField(
                  initialValue: applicationCoreInput?.value,
                  onChanged: onChangedCoreInput,
                  maxLength: ApplicationConsts.maxCoreLimit,
                  decoration: InputDecoration(
                    hintText: 'Url for resource',
                    errorText: applicationCoreInput?.errorL10n(context),
                    suffixIcon: Tooltip(
                      message: 'Link to the backend',
                      child: Icon(Icons.info_outlined, color: colorScheme.secondary),
                    ),
                  ),
                ),
                Text(
                  'Terms and conditions',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                TextFormField(
                  initialValue: applicationTermsConditionsInput?.value,
                  onChanged: onChangedTermsConditionsInput,
                  maxLength: ApplicationConsts.maxCoreLimit,
                  decoration: InputDecoration(
                    hintText: 'Url for resource',
                    errorText: applicationTermsConditionsInput?.errorL10n(context),
                    suffixIcon: Tooltip(
                      message:
                          'Provide a direct web link to the page that contains the legal terms and conditions for using a product or service.',
                      child: Icon(Icons.info_outlined, color: colorScheme.secondary),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Google services: ',
                      style: textScheme.labelLarge,
                    ),
                    Tooltip(
                      message:
                          'The google-services.json file is typically generated by the Google Play Console when you add a new app to your project.',
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          Icons.info_outline,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    GoogleServicesPreview(
                      platform: TargetPlatform.android,
                      type: isAndroidGoogleServiceSelected
                          ? GoogleServicesPreviewType.remove
                          : GoogleServicesPreviewType.add,
                      onTap: updateAndroidGoogleService,
                    ),
                    const SizedBox(width: 16),
                    GoogleServicesPreview(
                      platform: TargetPlatform.iOS,
                      type:
                          isIosGoogleServiceSelected ? GoogleServicesPreviewType.remove : GoogleServicesPreviewType.add,
                      onTap: updateIosGoogleService,
                    ),
                  ],
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
