part of 'vendor_create_cubit.dart';

@freezed
class VendorCreateState with _$VendorCreateState {
  VendorCreateState._();

  factory VendorCreateState(
      {ApplicationModel? applicationTemplate,
      ApplicationNameInput? nameInput,
      ApplicationDescriptionInput? descriptionInput,
      ApplicationIOSIdentifierInput? applicationIOSIdentifierInput,
      ApplicationAndroidIdentifierInput? applicationAndroidIdentifierInput}) = _VendorCreateState;

  factory VendorCreateState.progress({
    ApplicationModel? applicationTemplate,
    ApplicationNameInput? nameInput,
    ApplicationDescriptionInput? descriptionInput,
    ApplicationIOSIdentifierInput? applicationIOSIdentifierInput,
    ApplicationAndroidIdentifierInput? applicationAndroidIdentifierInput,
  }) = VendorCreateStateProgress;

  factory VendorCreateState.success({
    ApplicationModel? applicationTemplate,
    ApplicationNameInput? nameInput,
    ApplicationDescriptionInput? descriptionInput,
    ApplicationIOSIdentifierInput? applicationIOSIdentifierInput,
    ApplicationAndroidIdentifierInput? applicationAndroidIdentifierInput,
  }) = VendorCreateStateSuccess;

  factory VendorCreateState.validation({
    ApplicationModel? applicationTemplate,
    ApplicationNameInput? nameInput,
    ApplicationDescriptionInput? descriptionInput,
    ApplicationIOSIdentifierInput? applicationIOSIdentifierInput,
    ApplicationAndroidIdentifierInput? applicationAndroidIdentifierInput,
  }) = VendorCreateStateValidation;

  factory VendorCreateState.error({
    ApplicationModel? applicationTemplate,
    ApplicationNameInput? nameInput,
    ApplicationDescriptionInput? descriptionInput,
    ApplicationIOSIdentifierInput? applicationIOSIdentifierInput,
    ApplicationAndroidIdentifierInput? applicationAndroidIdentifierInput,
    Exception? exception,
  }) = VendorCreateStateError;
}

extension _StateCopyWith on VendorCreateState {
  VendorCreateState copyWithValidation({
    ApplicationModel? applicationTemplate,
    ApplicationNameInput? nameInput,
    ApplicationDescriptionInput? descriptionInput,
    ApplicationIOSIdentifierInput? applicationIOSIdentifierInput,
    ApplicationAndroidIdentifierInput? applicationAndroidIdentifierInput,
  }) {
    return VendorCreateState.validation(
      applicationTemplate: applicationTemplate ?? this.applicationTemplate,
      nameInput: nameInput ?? this.nameInput,
      descriptionInput: descriptionInput ?? this.descriptionInput,
      applicationIOSIdentifierInput: applicationIOSIdentifierInput ?? this.applicationIOSIdentifierInput,
      applicationAndroidIdentifierInput: applicationAndroidIdentifierInput ?? this.applicationAndroidIdentifierInput,
    );
  }

  VendorCreateState copyWithProgress({
    ApplicationModel? applicationTemplate,
    ApplicationNameInput? nameInput,
    ApplicationDescriptionInput? descriptionInput,
    ApplicationIOSIdentifierInput? applicationIOSIdentifierInput,
    ApplicationAndroidIdentifierInput? applicationAndroidIdentifierInput,
  }) {
    return VendorCreateState.progress(
      applicationTemplate: applicationTemplate ?? this.applicationTemplate,
      nameInput: nameInput ?? this.nameInput,
      descriptionInput: descriptionInput ?? this.descriptionInput,
      applicationIOSIdentifierInput: applicationIOSIdentifierInput ?? this.applicationIOSIdentifierInput,
      applicationAndroidIdentifierInput: applicationAndroidIdentifierInput ?? this.applicationAndroidIdentifierInput,
    );
  }

  VendorCreateState copyWithSuccess({
    ApplicationModel? applicationTemplate,
    ApplicationNameInput? nameInput,
    ApplicationDescriptionInput? descriptionInput,
    ApplicationIOSIdentifierInput? applicationIOSIdentifierInput,
    ApplicationAndroidIdentifierInput? applicationAndroidIdentifierInput,
  }) {
    return VendorCreateState.success(
      applicationTemplate: applicationTemplate ?? this.applicationTemplate,
      nameInput: nameInput ?? this.nameInput,
      descriptionInput: descriptionInput ?? this.descriptionInput,
      applicationIOSIdentifierInput: applicationIOSIdentifierInput ?? this.applicationIOSIdentifierInput,
      applicationAndroidIdentifierInput: applicationAndroidIdentifierInput ?? this.applicationAndroidIdentifierInput,
    );
  }

  VendorCreateState copyWithError(
      {ApplicationModel? applicationTemplate,
      ApplicationNameInput? nameInput,
      ApplicationDescriptionInput? descriptionInput,
      ApplicationIOSIdentifierInput? applicationIOSIdentifierInput,
      ApplicationAndroidIdentifierInput? applicationAndroidIdentifierInput,
      BaseException? exception}) {
    return VendorCreateState.error(
        applicationTemplate: applicationTemplate ?? this.applicationTemplate,
        nameInput: nameInput ?? this.nameInput,
        descriptionInput: descriptionInput ?? this.descriptionInput,
        applicationIOSIdentifierInput: applicationIOSIdentifierInput ?? this.applicationIOSIdentifierInput,
        applicationAndroidIdentifierInput: applicationAndroidIdentifierInput ?? this.applicationAndroidIdentifierInput,
        exception: exception);
  }
}
