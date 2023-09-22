import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import '../../../model/models.dart';

part 'application_edit_state.dart';

part 'application_edit_cubit.freezed.dart';

class ApplicationEditCubit extends Cubit<ApplicationEditState> {
  ApplicationEditCubit({
    required this.applicationEditUsecase,
    required this.applicationGetUsecase,
    required this.applicationId,
  }) : super(const ApplicationEditState()) {
    tryGetApplication(applicationId);
  }

  final String applicationId;
  final UsecaseApplicationEdit applicationEditUsecase;
  final UsecaseApplicationGet applicationGetUsecase;

  void updateNameChange(String name) {
    emit(state.copyWith(nameInput: ApplicationNameInput.dirty(name)));
  }

  void updateApplicationIdentifier(String identifier) {
    emit(state.copyWith(applicationIdentifierInput: ApplicationIdentifierInput.dirty(identifier)));
  }

  void updateCore(String core) {
    emit(state.copyWith(applicationCoreInput: ApplicationCoreInput.dirty(core)));
  }

  void validateAndTryCreateApplication() {
    if (_isValidFields()) {
      tryEditApplication();
    } else {
      final nameInput = state.nameInput ?? const ApplicationNameInput.dirty();
      final appIdentifier = state.applicationIdentifierInput ?? const ApplicationIdentifierInput.dirty();
      final appCore = state.applicationCoreInput ?? const ApplicationCoreInput.dirty();

      emit(state.copyWith(
          nameInput: nameInput.toDirty(),
          applicationIdentifierInput: appIdentifier.toDirty(),
          applicationCoreInput: appCore.toDirty()));
    }
  }

  void tryEditApplication() async {
    try {
      await _editApplication(
        projectName: state.nameInput!.value,
        applicationIdentifier: state.applicationIdentifierInput!.value,
        coreUrl: state.applicationCoreInput!.value,
      );
    } on BaseException catch (e) {
      emit(state.copyWith(exception: e, status: ApplicationEditStatus.error));
    }
  }

  void tryGetApplication(String id) async {
    try {
      emit(state.copyWith(status: ApplicationEditStatus.loading));
      final app = await applicationGetUsecase.execute(id: id);
      emit(
        ApplicationEditState(
          applicationIdentifierInput: ApplicationIdentifierInput.dirty(app.platformIdentifier ?? ''),
          nameInput: ApplicationNameInput.dirty(app.name ?? ''),
          status: ApplicationEditStatus.initial,
          androidGoogleServicesUrl: app.googleServices?.androidUrl,
          iosGoogleServicesUrl: app.googleServices?.iosUrl,
        ),
      );
    } on BaseException catch (e) {
      emit(state.copyWith(exception: e, status: ApplicationEditStatus.error));
    }
  }

  Future _editApplication({
    required String projectName,
    required String applicationIdentifier,
    String? coreUrl,
  }) async {
    emit(state.copyWith(status: ApplicationEditStatus.loading));

    await applicationEditUsecase.execute(
      id: applicationId,
      name: projectName,
      platformIdentifier: applicationIdentifier,
      coreUrl: coreUrl,
      applicationAndroidGoogleServicesUrl: state.androidGoogleServicesUrl,
      applicationIosGoogleServicesUrl: state.iosGoogleServicesUrl,
      newIosGoogleServices: state.androidGoogleServices,
      newAndroidGoogleServices: state.androidGoogleServices,
    );

    emit(state.copyWith(status: ApplicationEditStatus.success));
  }

  Future<void> chooseIosGoogleServices() async {
    if (state.iosGoogleServices == null) {
      final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['plist']);
      emit(state.copyWith(iosGoogleServices: result?.files.first.bytes));
    } else {
      emit(state.copyWith(iosGoogleServices: null));
    }
  }

  Future<void> chooseIosAndroidServices() async {
    if (state.androidGoogleServices == null) {
      final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['json']);
      emit(state.copyWith(androidGoogleServices: result?.files.first.bytes));
    } else {
      emit(state.copyWith(androidGoogleServices: null));
    }
  }

  bool _isValidFields() {
    return state.nameInput == null || state.applicationIdentifierInput == null || state.applicationCoreInput == null
        ? false
        : Formz.validate([
            state.nameInput!,
            state.applicationIdentifierInput!,
            state.applicationCoreInput!,
          ]);
  }
}
