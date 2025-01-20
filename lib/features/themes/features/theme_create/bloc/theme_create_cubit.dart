
import 'package:bloc/bloc.dart';
import 'package:data/dto/theme/theme.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/theme_name_input.dart';

part 'theme_create_state.dart';

part 'theme_create_cubit.freezed.dart';

/// Handles the logic for creating a theme, including managing input validation,
/// communicating with the use case, and updating the UI state.
class ThemeCreateCubit extends Cubit<ThemeCreateState> {
  ThemeCreateCubit({
    required this.applicationId,
    required this.createThemeUseCase,
    required AppConfig defaultFeatureAccess,
    required ThemeSettings defaultThemeConfig,
  }) : super(ThemeCreateState(
          defaultFeatureAccess: defaultFeatureAccess,
          defaultThemeConfig: defaultThemeConfig,
          status: ThemeCreateStateStatus.initial,
        ));

  final UsecaseThemeCreate createThemeUseCase;
  final String applicationId;

  void updateNameChange(String name) {
    emit(state.copyWith(nameInput: ThemeNameInput.dirty(name)));
  }

  /// Triggers the theme creation process if the name input is valid.
  Future<void> tryCreateTheme() async {
    if (state.nameInput?.isNotValid ?? true) {
      return;
    }

    await _executeWithTransaction(() async {
      final theme = await createThemeUseCase.execute(
        applicationId: applicationId,
        themeModel: ThemeModel(
          name: state.nameInput!.value,
          appConfig: state.defaultFeatureAccess.toJson(),
          themeWidgetConfig: state.defaultThemeConfig.themeWidgetLightConfig.toJson(),
          themePageConfig: state.defaultThemeConfig.themePageLightConfig.toJson(),
          colorSchemeConfig: state.defaultThemeConfig.lightColorSchemeConfig.toJson(),
        ),
      );
      emit(state.copyWith(themeModel: theme));
    });
  }

  /// A reusable transaction handler that manages state transitions.
  Future<void> _executeWithTransaction(Future<void> Function() action) async {
    emit(state.copyWith(status: ThemeCreateStateStatus.progress));
    try {
      await action();
      emit(state.copyWith(
        status: ThemeCreateStateStatus.success,
      ));
    } on BaseException catch (e) {
      emit(state.copyWith(
        error: e,
        status: ThemeCreateStateStatus.error,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e,
        status: ThemeCreateStateStatus.error,
      ));
    }
  }
}
