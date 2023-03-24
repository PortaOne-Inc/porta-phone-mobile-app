// import 'package:flutter/material.dart';
// import 'package:formz/formz.dart';
// import 'package:webtrit_configurator/core/config/l10n/l10n.dart';
//
// enum ApplicationDescriptionValidationError {
//   blank,
//   toLong,
//   toShort,
// }
//
// class ApplicationDescriptionInput extends FormzInput<String, ApplicationDescriptionValidationError> {
//   const ApplicationDescriptionInput.pure([String value = '']) : super.pure(value);
//
//   const ApplicationDescriptionInput.dirty([String value = '']) : super.dirty(value);
//
//   ApplicationDescriptionInput toDirty() => ApplicationDescriptionInput.dirty(value);
//
//   @override
//   ApplicationDescriptionValidationError? validator(String value) {
//     if (value.isEmpty) {
//       return ApplicationDescriptionValidationError.blank;
//     } else if (value.length > 64) {
//       return ApplicationDescriptionValidationError.toLong;
//     } else if (value.length < 4) {
//       return ApplicationDescriptionValidationError.toShort;
//     } else {
//       return null;
//     }
//   }
// }
//
// extension ExtensionValidationDescriptionErrorL10n on ApplicationDescriptionInput {
//   String? errorL10n(BuildContext context) {
//     if (isValid) {
//       return null;
//     } else {
//       switch (error!) {
//         case ApplicationDescriptionValidationError.blank:
//           return context.l10n.validationBlankError;
//         case ApplicationDescriptionValidationError.toLong:
//           return context.l10n.feature_vendor_create_Validation_description_to_long;
//         case ApplicationDescriptionValidationError.toShort:
//           return context.l10n.feature_vendor_create_Validation_description_to_short;
//       }
//     }
//   }
// }
