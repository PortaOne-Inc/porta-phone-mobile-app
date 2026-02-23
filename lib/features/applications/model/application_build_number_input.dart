import 'package:flutter/widgets.dart';

import 'package:formz/formz.dart';

import 'package:webtrit_configurator/localization/localization.dart';

enum ApplicationBuildNumberValidationError { blank }

class ApplicationBuildNumberInput
    extends FormzInput<String, ApplicationBuildNumberValidationError> {
  const ApplicationBuildNumberInput.pure([super.value = '']) : super.pure();

  // ignore: use_super_parameters
  const ApplicationBuildNumberInput.dirty([String value = ''])
    : super.dirty(value);

  ApplicationBuildNumberInput toDirty() =>
      ApplicationBuildNumberInput.dirty(value);

  @override
  ApplicationBuildNumberValidationError? validator(String value) {
    if (value.isEmpty) {
      return ApplicationBuildNumberValidationError.blank;
    } else {
      return null;
    }
  }
}

extension ExtensionValidationBuildNumberErrorL10n
    on ApplicationBuildNumberInput {
  String? errorL10n(BuildContext context) {
    if (isValid) {
      return null;
    } else {
      switch (error!) {
        case ApplicationBuildNumberValidationError.blank:
          return context.l10n.validationBlankError;
      }
    }
  }
}
