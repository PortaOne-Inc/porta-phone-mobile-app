import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

import 'package:domain/domain.dart';

part 'theme_preview_state.dart';

part 'theme_preview_cubit.freezed.dart';

class ThemePreviewCubit extends Cubit<ThemePreviewState> {
  ThemePreviewCubit({
    required this.getThemeUseCase,
    required this.getApplicationUseCase,
    this.applicationId,
    this.themeId,
  }) : super(ThemePreviewState(status: ThemePreviewStatus.progress)) {
    _tryGetTheme();
    _tryGetApplication();
  }

  final String? applicationId;
  final String? themeId;

  final UsecaseThemeGet getThemeUseCase;
  final UsecaseApplicationGet getApplicationUseCase;

  Future<void> _tryGetTheme() async {
    try {
      emit(state.copyWith(status: ThemePreviewStatus.progress));

      final model = await getThemeUseCase.execute();

      emit(state.copyWith(status: ThemePreviewStatus.success, theme: model));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: ThemePreviewStatus.error,
        error: e,
      ));
    }
  }

  Future<void> _tryGetApplication() async {
    try {
      emit(state.copyWith(status: ThemePreviewStatus.progress));
      final application = await getApplicationUseCase.execute(id: applicationId!);

      emit(state.copyWith(status: ThemePreviewStatus.success, applicationModel: application));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: ThemePreviewStatus.error,
        error: e,
      ));
    }
  }
}
