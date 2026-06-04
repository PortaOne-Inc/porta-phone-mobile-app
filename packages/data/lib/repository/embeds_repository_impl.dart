import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';
import 'package:data/datasource/datasource.dart';
import 'package:data/dto/dto.dart';

import '../common/api_exception_mapper.dart';
import '../mappers/mapper.dart';

@Injectable(as: EmbedsRepository)
class EmbedsRepositoryImpl extends EmbedsRepository {
  EmbedsRepositoryImpl({required this.datasource, required this.mapper});

  final ConfiguratorBackandDatasource datasource;
  final CommonMapper<EmbeddedResourceModel, EmbeddedResourceDto> mapper;

  // ----------------------------
  // In-memory cache
  // ----------------------------
  final Map<String, List<EmbeddedResourceModel>> _cache = {};
  final Map<String, StreamController<List<EmbeddedResourceModel>>>
  _controllers = {};

  Stream<List<EmbeddedResourceModel>> _controllerWithCache(String appId) {
    final existing = _controllers[appId];
    if (existing != null) return existing.stream;

    late final StreamController<List<EmbeddedResourceModel>> controller;
    controller = StreamController<List<EmbeddedResourceModel>>.broadcast(
      onListen: () {
        final cached = _cache[appId];
        if (cached != null) {
          controller.add(cached);
        }
      },
    );

    _controllers[appId] = controller;
    return controller.stream;
  }

  void _emit(String appId, List<EmbeddedResourceModel> items) {
    _cache[appId] = items;
    final controller = _controllers[appId];
    if (controller != null && !controller.isClosed) {
      controller.add(items);
    }
  }

  void _upsertOne(String appId, EmbeddedResourceModel updated) {
    final list = List<EmbeddedResourceModel>.from(_cache[appId] ?? const []);
    final idx = list.indexWhere((e) => e.id == updated.id);
    if (idx >= 0) {
      list[idx] = updated;
    } else {
      list.insert(0, updated);
    }
    _emit(appId, list);
  }

  void _removeOne(String appId, String id) {
    final list = List<EmbeddedResourceModel>.from(_cache[appId] ?? const [])
      ..removeWhere((e) => e.id == id);
    _emit(appId, list);
  }

  // ----------------------------
  // CRUD
  // ----------------------------

  @override
  Future<List<EmbeddedResourceModel>> getEmbeds(String applicationId) async {
    final dtos = await datasource.getEmbeds(applicationId);
    final models = dtos.map(mapper.convertFrom).toList();
    _emit(applicationId, models);
    return models;
  }

  @override
  Future<EmbeddedResourceModel> getEmbed(
    String applicationId,
    String id,
  ) async {
    try {
      final dto = await datasource.getEmbed(
        applicationId: applicationId,
        id: id,
      );
      final model = mapper.convertFrom(dto);
      _upsertOne(applicationId, model);
      return model;
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<EmbeddedResourceModel> createEmbed(
    String applicationId,
    EmbeddedResourceModel resource,
  ) async {
    try {
      final dto = mapper
          .convertTo(resource)
          .copyWith(applicationId: applicationId);
      final created = await datasource.createEmbed(applicationId, dto);
      final model = mapper.convertFrom(created);
      _upsertOne(applicationId, model);
      return model;
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<EmbeddedResourceModel> updateEmbed(
    String applicationId,
    String id,
    EmbeddedResourceModel resource,
  ) async {
    try {
      final dto = mapper
          .convertTo(resource)
          .copyWith(id: null, applicationId: applicationId);
      final updated = await datasource.updateEmbed(applicationId, id, dto);
      final model = mapper.convertFrom(updated);
      _upsertOne(applicationId, model);
      return model;
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<void> deleteEmbed(String applicationId, String id) async {
    try {
      await datasource.deleteEmbed(applicationId, id);
      _removeOne(applicationId, id);
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  // ----------------------------
  // Watch (streams)
  // ----------------------------

  @override
  Stream<List<EmbeddedResourceModel>> watchEmbeds(String applicationId) {
    final stream = _controllerWithCache(applicationId);
    if (!_cache.containsKey(applicationId)) {
      // ignore: discarded_futures
      getEmbeds(applicationId);
    }
    return stream;
  }

  @override
  Stream<EmbeddedResourceModel> watchEmbed(String applicationId, String id) {
    return watchEmbeds(applicationId)
        .where((list) => list.any((e) => e.id == id))
        .map((list) => list.firstWhere((e) => e.id == id))
        .distinct((a, b) => a == b); // relies on == from Freezed
  }

  // ----------------------------
  // Dispose
  // ----------------------------

  void dispose() {
    for (final c in _controllers.values) {
      c.close();
    }
    _controllers.clear();
    _cache.clear();
  }
}
