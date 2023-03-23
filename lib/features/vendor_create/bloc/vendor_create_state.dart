part of 'vendor_create_cubit.dart';

@freezed
class VendorCreateState with _$VendorCreateState {
  VendorCreateState._();

  factory VendorCreateState({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) = _VendorCreateState;

  factory VendorCreateState.progress({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) = VendorCreateStateProgress;

  factory VendorCreateState.success({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) = VendorCreateStateSuccess;

  factory VendorCreateState.validation({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) = VendorCreateStateValidation;

  factory VendorCreateState.error({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
    Exception? exception,
  }) = VendorCreateStateError;
}

extension _StateCopyWith on VendorCreateState {
  VendorCreateState copyWithValidation({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) {
    return VendorCreateState.validation(
      nameInput: nameInput ?? this.nameInput,
      applicationIdentifierInput: applicationIdentifierInput ?? this.applicationIdentifierInput,
    );
  }

  VendorCreateState copyWithProgress({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) {
    return VendorCreateState.progress(
      nameInput: nameInput ?? this.nameInput,
      applicationIdentifierInput: applicationIdentifierInput ?? this.applicationIdentifierInput,
    );
  }

  VendorCreateState copyWithSuccess({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
  }) {
    return VendorCreateState.success(
      nameInput: nameInput ?? this.nameInput,
      applicationIdentifierInput: applicationIdentifierInput ?? this.applicationIdentifierInput,
    );
  }

  VendorCreateState copyWithError({
    ApplicationNameInput? nameInput,
    ApplicationIdentifierInput? applicationIdentifierInput,
    BaseException? exception,
  }) {
    return VendorCreateState.error(
        nameInput: nameInput ?? this.nameInput,
        applicationIdentifierInput: applicationIdentifierInput ?? this.applicationIdentifierInput,
        exception: exception);
  }
}
