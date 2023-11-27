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
  }

  final String? applicationId;
  final String? themeId;

  final UsecaseThemeGet getThemeUseCase;
  final UsecaseApplicationGet getApplicationUseCase;

  Future<void> _tryGetTheme() async {
    try {
      emit(state.copyWith(status: ThemePreviewStatus.progress));

      final model = await getThemeUseCase.execute();
      final application = await getApplicationUseCase.execute(id: applicationId!);

      emit(state.copyWith(status: ThemePreviewStatus.success, theme: model, applicationModel: application));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: ThemePreviewStatus.error,
        error: e,
      ));
    }
  }
}
