part of 'manage_embeds_cubit.dart';

enum ManageEmbedsStatus { initial, loading, loaded, failure }

@freezed
sealed class ManageEmbedsState with _$ManageEmbedsState {
  const factory ManageEmbedsState({
    @Default(ManageEmbedsStatus.initial) ManageEmbedsStatus status,
    @Default(<EmbeddedResourceModel>[]) List<EmbeddedResourceModel> items,
    String? error,

    // create
    @Default(false) bool creating,
    String? createError,

    // delete
    @Default(<String>{}) Set<String> deletingIds,
    String? deleteError,

    String? routeEmbedId,
  }) = _ManageEmbedsState;
}
