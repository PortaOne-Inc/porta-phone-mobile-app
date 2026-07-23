import 'package:flutter/widgets.dart';

import 'package:webtrit_configurator/localization/localization.dart';

import '../../../model/models.dart';

extension ApplicationValidateErrorL10n on ApplicationValidateError {
  String l10n(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return switch (this) {
      ApplicationValidateError.invalidCoreUrl =>
        localizations
            .feature_application_details_ApplicationDetailsScreen_invalidCoreUrl,
      ApplicationValidateError.invalidTermsConditionsUrl =>
        localizations
            .feature_application_details_ApplicationDetailsScreen_invalidTermsConditionsUrl,
      ApplicationValidateError.invalidAndroidVersionName =>
        localizations
            .feature_application_details_ApplicationDetailsScreen_invalidAndroidVersionName,
      ApplicationValidateError.invalidAndroidVersionNumber =>
        localizations
            .feature_application_details_ApplicationDetailsScreen_invalidAndroidVersionNumber,
      ApplicationValidateError.invalidIosVersionName =>
        localizations
            .feature_application_details_ApplicationDetailsScreen_invalidIosVersionName,
      ApplicationValidateError.invalidIosVersionNumber =>
        localizations
            .feature_application_details_ApplicationDetailsScreen_invalidIosVersionNumber,
      ApplicationValidateError.invalidIosPlatformId =>
        localizations
            .feature_application_details_ApplicationDetailsScreen_invalidIosPlatformId,
      ApplicationValidateError.invalidAndroidPlatformId =>
        localizations
            .feature_application_details_ApplicationDetailsScreen_invalidAndroidPlatformId,
    };
  }
}
