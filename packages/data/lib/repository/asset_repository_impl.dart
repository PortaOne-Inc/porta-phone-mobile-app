import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';
import 'package:data/mappers/mappers.dart';
import 'package:data/datasource/datasource.dart';
import 'package:data/dto/dto.dart';
import '../common/api_exception_mapper.dart';

@Singleton(as: AssetRepository)
class AssetRepositoryImpl extends AssetRepository {
  AssetRepositoryImpl({
    required this.configuratorBackendDatasource,
    required this.assetMapper,
    required this.assetLinkMapper,
  });

  final ConfiguratorBackandDatasource configuratorBackendDatasource;
  final CommonMapper<AssetModel, AssetDTO> assetMapper;
  final CommonMapper<AssetLink, AssetLinkDto> assetLinkMapper;

  // ----------------------------
  // In-memory cache
  // ----------------------------
  final Map<String, List<AssetModel>> _cache = {};
  final Map<String, StreamController<List<AssetModel>>> _controllers = {};

  Stream<List<AssetModel>> _controllerWithCache(String appId) {
    final existing = _controllers[appId];
    if (existing != null) return existing.stream;

    late final StreamController<List<AssetModel>> controller;
    controller = StreamController<List<AssetModel>>.broadcast(
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

  void _emit(String appId, List<AssetModel> items) {
    _cache[appId] = items;
    final controller = _controllers[appId];
    if (controller != null && !controller.isClosed) {
      controller.add(items);
    }
  }

  void _upsertOne(String appId, AssetModel updated) {
    final list = List<AssetModel>.from(_cache[appId] ?? const []);
    final idx = list.indexWhere((a) => a.id == updated.id);
    if (idx >= 0) {
      list[idx] = updated;
    } else {
      list.insert(0, updated);
    }
    _emit(appId, list);
  }

  // ----------------------------
  // CRUD
  // ----------------------------

  @override
  Future<AssetModel> createAssetFromFile({
    required String applicationId,
    required String filename,
    required List<int> bytes,
    required String mimeType,
  }) async {
    try {
      final dto = await configuratorBackendDatasource.uploadAssetFile(
        applicationId: applicationId,
        filename: filename,
        bytes: bytes,
        mimeType: mimeType,
      );
      final model = assetMapper.convertFrom(dto);
      _upsertOne(applicationId, model);
      return model;
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<List<AssetModel>> getApplicationAssets(
    String applicationId, {
    bool includeUrl = true,
    int? urlTtlSec,
  }) async {
    final dtos = await configuratorBackendDatasource.getUserAssets(
      applicationId,
      includeUrl: includeUrl,
      urlTtlSec: urlTtlSec,
    );
    final models = dtos.map(assetMapper.convertFrom).toList();
    _emit(applicationId, models);
    return models;
  }

  @override
  Future<AssetModel> getAsset(
    String applicationId,
    String assetId, {
    bool includeUrl = true,
    int? urlTtlSec,
  }) async {
    final dto = await configuratorBackendDatasource.getAsset(
      applicationId,
      assetId,
      includeUrl: includeUrl,
      urlTtlSec: urlTtlSec,
    );
    final model = assetMapper.convertFrom(dto);
    _upsertOne(applicationId, model);
    return model;
  }

  @override
  Future<AssetModel> updateAsset(
    String applicationId,
    String assetId, {
    String? checksum,
  }) async {
    try {
      final dto = await configuratorBackendDatasource.updateAsset(
        applicationId,
        assetId,
        UpdateAssetDtoReq(checksum: checksum),
      );
      final model = assetMapper.convertFrom(dto);
      _upsertOne(applicationId, model);
      return model;
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<void> deleteAsset(String applicationId, String assetId) async {
    try {
      await configuratorBackendDatasource.deleteAsset(applicationId, assetId);
      final list = List<AssetModel>.from(_cache[applicationId] ?? const [])
        ..removeWhere((a) => a.id == assetId);
      _emit(applicationId, list);
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<AssetModel> linkAsset(
    String applicationId,
    String assetId,
    AssetLink link,
  ) async {
    try {
      final dto = await configuratorBackendDatasource.linkAsset(
        applicationId,
        assetId,
        assetLinkMapper.convertTo(link),
      );
      final model = assetMapper.convertFrom(dto);
      _upsertOne(applicationId, model);
      return model;
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<AssetModel> unlinkAsset(
    String applicationId,
    String assetId,
    AssetLink link,
  ) async {
    try {
      final dto = await configuratorBackendDatasource.unlinkAsset(
        applicationId,
        assetId,
        assetLinkMapper.convertTo(link),
      );
      final model = assetMapper.convertFrom(dto);
      _upsertOne(applicationId, model);
      return model;
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<String> getDownloadUrl(String applicationId, String assetId) async {
    try {
      return await configuratorBackendDatasource.getAssetDownloadUrl(
        applicationId,
        assetId,
      );
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
  Stream<List<AssetModel>> watchApplicationAssets(
    String applicationId, {
    bool includeUrl = true,
    int? urlTtlSec,
  }) {
    // Ensure controller exists
    final stream = _controllerWithCache(applicationId);

    // If cache is empty, trigger initial load
    if (_cache.containsKey(applicationId)) {
      // ignore: discarded_futures
      getApplicationAssets(
        applicationId,
        includeUrl: includeUrl,
        urlTtlSec: urlTtlSec,
      );
    }

    return stream;
  }

  @override
  Stream<AssetModel> watchAsset(
    String applicationId,
    String assetId, {
    bool includeUrl = true,
    int? urlTtlSec,
  }) {
    return watchApplicationAssets(
          applicationId,
          includeUrl: includeUrl,
          urlTtlSec: urlTtlSec,
        )
        .where((list) => list.any((a) => a.id == assetId))
        .map((list) => list.firstWhere((a) => a.id == assetId))
        .distinct((a, b) => a == b); // relies on == from Freezed
  }

  /// Dispose all controllers when shutting down the repository (optional).
  void dispose() {
    for (final c in _controllers.values) {
      c.close();
    }
    _controllers.clear();
    _cache.clear();
  }
}
