import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/theme_name_input.dart';

part 'theme_create_state.dart';

part 'theme_create_cubit.freezed.dart';

class ThemeCreateCubit extends Cubit<ThemeCreateState> {
  ThemeCreateCubit({
    required this.applicationId,
    required this.createThemeUseCase,
    required this.getTemplateThemeUseCase,
  }) : super(const ThemeCreateState(status: ThemeCreateStateStatus.initial));

  final UsecaseThemeCreate createThemeUseCase;
  final UsecaseThemeGetTemplate getTemplateThemeUseCase;
  final String applicationId;

  void updateNameChange(String name) {
    emit(state.copyWith(nameInput: ThemeNameInput.dirty(name)));
  }

  Future<void> tryCreateTheme() async {
    if (state.nameInput?.isValid ?? false) {
      await _tryCreateTheme(state.nameInput!.value);
    }
  }

  Future<void> _tryCreateTheme(String name) async {
    emit(state.copyWith(status: ThemeCreateStateStatus.progress));
    try {
      final defaultTheme = await getTemplateThemeUseCase.execute();
      final theme = await createThemeUseCase.execute(
        themeModel: defaultTheme.copyWith(
          name: name,
        ),
        colorsScheme: state.seedColor,
        applicationId: applicationId,
      );
      emit(state.copyWith(
        status: ThemeCreateStateStatus.success,
        themeModel: theme,
      ));
    } on BaseException catch (e) {
      emit(state.copyWith(error: e, status: ThemeCreateStateStatus.error));
    }
  }

  void updateSeedColor(Color color) {
    emit(state.copyWith(seedColor: color, status: ThemeCreateStateStatus.initial));
  }

  void deleteSeedColor() {
    emit(state.copyWith(seedColor: null, status: ThemeCreateStateStatus.initial));
  }
}
