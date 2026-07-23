import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'common_state.dart';

part 'common_bloc.freezed.dart';

class CommonBloc extends Cubit<CommonState> {
  CommonBloc({required this.usecaseAuthLogOut})
    : super(const CommonState.initial());
  UsecaseAuthLogOut usecaseAuthLogOut;

  Future<void> logout() async {
    await usecaseAuthLogOut.execute();
    emit(CommonState.logout(themeMode: state.themeMode));
    emit(CommonState.initial(themeMode: state.themeMode));
  }

  void setThemeMode(ThemeMode themeMode) {
    emit(CommonState.themeMode(themeMode: themeMode));
  }
}
