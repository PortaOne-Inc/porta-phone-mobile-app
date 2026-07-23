part of 'embeds_cubit.dart';

enum EmbedsStatus { initial, loading, loaded, failure }

@freezed
sealed class EmbedsState with _$EmbedsState {
  const factory EmbedsState({
    @Default(EmbedsStatus.initial) EmbedsStatus status,
    @Default(<EmbeddedResourceModel>[]) List<EmbeddedResourceModel> items,
    String? errorMessage,

    // delete
    @Default(<String>{}) Set<String> deletingIds,
    String? deleteError,

    // create
    @Default(false) bool creating,
    String? createError,

    // update
    @Default(<String>{}) Set<String> updatingIds,
    String? updateError,
  }) = _EmbedsState;
}
