import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:webtrit_configurator/share/exception/exception.dart';

import '../models/model.dart';
import '../usecase/usecase.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.usecaseAuthSignIn,
    required this.isUserAuthorized,
  }) : super(AuthState());

  final UsecaseAuthSignIn usecaseAuthSignIn;
  final UsecaseAuthIsLoggedIn isUserAuthorized;

  void authPasswordChanged(String password) {
    emit(state.copyWithValidate(
      passwordInput: AuthPasswordInput.dirty(password),
    ));
  }

  void authEmailChanged(String email) {
    emit(
      state.copyWithValidate(
        emailInput: AuthEmailInput.dirty(email),
      ),
    );
  }

  void validateAndTryLogin() {
    if (_isValidFields()) {
      _tryLogin();
    } else {
      emit(
        state.copyWith(
          passwordInput: state.passwordInput?.toDirty(),
          emailInput: state.emailInput?.toDirty(),
        ),
      );
    }
  }

  void _tryLogin() async {
    try {
      await _loginInServerSuccess(state.emailInput!.value, state.passwordInput!.value);
    } on AuthUserNotFountException catch (_) {
      emit(state.copyWithError(failure: AuthException.noUser()));
    } on AuthWrongPasswordException catch (_) {
      emit(state.copyWithError(failure: AuthException.wrongPassword()));
    } on BaseException catch (e) {
      emit(state.copyWithError(failure: AuthException.another(message: e.message)));
    }
  }

  Future _loginInServerSuccess(String email, String password) async {
    emit(state.copyWithProgress());
    await usecaseAuthSignIn.execute(email: email, password: password);
    emit(state.copyWithSuccess());
  }

  bool _isValidFields() {
    return state.passwordInput == null || state.emailInput == null
        ? false
        : Formz.validate([state.passwordInput!, state.emailInput!]);
  }
}
