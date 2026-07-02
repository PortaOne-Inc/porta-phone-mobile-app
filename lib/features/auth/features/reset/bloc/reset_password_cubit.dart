import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import '../models/auth_email_input.dart';

part 'reset_password_state.dart';

part 'reset_password_cubit.freezed.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.resetAuthPassword}) : super(ResetPasswordState());

  final ResetAuthPasswordUsecase resetAuthPassword;

  void authEmailChanged(String email) {
    emit(state.copyWithValidate(emailInput: AuthEmailInput.dirty(email)));
  }

  void validateAndTryLogin() {
    if (_isValidFields()) {
      _tryToReset();
    } else {
      emit(state.copyWith(emailInput: state.emailInput?.toDirty()));
    }
  }

  bool _isValidFields() {
    final emailInputEmpty = state.emailInput == null;

    if (emailInputEmpty) {
      return false;
    } else {
      return Formz.validate([state.emailInput!]);
    }
  }

  Future<void> _tryToReset() async {
    try {
      await _resetPassword(state.emailInput!.value);
    } on UnauthorizedException catch (_) {
      emit(state.copyWithError(failure: AuthException.invalidCredentials()));
    } on BaseException catch (e) {
      emit(state.copyWithError(failure: AuthException.another(message: e.message)));
    }
  }

  Future<void> _resetPassword(String email) async {
    emit(state.copyWithProgress());
    await resetAuthPassword.execute(email: email);
    emit(state.copyWithSuccess());
  }
}
