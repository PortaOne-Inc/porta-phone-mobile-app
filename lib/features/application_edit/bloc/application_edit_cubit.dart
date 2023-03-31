import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:webtrit_configurator/core/exception/exception.dart';
import 'package:webtrit_configurator/share/share.dart';

import '../model/models.dart';
import '../usecase/usecase.dart';

part 'application_edit_state.dart';

part 'application_edit_cubit.freezed.dart';

class ApplicationEditCubit extends Cubit<ApplicationEditState> {
  ApplicationEditCubit({
    required this.applicationEditUsecase,
    required this.applicationGetUsecase,
    required this.applicationId,
  }) : super(ApplicationEditState()) {
    tryGetApplication(applicationId);
  }

  final String applicationId;
  final UsecaseApplicationEdit applicationEditUsecase;
  final UsecaseApplicationGet applicationGetUsecase;

  void updateNameChange(String name) {
    emit(state.copyWithValidation(
      nameInput: ApplicationNameInput.dirty(name),
    ));
  }

  void updateApplicationIdentifier(String identifier) {
    emit(state.copyWithValidation(
      applicationIdentifierInput: ApplicationIdentifierInput.dirty(identifier),
    ));
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
      emit(state.copyWithError(exception: e));
    }
  }

  void tryGetApplication(String id) async {
    try {
      emit(state.copyWithProgress());
      final app = await applicationGetUsecase.execute(id: id);
      emit(ApplicationEditState.init(
        applicationIdentifierInput: ApplicationIdentifierInput.dirty(app.platformIdentifier ?? ''),
        nameInput: ApplicationNameInput.dirty(app.name ?? ''),
      ));
    } on BaseException catch (e) {
      emit(state.copyWithError(exception: e));
    }
  }

  Future _editApplication({
    required String projectName,
    required String applicationIdentifier,
  }) async {
    emit(state.copyWithProgress());
    final model = ApplicationModel(
      id: applicationId,
      name: projectName,
      platformIdentifier: applicationIdentifier,
    );
    await applicationEditUsecase.execute(argument: model);
    emit(state.copyWithSuccess());
  }

  bool _isValidFields() {
    // TODO: ADD something more clearly for check nullable
    if (state.nameInput == null || state.applicationIdentifierInput == null) {
      return false;
    }
    return Formz.validate([
      state.nameInput!,
      state.applicationIdentifierInput!,
    ]);
  }
}
