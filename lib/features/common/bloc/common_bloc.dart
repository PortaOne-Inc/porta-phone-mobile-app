import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../usecase/usecase.dart';

part 'common_state.dart';

part 'common_bloc.freezed.dart';

class CommonBloc extends Cubit<CommonState> {
  UsecaseAuthLogOut usecaseAuthLogOut;

  CommonBloc({
    required this.usecaseAuthLogOut,
  }) : super(const CommonState.initial());

  void logout() async {
    await usecaseAuthLogOut.execute();
    emit(const CommonState.logout());
    emit(const CommonState.initial());
  }

  void setThemeMode(ThemeMode themeMode) {
    emit(CommonState.themeMode(themeMode: themeMode));
  }
}
