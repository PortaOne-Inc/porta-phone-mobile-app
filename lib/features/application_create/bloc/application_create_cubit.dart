import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:webtrit_configurator/core/core.dart';

import '../model/models.dart';
import '../usecase/usecase.dart';

part 'application_create_state.dart';

part 'application_create_cubit.freezed.dart';

class ApplicationCreateCubit extends Cubit<ApplicationCreateState> {
  ApplicationCreateCubit({
    required this.applicationCreateUsecase,
  }) : super(ApplicationCreateState());

  final UsecaseApplicationCreate applicationCreateUsecase;

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
      tryCreateApplication();
    } else {
      final nameInput = state.nameInput ?? const ApplicationNameInput.dirty();
      final appIdentifier = state.applicationIdentifierInput ?? const ApplicationIdentifierInput.dirty();

      emit(state.copyWith(
        nameInput: nameInput.toDirty(),
        applicationIdentifierInput: appIdentifier.toDirty(),
      ));
    }
  }

  void tryCreateApplication() async {
    try {
      await _createApplication(
        projectName: state.nameInput!.value,
        applicationIdentifier: state.applicationIdentifierInput!.value,
      );
    } on BaseException catch (e) {
      emit(state.copyWithError(exception: e));
    }
  }

  Future _createApplication({
    required String projectName,
    required String applicationIdentifier,
  }) async {
    emit(state.copyWithProgress());
    final model = ApplicationModel(
      name: projectName,
      platformIdentifier: applicationIdentifier,
    );
    await applicationCreateUsecase.execute(argument: model);
    emit(state.copyWithSuccess());
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
