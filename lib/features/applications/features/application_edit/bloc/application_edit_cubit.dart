import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import '../../../model/models.dart';

part 'application_edit_state.dart';

part 'application_edit_cubit.freezed.dart';

class ApplicationEditCubit extends Cubit<ApplicationEditState> {
  ApplicationEditCubit({
    required this.updateApplicationUsecase,
    required this.applicationGetUsecase,
    required this.applicationId,
  }) : super(const ApplicationEditState()) {
    tryGetApplication(applicationId);
  }

  final String applicationId;
  final UpdateApplicationUsecase updateApplicationUsecase;
  final UsecaseApplicationGet applicationGetUsecase;

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
      tryEditApplication();
    } else {
      final nameInput = state.nameInput ?? const ApplicationNameInput.dirty();

      emit(state.copyWith(nameInput: nameInput.toDirty()));
    }
  }

  // TODO(Serdun): Use model instead of group of fields
  Future<void> tryEditApplication() async {
    try {
      emit(state.copyWith(status: ApplicationEditStatus.loading));

      updateApplicationUsecase.execute(
        ApplicationModel(
          id: applicationId,
          name: state.nameInput!.value,
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
        ),
      );

      emit(state.copyWith(status: ApplicationEditStatus.finish));
    } on Exception catch (e) {
      emit(state.copyWith(exception: e, status: ApplicationEditStatus.error));
    }
  }

  Future<void> tryGetApplication(String id) async {
    emit(state.copyWith(status: ApplicationEditStatus.loading));
    final app = await applicationGetUsecase.execute(id: id);
    emit(
      ApplicationEditState(
        status: ApplicationEditStatus.success,
        androidPlatformIdInput: ApplicationIdentifierInput.dirty(
          app.androidPlatformId ?? '',
        ),
        iosPlatformIdInput: ApplicationIdentifierInput.dirty(
          app.iosPlatformId ?? '',
        ),
        androidBuildNameInput: ApplicationBuildNameInput.dirty(
          app.androidVersion?.buildName ?? '',
        ),
        androidBuildNumberInput: ApplicationBuildNumberInput.dirty(
          app.androidVersion?.buildNumber?.toString() ?? '',
        ),
        iosBuildNameInput: ApplicationBuildNameInput.dirty(
          app.iosVersion?.buildName ?? '',
        ),
        iosBuildNumberInput: ApplicationBuildNumberInput.dirty(
          app.iosVersion?.buildNumber?.toString() ?? '',
        ),
        nameInput: ApplicationNameInput.dirty(app.name ?? ''),
      ),
    );
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
