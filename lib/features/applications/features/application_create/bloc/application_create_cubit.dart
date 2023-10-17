import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import '../../../model/models.dart';

part 'application_create_state.dart';

part 'application_create_cubit.freezed.dart';

class ApplicationCreateCubit extends Cubit<ApplicationCreateState> {
  ApplicationCreateCubit({
    required this.applicationCreateUsecase,
  }) : super(const ApplicationCreateState());

  final ApplicationCreate applicationCreateUsecase;

  void updateNameChange(String name) {
    emit(state.copyWith(nameInput: ApplicationNameInput.dirty(name)));
  }

  void updateApplicationIdentifier(String identifier) {
    emit(state.copyWith(applicationIdentifierInput: ApplicationIdentifierInput.dirty(identifier)));
  }

  void updateCore(String core) {
    emit(state.copyWith(applicationCoreInput: ApplicationCoreInput.dirty(core)));
  }

  void updateTermsConditions(String core) {
    emit(state.copyWith(applicationTermsConditionsInput: ApplicationTermsConditionsInput.dirty(core)));
  }

  void validateAndTryCreateApplication() {
    if (_isValidFields()) {
      tryCreateApplication();
    } else {
      final nameInput = state.nameInput ?? const ApplicationNameInput.dirty();
      final appIdentifier = state.applicationIdentifierInput ?? const ApplicationIdentifierInput.dirty();
      final appCore = state.applicationCoreInput ?? const ApplicationCoreInput.dirty();

      emit(state.copyWith(
          nameInput: nameInput.toDirty(),
          applicationIdentifierInput: appIdentifier.toDirty(),
          applicationCoreInput: appCore));
    }
  }

  void tryCreateApplication() async {
    try {
      await _createApplication(
        projectName: state.nameInput!.value,
        applicationIdentifier: state.applicationIdentifierInput!.value,
        coreUrl: state.applicationCoreInput!.value,
        termConditionsUrl: state.applicationTermsConditionsInput!.value,
        iosGoogleServices: state.iosGoogleServices,
        androidGoogleServices: state.androidGoogleServices,
      );
    } on BaseException catch (e) {
      emit(state.copyWith(exception: e, status: ApplicationCreateStatus.error));
    }
  }

  Future<void> chooseIosGoogleServices() async {
    if (state.iosGoogleServices == null) {
      final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['plist']);
      emit(state.copyWith(iosGoogleServices: result?.files.first.bytes));
    } else {
      emit(state.copyWith(iosGoogleServices: null));
    }
  }

  Future<void> chooseAndroidServices() async {
    if (state.androidGoogleServices == null) {
      final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['json']);
      emit(state.copyWith(androidGoogleServices: result?.files.first.bytes));
    } else {
      emit(state.copyWith(androidGoogleServices: null));
    }
  }

  Future _createApplication({
    required String projectName,
    required String applicationIdentifier,
    String? coreUrl,
    String? termConditionsUrl,
    Uint8List? iosGoogleServices,
    Uint8List? androidGoogleServices,
  }) async {
    emit(state.copyWith(status: ApplicationCreateStatus.loading));

    await applicationCreateUsecase.execute(
      name: projectName,
      platformIdentifier: applicationIdentifier,
      coreUrl: coreUrl,
      termConditionsUrl: termConditionsUrl,
      iosGoogleServices: iosGoogleServices,
      androidGoogleServices: androidGoogleServices,
    );

    emit(state.copyWith(status: ApplicationCreateStatus.success));
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
