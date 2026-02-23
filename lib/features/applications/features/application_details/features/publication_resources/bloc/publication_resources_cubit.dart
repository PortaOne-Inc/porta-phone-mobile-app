import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'publication_resources_state.dart';

part 'publication_resources_cubit.freezed.dart';

class PublicationResourcesCubit extends Cubit<PublicationResourcesState> {
  PublicationResourcesCubit({
    required this.applicationId,
    required GetApplicationPublicationResourcesUsecase getUsecase,
    required CreateApplicationPublicationResourceUsecase createUsecase,
    required UpdateApplicationPublicationResourceUsecase updateUsecase,
    required DeleteApplicationPublicationResourceUsecase deleteUsecase,
  }) : _get = getUsecase,
       _create = createUsecase,
       _update = updateUsecase,
       _delete = deleteUsecase,
       super(const PublicationResourcesState());

  final String applicationId;
  final GetApplicationPublicationResourcesUsecase _get;
  final CreateApplicationPublicationResourceUsecase _create;
  final UpdateApplicationPublicationResourceUsecase _update;
  final DeleteApplicationPublicationResourceUsecase _delete;

  Future<void> load() async {
    emit(state.copyWith(status: PubResStatus.loading, error: null));
    try {
      final items = await _get.execute(applicationId);
      emit(state.copyWith(status: PubResStatus.loaded, items: items));
    } catch (e) {
      emit(state.copyWith(status: PubResStatus.failure, error: e.toString()));
    }
  }

  Future<void> create({
    String? title,
    String? url,
    String? note,
    String? text,
  }) async {
    emit(state.copyWith(creating: true, createError: null));
    try {
      final created = await _create.execute(
        applicationId: applicationId,
        title: title,
        url: url,
        note: note,
        text: text,
      );
      emit(state.copyWith(creating: false, items: [created, ...state.items]));
    } catch (e) {
      emit(state.copyWith(creating: false, createError: e.toString()));
    }
  }

  Future<void> update(
    String id, {
    String? title,
    String? url,
    String? note,
    String? text,
  }) async {
    emit(
      state.copyWith(
        updatingIds: {...state.updatingIds, id},
        updateError: null,
      ),
    );
    try {
      final saved = await _update.execute(
        resourceId: id,
        title: title,
        url: url,
        note: note,
        text: text,
      );
      final next = [
        for (final it in state.items)
          if (it.id == id) saved else it,
      ];
      emit(
        state.copyWith(
          updatingIds: {...state.updatingIds}..remove(id),
          items: next,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          updatingIds: {...state.updatingIds}..remove(id),
          updateError: e.toString(),
        ),
      );
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
      await _delete.execute(id);
      emit(
        state.copyWith(
          deletingIds: {...state.deletingIds}..remove(id),
          items: state.items.where((e) => e.id != id).toList(),
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
}
