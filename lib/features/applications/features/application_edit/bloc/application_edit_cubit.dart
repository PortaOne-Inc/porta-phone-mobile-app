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

  void updateAndroidPlatformId(String platformId) {
    emit(state.copyWith(androidPlatformIdInput: ApplicationIdentifierInput.dirty(platformId)));
  }

  void updateIosPlatformId(String platformId) {
    emit(state.copyWith(iosPlatformIdInput: ApplicationIdentifierInput.dirty(platformId)));
  }

  void updateAndroidBuildName(String buildName) {
    emit(state.copyWith(androidBuildNameInput: ApplicationBuildNameInput.dirty(buildName)));
  }

  void updateAndroidBuildNumber(String buildNumber) {
    emit(state.copyWith(androidBuildNumberInput: ApplicationBuildNumberInput.dirty(buildNumber)));
  }

  void updateIosBuildName(String buildName) {
    emit(state.copyWith(iosBuildNameInput: ApplicationBuildNameInput.dirty(buildName)));
  }

  void updateIosBuildNumber(String buildNumber) {
    emit(state.copyWith(iosBuildNumberInput: ApplicationBuildNumberInput.dirty(buildNumber)));
  }

  void updateCore(String core) {
    emit(state.copyWith(applicationCoreInput: ApplicationCoreInput.dirty(core)));
  }

  void updateTermsConditions(String core) {
    emit(state.copyWith(applicationTermsConditionsInput: ApplicationTermsConditionsInput.dirty(core)));
  }

  void validateAndTryCreateApplication() {
    if (_isValidFields()) {
      tryEditApplication();
    } else {
      final nameInput = state.nameInput ?? const ApplicationNameInput.dirty();

      emit(state.copyWith(nameInput: nameInput.toDirty()));
    }
  }

  Future<void> tryEditApplication() async {
    try {
      emit(state.copyWith(status: ApplicationEditStatus.loading));

      await applicationEditUsecase.execute(
        id: applicationId,
        name: state.nameInput!.value,
        platformIdentifier: state.applicationIdentifierInput!.value,
        androidPlatformId: state.androidPlatformIdInput!.value,
        iosPlatformId: state.iosPlatformIdInput!.value,
        androidVersion: BuildVersionModel(
          buildName: state.androidBuildNameInput!.value,
          buildNumber: int.tryParse(state.androidBuildNumberInput!.value),
        ),
        iosVersion: BuildVersionModel(
          buildName: state.iosBuildNameInput!.value,
          buildNumber: int.tryParse(state.iosBuildNumberInput!.value),
        ),
        coreUrl: state.applicationCoreInput!.value,
        termConditionsUrl: state.applicationTermsConditionsInput!.value,
        applicationAndroidGoogleServicesUrl: state.androidGoogleServicesUrl,
        applicationIosGoogleServicesUrl: state.iosGoogleServicesUrl,
        newIosGoogleServices: state.androidGoogleServices,
        newAndroidGoogleServices: state.androidGoogleServices,
      );

      emit(state.copyWith(status: ApplicationEditStatus.success));
      emit(state.copyWith(status: ApplicationEditStatus.initial));
    } on Exception catch (e) {
      emit(state.copyWith(exception: e, status: ApplicationEditStatus.error));
    }
  }

  Future<void> tryGetApplication(String id) async {
    try {
      emit(state.copyWith(status: ApplicationEditStatus.loading));
      final app = await applicationGetUsecase.execute(id: id);
      emit(
        ApplicationEditState(
          applicationIdentifierInput: ApplicationIdentifierInput.dirty(app.platformIdentifier ?? ''),
          androidPlatformIdInput: ApplicationIdentifierInput.dirty(app.androidPlatformId ?? ''),
          iosPlatformIdInput: ApplicationIdentifierInput.dirty(app.iosPlatformId ?? ''),
          androidBuildNameInput: ApplicationBuildNameInput.dirty(app.androidVersion?.buildName ?? ''),
          androidBuildNumberInput: ApplicationBuildNumberInput.dirty(app.androidVersion?.buildNumber?.toString() ?? ''),
          iosBuildNameInput: ApplicationBuildNameInput.dirty(app.iosVersion?.buildName ?? ''),
          iosBuildNumberInput: ApplicationBuildNumberInput.dirty(app.iosVersion?.buildNumber?.toString() ?? ''),
          nameInput: ApplicationNameInput.dirty(app.name ?? ''),
          applicationCoreInput: ApplicationCoreInput.dirty(app.coreUrl ?? ''),
          applicationTermsConditionsInput: ApplicationTermsConditionsInput.dirty(app.termsConditionsUrl ?? ''),
          androidGoogleServicesUrl: app.googleServices?.androidUrl,
          iosGoogleServicesUrl: app.googleServices?.iosUrl,
        ),
      );
    } on BaseException catch (e) {
      emit(state.copyWith(exception: e, status: ApplicationEditStatus.error));
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

  bool _isValidFields() {
    final nameInputEmpty = state.nameInput == null;
    if (nameInputEmpty) {
      return false;
    } else {
      return Formz.validate([state.nameInput!]);
    }
  }
}
