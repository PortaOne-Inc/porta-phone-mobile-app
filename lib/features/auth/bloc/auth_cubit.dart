import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import 'package:webtrit_configurator/core/exception/exception.dart';

import '../models/model.dart';
import '../usecase/usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.usecaseAuthSignIn,
    required this.isUserAuthorized,
  }) : super(const AuthInit());

  final UsecaseAuthSignIn usecaseAuthSignIn;
  final UsecaseAuthIsLoggedIn isUserAuthorized;

  void authPasswordChanged(String password) {
    emit(state.copyWith(passwordError: AuthPasswordInput.dirty(password)));
  }

  void authEmailChanged(String email) {
    emit(state.copyWith(emailError: AuthEmailInput.dirty(email)));
  }

  Future<bool> isAuthorized() async {
    var isAuthorized = await isUserAuthorized.execute();
    return isAuthorized;
  }

  void validateAndTryLogin() {
    if (_isValidFields()) {
      tryLogin();
    } else {
      emit(AuthFailure(state.emailError.toDirty(), state.passwordError.toDirty()));
    }
  }

  void tryLogin() async {
    try {
      await _loginInServerSuccess(state.emailError.value, state.passwordError.value);
    } on AuthUserNotFountException catch (_) {
      _showNotUserNotFoundFailure();
    } on AuthWrongPasswordException catch (_) {
      _showWrongPasswordFailure();
    } on BaseException catch (e) {
      _showNotCaughtFailure(e.message);
    } on Exception catch (e) {
      _showNotCaughtFailure(e.toString());
    }
  }

  Future _loginInServerSuccess(String email, String password) async {
    emit(const AuthProgress());
    await usecaseAuthSignIn.execute(email: email, password: password);
    emit(const AuthLoginSuccess());
  }

  void _showNotCaughtFailure(String message) {
    emit(AuthNotCaughtFailure(message));
  }

  void _showWrongPasswordFailure() {
    emit(const AuthLoginUserWrongPasswordFailure());
  }

  void _showNotUserNotFoundFailure() {
    emit(const AuthLoginUserNotFoundFailure());
  }

  bool _isValidFields() {
    return Formz.validate([state.passwordError, state.emailError]).isValid;
  }
}
