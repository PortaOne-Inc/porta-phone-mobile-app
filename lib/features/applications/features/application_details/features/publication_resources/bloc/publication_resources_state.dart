part of 'publication_resources_cubit.dart';

enum PubResStatus { initial, loading, loaded, failure }

@freezed
sealed class PublicationResourcesState with _$PublicationResourcesState {
  const factory PublicationResourcesState({
    @Default(PubResStatus.initial) PubResStatus status,
    @Default(<PublicationResourceModel>[]) List<PublicationResourceModel> items,
    String? error,

    // create
    @Default(false) bool creating,
    String? createError,

    // update
    @Default(<String>{}) Set<String> updatingIds,
    String? updateError,

    // delete
    @Default(<String>{}) Set<String> deletingIds,
    String? deleteError,
  }) = _PublicationResourcesState;
}
