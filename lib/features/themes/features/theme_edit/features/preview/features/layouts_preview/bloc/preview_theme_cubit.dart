import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preview_theme_state.dart';

part 'preview_theme_cubit.freezed.dart';

class PreviewThemeCubit extends Cubit<PreviewThemeState> {
  PreviewThemeCubit() : super(const PreviewThemeState(frameVisible: true));

  void setFrame(bool frame) {
    emit(state.copyWith(frameVisible: frame));
  }
}
