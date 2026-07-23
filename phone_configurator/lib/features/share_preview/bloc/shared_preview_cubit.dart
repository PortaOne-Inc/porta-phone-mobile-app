import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'shared_preview_state.dart';

part 'shared_preview_cubit.freezed.dart';

class SharedPreviewCubit extends Cubit<SharedPreviewState> {
  SharedPreviewCubit({
    required this.token,
    required GetSharedThemePreviewUsecase getSharedThemePreviewUsecase,
  })  : _getSharedThemePreviewUsecase = getSharedThemePreviewUsecase,
        super(const SharedPreviewState.loading()) {
    _load();
  }

  final String token;
  final GetSharedThemePreviewUsecase _getSharedThemePreviewUsecase;

  Future<void> _load() async {
    try {
      final data = await _getSharedThemePreviewUsecase.execute(token: token);
      emit(SharedPreviewState.loaded(data));
    } on BaseException catch (e) {
      emit(SharedPreviewState.error(e.message));
    } catch (e) {
      emit(SharedPreviewState.error(e.toString()));
    }
  }

  void retry() {
    emit(const SharedPreviewState.loading());
    _load();
  }
}
