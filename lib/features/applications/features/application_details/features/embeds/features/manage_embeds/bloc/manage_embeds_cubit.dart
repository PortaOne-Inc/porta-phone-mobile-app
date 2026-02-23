import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'manage_embeds_state.dart';

part 'manage_embeds_cubit.freezed.dart';

class ManageEmbedsCubit extends Cubit<ManageEmbedsState> {
  ManageEmbedsCubit({
    required String applicationId,
    required String? id,
    required GetApplicationEmbedsUsecase getUsecase,
    required CreateApplicationEmbedUsecase createUsecase,
    required DeleteApplicationEmbedUsecase deleteUsecase,
  }) : _applicationId = applicationId,
       _get = getUsecase,
       _create = createUsecase,
       _delete = deleteUsecase,
       super(ManageEmbedsState(routeEmbedId: id));

  final String _applicationId;
  final GetApplicationEmbedsUsecase _get;
  final CreateApplicationEmbedUsecase _create;
  final DeleteApplicationEmbedUsecase _delete;

  void setRouteEmbedId(String? id) {
    emit(state.copyWith(routeEmbedId: id));
  }

  Future<void> load() async {
    emit(state.copyWith(status: ManageEmbedsStatus.loading, error: null));
    try {
      final items = await _get.execute(_applicationId);

      final prioritized = _prioritizeRouteEmbed(items, state.routeEmbedId);

      emit(
        state.copyWith(status: ManageEmbedsStatus.loaded, items: prioritized),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ManageEmbedsStatus.failure, error: e.toString()),
      );
    }
  }

  Future<void> create({
    required String uri,
    required EmbeddedResourceModelType type,
    Map<String, dynamic> attributes = const {},
    List<String> payload = const [],
    bool enableConsoleLogCapture = false,
    String? reconnectStrategy,
  }) async {
    emit(state.copyWith(creating: true, createError: null));
    try {
      final resource = EmbeddedResourceModel(
        uri: uri,
        type: type,
        attributes: attributes,
        payload: payload,
        enableConsoleLogCapture: enableConsoleLogCapture,
        reconnectStrategy: reconnectStrategy,
        applicationId: _applicationId,
      );

      final created = await _create.execute(
        applicationId: _applicationId,
        resource: resource,
      );

      final updated = [created, ...state.items];
      final prioritized = _prioritizeRouteEmbed(updated, state.routeEmbedId);

      emit(state.copyWith(creating: false, items: prioritized));
    } catch (e) {
      emit(state.copyWith(creating: false, createError: e.toString()));
    }
  }

  Future<void> delete(String id) async {
    emit(
      state.copyWith(
        deletingIds: {...state.deletingIds, id},
        deleteError: null,
      ),
    );
    try {
      await _delete.execute(applicationId: _applicationId, id: id);
      final filtered = state.items.where((e) => e.id != id).toList();
      emit(
        state.copyWith(
          deletingIds: {...state.deletingIds}..remove(id),
          items: filtered,
          routeEmbedId: state.routeEmbedId == id ? null : state.routeEmbedId,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          deletingIds: {...state.deletingIds}..remove(id),
          deleteError: e.toString(),
        ),
      );
    }
  }

  List<EmbeddedResourceModel> _prioritizeRouteEmbed(
    List<EmbeddedResourceModel> items,
    String? routeEmbedId,
  ) {
    if (routeEmbedId == null) return items;
    final idx = items.indexWhere((e) => e.id == routeEmbedId);
    if (idx <= 0) return items;
    final copy = [...items];
    final picked = copy.removeAt(idx);
    copy.insert(0, picked);
    return copy;
  }
}
