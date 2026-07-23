import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import '../../../model/models.dart';

part 'application_create_state.dart';

part 'application_create_cubit.freezed.dart';

class ApplicationCreateCubit extends Cubit<ApplicationCreateState> {
  ApplicationCreateCubit({required this.applicationCreateUsecase})
    : super(const ApplicationCreateState());

  final ApplicationCreate applicationCreateUsecase;

  void updateNameChange(String name) {
    emit(state.copyWith(nameInput: ApplicationNameInput.dirty(name)));
  }

  void updateAndroidPlatformId(String platformId) {
    emit(
      state.copyWith(
        androidPlatformIdInput: ApplicationIdentifierInput.dirty(platformId),
      ),
    );
  }

  void updateIosPlatformId(String platformId) {
    emit(
      state.copyWith(
        iosPlatformIdInput: ApplicationIdentifierInput.dirty(platformId),
      ),
    );
  }

  void updateAndroidBuildName(String buildName) {
    emit(
      state.copyWith(
        androidBuildNameInput: ApplicationBuildNameInput.dirty(buildName),
      ),
    );
  }

  void updateAndroidBuildNumber(String buildNumber) {
    emit(
      state.copyWith(
        androidBuildNumberInput: ApplicationBuildNumberInput.dirty(buildNumber),
      ),
    );
  }

  void updateIosBuildName(String buildName) {
    emit(
      state.copyWith(
        iosBuildNameInput: ApplicationBuildNameInput.dirty(buildName),
      ),
    );
  }

  void updateIosBuildNumber(String buildNumber) {
    emit(
      state.copyWith(
        iosBuildNumberInput: ApplicationBuildNumberInput.dirty(buildNumber),
      ),
    );
  }

  void validateAndTryCreateApplication() {
    if (_isValidFields()) {
      tryCreateApplication();
    } else {
      final nameInput = state.nameInput ?? const ApplicationNameInput.dirty();

      emit(state.copyWith(nameInput: nameInput.toDirty()));
    }
  }

  Future<void> tryCreateApplication() async {
    try {
      await _createApplication(
        projectName: state.nameInput!.value,
        androidPlatformId: state.androidPlatformIdInput?.value,
        iosPlatformId: state.iosPlatformIdInput?.value,
        androidVersion: BuildVersionModel(
          buildName: state.androidBuildNameInput?.value,
          buildNumber: int.tryParse(state.androidBuildNumberInput?.value ?? ''),
        ),
        iosVersion: BuildVersionModel(
          buildName: state.iosBuildNameInput?.value,
          buildNumber: int.tryParse(state.iosBuildNumberInput?.value ?? ''),
        ),
      );
    } on BaseException catch (e) {
      emit(state.copyWith(exception: e, status: ApplicationCreateStatus.error));
    }
  }

  Future<void> _createApplication({
    required String projectName,
    String? androidPlatformId,
    String? iosPlatformId,
    BuildVersionModel? androidVersion,
    BuildVersionModel? iosVersion,
  }) async {
    emit(state.copyWith(status: ApplicationCreateStatus.loading));

    await applicationCreateUsecase.execute(
      name: projectName,
      androidPlatformId: androidPlatformId,
      iosPlatformId: iosPlatformId,
      androidVersion: androidVersion,
      iosVersion: iosVersion,
    );

    emit(state.copyWith(status: ApplicationCreateStatus.success));
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
