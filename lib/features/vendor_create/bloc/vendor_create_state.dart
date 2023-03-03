part of 'vendor_create_cubit.dart';

@immutable
class VendorCreateState {
  const VendorCreateState(
      {this.applicationModel,
      this.nameField = const ApplicationNameInput.pure(),
      this.descriptionField = const ApplicationDescriptionInput.pure()});

  final ApplicationNameInput nameField;
  final ApplicationDescriptionInput descriptionField;
  final ApplicationModel? applicationModel;

  ApplicationModel? get currentApp => applicationModel;

  VendorCreateState copyWith({
    final ApplicationNameInput? nameField,
    final ApplicationDescriptionInput? descriptionField,
    final ApplicationModel? applicationModel,
  }) {
    return VendorCreateState(
      nameField: nameField ?? this.nameField,
      descriptionField: descriptionField ?? this.descriptionField,
      applicationModel: applicationModel ?? this.applicationModel,
    );
  }
}

class AppProgressState extends VendorCreateState {
  const AppProgressState(
      {super.applicationModel,
      super.nameField = const ApplicationNameInput.pure(),
      super.descriptionField = const ApplicationDescriptionInput.pure()});
}

class AppSuccessState extends VendorCreateState {
  const AppSuccessState(
      {super.applicationModel,
      super.nameField = const ApplicationNameInput.pure(),
      super.descriptionField = const ApplicationDescriptionInput.pure()});
}

class AppCreatedState extends VendorCreateState {
  const AppCreatedState(
      {super.applicationModel,
      super.nameField = const ApplicationNameInput.pure(),
      super.descriptionField = const ApplicationDescriptionInput.pure()});
}

class AppNotCaughtFailure extends VendorCreateState {
  final String message;

  const AppNotCaughtFailure(this.message,
      {super.applicationModel,
      super.nameField = const ApplicationNameInput.pure(),
      super.descriptionField = const ApplicationDescriptionInput.pure()});
}
