import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'preview_mode.dart';

part 'preview_theme_state.dart';

part 'preview_theme_cubit.freezed.dart';

class PreviewThemeCubit extends Cubit<PreviewThemeState> {
  PreviewThemeCubit() : super(const PreviewThemeState(frameVisible: true, mode: PreviewMode.static));

  void setFrame(bool frame) {
    emit(state.copyWith(frameVisible: frame));
  }

  void setMode(PreviewMode mode) {
    emit(state.copyWith(mode: mode));
  }

  void setDartDefineOverrides(Map<String, String> overrides) {
    emit(state.copyWith(dartDefineOverrides: Map<String, String>.unmodifiable(overrides)));
  }

  void clearDartDefineOverrides() {
    emit(state.copyWith(dartDefineOverrides: const {}));
  }
}
