import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'theme_history_state.dart';

part 'theme_history_cubit.freezed.dart';

class ThemeHistoryCubit extends Cubit<ThemeHistoryState> {
  ThemeHistoryCubit({
    required this.getThemeHistoryUsecase,
    required this.applicationId,
    required this.themeId,
  }) : super(const ThemeHistoryState(status: ThemeHistoryStatus.initial)) {
    load();
  }

  final GetThemeHistoryUsecase getThemeHistoryUsecase;
  final String applicationId;
  final String themeId;

  static const _pageSize = 20;

  Future<void> load() async {
    emit(state.copyWith(status: ThemeHistoryStatus.loading));
    try {
      final page = await getThemeHistoryUsecase.execute(
        applicationId: applicationId,
        themeId: themeId,
        limit: _pageSize,
      );
      emit(
        state.copyWith(
          status: ThemeHistoryStatus.loaded,
          items: page.items,
          nextCursor: page.nextCursor,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ThemeHistoryStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore || state.nextCursor == null) return;

    emit(state.copyWith(isLoadingMore: true));
    try {
      final page = await getThemeHistoryUsecase.execute(
        applicationId: applicationId,
        themeId: themeId,
        limit: _pageSize,
        startAfter: state.nextCursor,
      );
      emit(
        state.copyWith(
          items: [...state.items, ...page.items],
          nextCursor: page.nextCursor,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoadingMore: false, errorMessage: e.toString()));
    }
  }

  Future<void> createSnapshot({String? tag, String? description}) async {
    try {
      final entry = await getThemeHistoryUsecase.createSnapshot(
        applicationId: applicationId,
        themeId: themeId,
        tag: tag,
        description: description,
      );
      emit(state.copyWith(items: [entry, ...state.items]));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> updateEntry(
    String historyId, {
    String? tag,
    String? description,
  }) async {
    try {
      final updated = await getThemeHistoryUsecase.updateEntry(
        applicationId: applicationId,
        themeId: themeId,
        historyId: historyId,
        tag: tag,
        description: description,
      );
      final items = state.items
          .map((e) => e.id == historyId ? updated : e)
          .toList();
      emit(state.copyWith(items: items));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }
}
