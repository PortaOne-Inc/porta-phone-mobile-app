import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import '../models/model.dart';

part 'login_state.dart';

part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.signInUsecase, required this.getAuthStatusUsecase}) : super(LoginState());

  final SignInAuthUsecase signInUsecase;
  final GetAuthStatusUsecase getAuthStatusUsecase;

  void authPasswordChanged(String password) {
    emit(state.copyWithValidate(passwordInput: AuthPasswordInput.dirty(password)));
  }

  void authEmailChanged(String email) {
    emit(state.copyWithValidate(emailInput: AuthEmailInput.dirty(email)));
  }

  Future<void> validateAndTryLogin() async {
    if (_isValidFields()) {
      try {
        await _loginInServerSuccess(state.emailInput!.value, state.passwordInput!.value);
      } on UnauthorizedException catch (_) {
        emit(state.copyWithError(failure: AuthException.invalidCredentials()));
      } on BaseException catch (e) {
        emit(state.copyWithError(failure: AuthException.another(message: e.message)));
      } on Exception catch (e) {
        emit(state.copyWithError(failure: AuthException.another(message: e.toString())));
      }
    } else {
      emit(state.copyWith(passwordInput: state.passwordInput?.toDirty(), emailInput: state.emailInput?.toDirty()));
    }
  }

  Future<void> _loginInServerSuccess(String email, String password) async {
    emit(state.copyWithProgress());
    await signInUsecase.execute(email: email, password: password);
    emit(state.copyWithSuccess());
  }

  bool _isValidFields() {
    final passwordInputEmpty = state.passwordInput == null;
    final emailInputEmpty = state.emailInput == null;

    if (passwordInputEmpty || emailInputEmpty) {
      return false;
    } else {
      return Formz.validate([state.passwordInput!, state.emailInput!]);
    }
  }
}
