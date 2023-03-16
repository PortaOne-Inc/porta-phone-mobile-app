import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import 'package:webtrit_configurator/core/exception/exception.dart';
import 'package:webtrit_configurator/share/share.dart';

import '../model/models.dart';
import '../usecase/usecase.dart';

part 'vendor_create_state.dart';

class VendorCreateCubit extends Cubit<VendorCreateState> {
  VendorCreateCubit({
    required this.vendorGetTemplateUsecase,
    required this.vendorCreateUsecase,
  }) : super(const VendorCreateState()) {
    _loadTemplate();
  }

  final UsecaseVendorGetTemplate vendorGetTemplateUsecase;
  final UsecaseVendorCreate vendorCreateUsecase;

  void updateNameChange(String name) {
    emit(state.copyWith(nameField: ApplicationNameInput.dirty(name)));
  }

  void updateDescriptionChange(String description) {
    emit(state.copyWith(descriptionField: ApplicationDescriptionInput.dirty(description)));
  }

  void validateAndTryCreateApplication() {
    if (_isValidFields()) {
      tryCreateApplication();
    } else {
      emit(
        state.copyWith(
          nameField: state.nameField.toDirty(),
          descriptionField: state.descriptionField.toDirty(),
        ),
      );
    }
  }

  void tryCreateApplication() async {
    try {
      await _createApplication(state.nameField.value, state.descriptionField.value);
    } on BaseException catch (e) {
      _showNotCaughtFailure(e.message);
    } on Exception catch (e) {
      _showNotCaughtFailure(e.toString());
    }
  }

  Future _createApplication(String name, String description) async {
    emit(AppProgressState(
      applicationModel: state.applicationModel,
      nameField: state.nameField,
      descriptionField: state.descriptionField,
    ));

    final model = ApplicationModel(
      uuid: state.applicationModel!.uuid,
      title: name,
      description: description,
      id: null,
    );
    await vendorCreateUsecase.execute(argument: model);

    emit(AppCreatedState(
      applicationModel: state.applicationModel,
      nameField: state.nameField,
      descriptionField: state.descriptionField,
    ));
  }

  void _showNotCaughtFailure(String message) {
    emit(AppNotCaughtFailure(
      message,
      applicationModel: state.applicationModel,
      nameField: state.nameField,
      descriptionField: state.descriptionField,
    ));
  }

  void _loadTemplate() async {
    final app = await vendorGetTemplateUsecase.execute();
    emit(AppSuccessState(
      applicationModel: app,
      nameField: state.nameField,
      descriptionField: state.descriptionField,
    ));
  }

  bool _isValidFields() {
    return Formz.validate([state.nameField, state.descriptionField]);
  }
}
