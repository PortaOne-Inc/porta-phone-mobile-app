// part of '../bloc/deployment_cubit.dart';
//
//
//
// extension DeploymentCubitUtility on Cubit<DeploymentState> {
//   List<ApplicationValidateError> _validateApplication(ApplicationModel application) {
//     final validator = UtilityBuildValidator();
//     final errorReasons = <ApplicationValidateError>[];
//
//     if (!validator.isValidUrl(application.coreUrl)) {
//       errorReasons.add(ApplicationValidateError.invalidCoreUrl);
//     }
//     if (!validator.isValidUrl(application.termsConditionsUrl)) {
//       errorReasons.add(ApplicationValidateError.invalidTermsConditionsUrl);
//     }
//     if (!validator.isBuildVersionNameValid(application.androidVersion?.buildName)) {
//       errorReasons.add(ApplicationValidateError.invalidAndroidVersionName);
//     }
//     if (!validator.isBuildVersionNumberValid(application.androidVersion?.buildNumber)) {
//       errorReasons.add(ApplicationValidateError.invalidAndroidVersionNumber);
//     }
//     if (!validator.isBuildVersionNameValid(application.iosVersion?.buildName)) {
//       errorReasons.add(ApplicationValidateError.invalidIosVersionName);
//     }
//     if (!validator.isBuildVersionNumberValid(application.iosVersion?.buildNumber)) {
//       errorReasons.add(ApplicationValidateError.invalidIosVersionNumber);
//     }
//     if (!validator.isPlatformIdentifierValid(application.androidPlatformId)) {
//       errorReasons.add(ApplicationValidateError.invalidAndroidPlatformId);
//     }
//     if (!validator.isPlatformIdentifierValid(application.iosPlatformId)) {
//       errorReasons.add(ApplicationValidateError.invalidIosPlatformId);
//     }
//
//     return errorReasons;
//   }
// }
