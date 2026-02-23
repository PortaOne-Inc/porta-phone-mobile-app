import 'package:bloc/bloc.dart';
import 'package:domain/usecase/applications/update_application_embed_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'embeds_state.dart';

part 'embeds_cubit.freezed.dart';

class EmbedsCubit extends Cubit<EmbedsState> {
  EmbedsCubit({
    required this.applicationId,
    required GetApplicationEmbedsUsecase getApplicationEmbedsUsecase,
    required DeleteApplicationEmbedUsecase deleteApplicationEmbedUsecase,
    required CreateApplicationEmbedUsecase createApplicationEmbedUsecase,
    required UpdateApplicationEmbedUsecase updateApplicationEmbedUsecase,
  }) : _getApplicationEmbedsUsecase = getApplicationEmbedsUsecase,
       _deleteApplicationEmbedUsecase = deleteApplicationEmbedUsecase,
       _createApplicationEmbedUsecase = createApplicationEmbedUsecase,
       _updateApplicationEmbedUsecase = updateApplicationEmbedUsecase,
       super(const EmbedsState());

  final String applicationId;

  final GetApplicationEmbedsUsecase _getApplicationEmbedsUsecase;
  final DeleteApplicationEmbedUsecase _deleteApplicationEmbedUsecase;
  final CreateApplicationEmbedUsecase _createApplicationEmbedUsecase;
  final UpdateApplicationEmbedUsecase _updateApplicationEmbedUsecase;

  Future<void> load() async {
    emit(state.copyWith(status: EmbedsStatus.loading, errorMessage: null));
    try {
      final items = await _getApplicationEmbedsUsecase.execute(applicationId);
      emit(state.copyWith(status: EmbedsStatus.loaded, items: items));
    } catch (e) {
      emit(
        state.copyWith(
          status: EmbedsStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> deleteEmbed(String embedId) async {
    emit(
      state.copyWith(
        deletingIds: {...state.deletingIds, embedId},
        deleteError: null,
      ),
    );
    try {
      await _deleteApplicationEmbedUsecase.execute(
        applicationId: applicationId,
        id: embedId,
      );
      final next = state.items
          .where((e) => e.id.toString() != embedId)
          .toList();
      emit(
        state.copyWith(
          items: next,
          deletingIds: {...state.deletingIds}..remove(embedId),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          deletingIds: {...state.deletingIds}..remove(embedId),
          deleteError: e.toString(),
        ),
      );
    }
  }

  Future<void> createEmbed({
    required String uri,
    required EmbeddedResourceModelType type,
    Map<String, dynamic> attributes = const {},
    List<String> payload = const [],
    bool enableConsoleLogCapture = false,
    String? reconnectStrategy,
  }) async {
    emit(state.copyWith(creating: true, createError: null));
    try {
      final draft = EmbeddedResourceModel(
        uri: uri,
        type: type,
        attributes: attributes,
        payload: payload,
        enableConsoleLogCapture: enableConsoleLogCapture,
        reconnectStrategy: reconnectStrategy,
        applicationId: applicationId,
      );

      final created = await _createApplicationEmbedUsecase.execute(
        applicationId: applicationId,
        resource: draft,
      );

      emit(state.copyWith(creating: false, items: [created, ...state.items]));
    } catch (e) {
      emit(state.copyWith(creating: false, createError: e.toString()));
    }
  }

  Future<void> updateEmbed({
    required String id,
    required String uri,
    required EmbeddedResourceModelType type,
    Map<String, dynamic> attributes = const {},
    List<String> payload = const [],
    bool enableConsoleLogCapture = false,
    String? reconnectStrategy,
  }) async {
    emit(
      state.copyWith(
        updatingIds: {...state.updatingIds, id},
        updateError: null,
      ),
    );
    try {
      final updatedModel = EmbeddedResourceModel(
        id: id,
        uri: uri,
        type: type,
        attributes: attributes,
        payload: payload,
        enableConsoleLogCapture: enableConsoleLogCapture,
        reconnectStrategy: reconnectStrategy,
        applicationId: applicationId,
      );

      final saved = await _updateApplicationEmbedUsecase.execute(
        applicationId: applicationId,
        id: id,
        resource: updatedModel,
      );

      final next = [
        for (final e in state.items)
          if (e.id == id) saved else e,
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
}
