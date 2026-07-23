import 'package:flutter/widgets.dart';

import 'package:formz/formz.dart';

import 'package:webtrit_configurator/localization/localization.dart';

enum ApplicationBuildNameValidationError { blank, invalidFormat }

class ApplicationBuildNameInput
    extends FormzInput<String, ApplicationBuildNameValidationError> {
  const ApplicationBuildNameInput.pure([super.value = '']) : super.pure();

  // ignore: use_super_parameters
  const ApplicationBuildNameInput.dirty([String value = ''])
    : super.dirty(value);

  static final _versionFormat = RegExp(r'^\d+\.\d+\.\d+$');

  ApplicationBuildNameInput toDirty() => ApplicationBuildNameInput.dirty(value);

  @override
  ApplicationBuildNameValidationError? validator(String value) {
    if (value.isEmpty) {
      return ApplicationBuildNameValidationError.blank;
    }
    if (!_versionFormat.hasMatch(value)) {
      return ApplicationBuildNameValidationError.invalidFormat;
    }
    return null;
  }
}

extension ExtensionValidationBuildNameErrorL10n on ApplicationBuildNameInput {
  String? errorL10n(BuildContext context) {
    if (isValid) {
      return null;
    } else {
      switch (error!) {
        case ApplicationBuildNameValidationError.blank:
          return context.l10n.validationBlankError;
        case ApplicationBuildNameValidationError.invalidFormat:
          return context.l10n.validationInvalidVersionFormat;
      }
    }
  }
}
