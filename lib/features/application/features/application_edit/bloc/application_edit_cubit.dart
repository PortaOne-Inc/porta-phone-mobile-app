import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:webtrit_configurator/core/core.dart';

import '../../../model/models.dart';

import '../usecase/usecase.dart';

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

  void validateAndTryCreateApplication() {
    if (_isValidFields()) {
      tryEditApplication();
    } else {
      final nameInput = state.nameInput ?? const ApplicationNameInput.dirty();
      final appIdentifier = state.applicationIdentifierInput ?? const ApplicationIdentifierInput.dirty();

      emit(state.copyWith(
        nameInput: nameInput.toDirty(),
        applicationIdentifierInput: appIdentifier.toDirty(),
      ));
    }
  }

  void tryEditApplication() async {
    try {
      await _editApplication(
        projectName: state.nameInput!.value,
        applicationIdentifier: state.applicationIdentifierInput!.value,
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
          applicationModel: app,
          applicationIdentifierInput: ApplicationIdentifierInput.dirty(app.platformIdentifier ?? ''),
          nameInput: ApplicationNameInput.dirty(app.name ?? ''),
          status: ApplicationEditStatus.initial,
        ),
      );
    } on BaseException catch (e) {
      emit(state.copyWith(exception: e, status: ApplicationEditStatus.error));
    }
  }

  Future _editApplication({
    required String projectName,
    required String applicationIdentifier,
  }) async {
    emit(state.copyWith(status: ApplicationEditStatus.loading));
    final model = ApplicationModel(
      id: applicationId,
      name: projectName,
      platformIdentifier: applicationIdentifier,
    );
    await applicationEditUsecase.execute(argument: model);
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
    return state.nameInput == null || state.applicationIdentifierInput == null
        ? false
        : Formz.validate([
            state.nameInput!,
            state.applicationIdentifierInput!,
          ]);
  }
}
