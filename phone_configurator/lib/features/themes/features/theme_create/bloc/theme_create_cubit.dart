import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/models/models.dart';

part 'theme_create_state.dart';

part 'theme_create_cubit.freezed.dart';

class ThemeCreateCubit extends Cubit<ThemeCreateState> {
  ThemeCreateCubit({
    required this.applicationId,
    required this.createThemeUseCase,
    required this.generateThemeUsecase,
    required AppConfig defaultFeatureAccess,
    required ThemeSettings defaultThemeConfig,
  }) : super(
         ThemeCreateState(
           status: ThemeCreateStateStatus.initial,
           defaultFeatureAccess: defaultFeatureAccess,
           defaultThemeConfig: defaultThemeConfig,
           useAi: false,
         ),
       );

  final UsecaseThemeCreate createThemeUseCase;
  final GenerateThemeUsecase generateThemeUsecase;
  final String applicationId;

  void updateNameChange(String name) {
    emit(state.copyWith(nameInput: ThemeNameInput.dirty(name)));
  }

  void updateDescription(String description) {
    emit(state.copyWith(description: description));
  }

  void updateUseAi(bool value) {
    emit(state.copyWith(useAi: value));
  }

  void updatePrompt(String value) {
    emit(state.copyWith(prompt: value));
  }

  /// ONE button handler
  Future<void> trySubmit() async {
    return (state.useAi ?? false) ? _doGenerate() : _doCreate();
  }

  Future<void> _doCreate() async {
    if (state.nameInput?.isNotValid ?? true) return;
    await _tx(() async {
      final theme = await createThemeUseCase.execute(
        applicationId: applicationId,
        title: state.nameInput!.value,
        description: state.description ?? '',
      );
      emit(state.copyWith(themeModel: theme));
    });
  }

  Future<void> _doGenerate() async {
    final prompt = (state.prompt ?? '').trim();
    if (prompt.isEmpty) {
      emit(
        state.copyWith(
          status: ThemeCreateStateStatus.error,
          error: BaseException(
            message: 'Prompt is required when AI generation is enabled',
          ),
        ),
      );
      return;
    }
    await _tx(() async {
      await generateThemeUsecase.execute(
        applicationId: applicationId,
        title: state.nameInput!.value,
        description: state.description ?? '',
        prompt: prompt,
      );
    });
  }

  Future<void> _tx(Future<void> Function() action) async {
    emit(state.copyWith(status: ThemeCreateStateStatus.progress));
    try {
      await action();
      emit(state.copyWith(status: ThemeCreateStateStatus.success));
    } on BaseException catch (e) {
      emit(state.copyWith(error: e, status: ThemeCreateStateStatus.error));
    } catch (e) {
      emit(state.copyWith(error: e, status: ThemeCreateStateStatus.error));
    }
  }
}
