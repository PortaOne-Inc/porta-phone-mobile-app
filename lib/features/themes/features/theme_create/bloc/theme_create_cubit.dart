import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:webtrit_configurator/core/core.dart';

import '../model/theme_name_input.dart';
import '../usecase/usecase.dart';

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

  void tryCreateTheme() async {
    if (state.nameInput?.isValid == true) {
      await _tryCreateTheme(state.nameInput!.value);
    }
  }

  Future _tryCreateTheme(String name) async {
    emit(state.copyWith(status: ThemeCreateStateStatus.progress));
    try {
      final defaultTheme = await getTemplateThemeUseCase.execute();
      final theme = await createThemeUseCase.execute(
        themeModel: defaultTheme.copyWith(
          name: name,
        ),
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
}
