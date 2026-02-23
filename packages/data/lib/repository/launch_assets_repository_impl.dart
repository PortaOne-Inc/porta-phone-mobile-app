import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'package:data/datasource/configurator_backend/configurator_backand_datasource.dart';
import 'package:data/mappers/mappers.dart';

import '../datasource/configurator_backend/configurator_backand_api.dart';
import '../mappers/resources/constraints_mappers.dart';

@Injectable(as: LaunchAssetsRepository)
class LaunchAssetsRepositoryImpl extends LaunchAssetsRepository {
  LaunchAssetsRepositoryImpl(
    this.api,
    this.envelopeMapper,
    this.entityMapper,
    this.sourceMapper,
    this.paramsMapper,
    this.constraintsMapper, // для defaults
  );

  final ConfiguratorBackandDatasource api;
  final LaunchAssetsEnvelopeMapper envelopeMapper;
  final LaunchAssetsMapper entityMapper;
  final SourceConfigMapper sourceMapper;
  final PlatformParamsMapper paramsMapper;
  final ConstraintsMapper constraintsMapper;

  @override
  Future<LaunchAssetsEnvelope> getByTheme({
    required String applicationId,
    required String themeId,
    bool includeUrl = false,
    int? urlTtlSec,
    bool withValidation = false,
  }) async {
    try {
      final dto = await api.getLaunchAssetsByTheme(
        applicationId: applicationId,
        themeId: themeId,
        includeUrl: includeUrl,
        urlTtlSec: urlTtlSec,
        withValidation: withValidation,
      );
      return envelopeMapper.convertFrom(dto);
    } on DioException catch (e) {
      throw BaseException(
        message: e.response?.data?.toString() ?? e.message ?? 'Network error',
      );
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<LaunchAssetsModel> upsertWithFilesByTheme({
    required String applicationId,
    required String themeId,
    required List<LaunchArtifactUpload> uploads,
    SourceConfigModel? source,
    PlatformParamsModel? params,
  }) async {
    try {
      final dto = await api.upsertLaunchAssetsUploadBatch(
        applicationId: applicationId,
        themeId: themeId,
        // dto-частина
        source: source != null ? sourceMapper.convertTo(source) : null,
        params: params != null ? paramsMapper.convertTo(params) : null,
        // файли
        uploads: uploads
            .map(
              (u) => LaunchArtifactUploadWire(
                target: _mapTarget(u.target),
                mimeType: u.mimeType,
                bytes: u.bytes,
              ),
            )
            .toList(),
      );
      return entityMapper.convertFrom(dto);
    } on DioException catch (e) {
      throw BaseException(
        message: e.response?.data?.toString() ?? e.message ?? 'Network error',
      );
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<void> deleteByTheme({
    required String applicationId,
    required String themeId,
  }) async {
    try {
      await api.deleteLaunchAssets(
        applicationId: applicationId,
        themeId: themeId,
      );
    } on DioException catch (e) {
      throw BaseException(
        message: e.response?.data?.toString() ?? e.message ?? 'Network error',
      );
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ConstraintsModel> getConstraintsDefaults() async {
    try {
      final dto = await api.getLaunchConstraintsDefaults();
      return constraintsMapper.convertFrom(dto);
    } on DioException catch (e) {
      throw BaseException(
        message: e.response?.data?.toString() ?? e.message ?? 'Network error',
      );
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  String _mapTarget(LaunchOutputTarget t) {
    switch (t) {
      case LaunchOutputTarget.androidLegacy:
        return 'androidLegacy';
      case LaunchOutputTarget.androidAdaptiveForeground:
        return 'androidAdaptiveForeground';
      case LaunchOutputTarget.androidAdaptiveBackground:
        return 'androidAdaptiveBackground';
      case LaunchOutputTarget.ios:
        return 'ios';
      case LaunchOutputTarget.web:
        return 'web';
    }
  }
}
