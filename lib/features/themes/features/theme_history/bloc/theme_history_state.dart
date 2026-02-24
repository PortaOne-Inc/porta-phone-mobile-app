part of 'theme_history_cubit.dart';

enum ThemeHistoryStatus { initial, loading, loaded, failure }

@freezed
sealed class ThemeHistoryState with _$ThemeHistoryState {
  const factory ThemeHistoryState({
    required ThemeHistoryStatus status,
    @Default([]) List<ThemeHistoryEntryModel> items,
    String? nextCursor,
    @Default(false) bool isLoadingMore,
    String? errorMessage,
  }) = _ThemeHistoryState;
}
