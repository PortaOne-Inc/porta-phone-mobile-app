import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:webtrit_configurator/core/exception/exception.dart';
import 'package:webtrit_configurator/share/share.dart';

import '../model/models.dart';
import '../usecase/usecase.dart';

part 'vendor_create_state.dart';

part 'vendor_create_cubit.freezed.dart';

class VendorCreateCubit extends Cubit<VendorCreateState> {
  VendorCreateCubit({
    required this.vendorGetTemplateUsecase,
    required this.vendorCreateUsecase,
  }) : super(VendorCreateState()) {
    _loadTemplate();
  }

  final UsecaseVendorGetTemplate vendorGetTemplateUsecase;
  final UsecaseVendorCreate vendorCreateUsecase;

  void updateNameChange(String name) {
    emit(state.copyWithValidation(
      nameInput: ApplicationNameInput.dirty(name),
    ));
  }

  void updateDescriptionChange(String description) {
    emit(state.copyWithValidation(
      descriptionInput: ApplicationDescriptionInput.dirty(description),
    ));
  }

  void updateAndroidIdentifier(String identifier) {
    emit(state.copyWithValidation(
      applicationAndroidIdentifierInput: ApplicationAndroidIdentifierInput.dirty(identifier),
    ));
  }

  void updateIOSIdentifier(String identifier) {
    emit(state.copyWithValidation(
      applicationIOSIdentifierInput: ApplicationIOSIdentifierInput.dirty(identifier),
    ));
  }

  void validateAndTryCreateApplication() {
    if (_isValidFields()) {
      tryCreateApplication();
    } else {
      emit(state.copyWith(
        nameInput: state.nameInput?.toDirty(),
        descriptionInput: state.descriptionInput?.toDirty(),
      ));
    }
  }

  void tryCreateApplication() async {
    try {
      await _createApplication(
          projectName: state.nameInput!.value,
          projectDescription: state.descriptionInput!.value,
          iosIdentifier: state.applicationIOSIdentifierInput!.value,
          androidIdentifier: state.applicationAndroidIdentifierInput!.value);
    } on BaseException catch (e) {
      emit(state.copyWithError(exception: e));
    }
  }

  Future _createApplication({
    required String projectName,
    required String projectDescription,
    required String iosIdentifier,
    required String androidIdentifier,
  }) async {
    emit(state.copyWithProgress());
    final model = ApplicationModel(
      uuid: state.applicationTemplate!.uuid,
      title: projectName,
      description: projectDescription,
      id: null,
      iosIdentifier: iosIdentifier,
      androidIdentifier: androidIdentifier,
    );
    final result = await vendorCreateUsecase.execute(argument: model);
    emit(state.copyWithSuccess(applicationTemplate: result));
  }

  void _loadTemplate() async {
    final app = await vendorGetTemplateUsecase.execute();
    emit(state.copyWith(applicationTemplate: app));
  }

  bool _isValidFields() {
    // TODO: ADD something more clearly for check nullable
    if (state.nameInput == null ||
        state.descriptionInput == null ||
        state.applicationIOSIdentifierInput == null ||
        state.applicationAndroidIdentifierInput == null) {
      return false;
    }
    return Formz.validate([
      state.nameInput!,
      state.descriptionInput!,
      state.applicationIOSIdentifierInput!,
      state.applicationAndroidIdentifierInput!
    ]);
  }
}
