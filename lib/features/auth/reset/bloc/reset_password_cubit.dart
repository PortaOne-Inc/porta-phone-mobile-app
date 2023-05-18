import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webtrit_configurator/share/exception/exception.dart';

import '../models/auth_email_input.dart';
import '../usecase/usecase.dart';

part 'reset_password_state.dart';

part 'reset_password_cubit.freezed.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({
    required this.usecaseAuthResetPassword,
  }) : super(ResetPasswordState());

  final UsecaseAuthResetPassword usecaseAuthResetPassword;

  void authEmailChanged(String email) {
    emit(
      state.copyWithValidate(
        emailInput: AuthEmailInput.dirty(email),
      ),
    );
  }

  void validateAndTryLogin() {
    if (_isValidFields()) {
      _tryToReset();
    } else {
      emit(
        state.copyWith(
          emailInput: state.emailInput?.toDirty(),
        ),
      );
    }
  }

  bool _isValidFields() {
    return state.emailInput == null ? false : Formz.validate([state.emailInput!]);
  }

  void _tryToReset() async {
    try {
      await _resetPassword(state.emailInput!.value);
    } on AuthUserNotFountException catch (_) {
      emit(state.copyWithError(failure: AuthException.noUser()));
    } on AuthWrongPasswordException catch (_) {
      emit(state.copyWithError(failure: AuthException.wrongPassword()));
    } on BaseException catch (e) {
      emit(state.copyWithError(failure: AuthException.another(message: e.message)));
    }
  }

  Future _resetPassword(String email) async {
    emit(state.copyWithProgress());
    await usecaseAuthResetPassword.execute(email: email);
    emit(state.copyWithSuccess());
  }
}
