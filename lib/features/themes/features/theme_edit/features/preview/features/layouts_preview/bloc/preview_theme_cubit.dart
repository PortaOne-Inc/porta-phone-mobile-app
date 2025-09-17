import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:webtrit_configurator/features/themes/widgets/widgets.dart';

part 'preview_theme_state.dart';

part 'preview_theme_cubit.freezed.dart';

class PreviewThemeCubit extends Cubit<PreviewThemeState> {
  PreviewThemeCubit()
      : super(const PreviewThemeState(
          frameVisible: true,
          previewType: PreviewType.single,
        ));

  void setScale(PreviewType scale) {
    emit(state.copyWith(previewType: scale));
  }

  void setFrame(bool frame) {
    emit(state.copyWith(frameVisible: frame));
  }
}
