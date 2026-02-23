import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:data/datasource/datasource.dart';
import 'package:data/dto/dto.dart';
import 'package:data/mappers/mappers.dart';

@Injectable(as: SplashAssetRepository)
class SplashAssetRepositoryImpl extends SplashAssetRepository {
  SplashAssetRepositoryImpl({
    required this.configuratorBackendDatasource,
    required this.splashAssetMapper,
    required this.splashFitMapper,
  });

  final ConfiguratorBackandDatasource configuratorBackendDatasource;
  final CommonMapper<SplashAssetModel, SplashAssetDto> splashAssetMapper;
  final CommonMapper<FitModel, FitDto> splashFitMapper;

  @override
  Future<SplashAssetModel> getByTheme({
    required String applicationId,
    required String themeId,
  }) async {
    try {
      final dto = await configuratorBackendDatasource.getSplashAsset(
        applicationId: applicationId,
        themeId: themeId,
      );
      return splashAssetMapper.convertFrom(dto);
    } on DioException catch (e) {
      throw BaseException(
        message: e.response?.data?.toString() ?? e.message ?? 'Network error',
      );
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<SplashAssetModel> upsertWithFilesByTheme({
    required String applicationId,
    required String themeId,
    required List<ArtifactUpload> uploads,
    SplashMode? mode,
    SplashAssetParams? params,
    SplashSource? source,
  }) async {
    try {
      final wire = uploads
          .map(
            (u) => ArtifactUploadWire(
              target: u.target,
              mimeType: u.mimeType,
              bytes: u.bytes,
            ),
          )
          .toList();

      final dto = await configuratorBackendDatasource
          .upsertSplashAssetUploadBatch(
            applicationId: applicationId,
            themeId: themeId,
            mode: mode?.name,
            fit: params?.fit != null
                ? splashFitMapper.convertTo(params!.fit!)
                : null,
            padding: params?.padding,
            foregroundAssetId: source?.foregroundAssetId,
            backgroundAssetId: source?.backgroundAssetId,
            backgroundColorHex: source?.backgroundColorHex,
            uploads: wire,
          );
      return splashAssetMapper.convertFrom(dto);
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
      await configuratorBackendDatasource.deleteSplashAsset(
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
  Future<SplashConstraintsDefaultsModel> getConstraintsDefaults({
    required String applicationId,
    required String themeId,
  }) async {
    try {
      final dto = await configuratorBackendDatasource
          .getSplashConstraintsDefaults(applicationId, themeId);
      return SplashConstraintsDefaultsModel(
        withBackground: SplashConstraintsDefaultsSliceModel(
          fullSizeDp: dto.withBackground.fullSizeDp,
          maskDiameterDp: dto.withBackground.maskDiameterDp,
          toleranceDp: dto.withBackground.toleranceDp,
        ),
        withoutBackground: SplashConstraintsDefaultsSliceModel(
          fullSizeDp: dto.withoutBackground.fullSizeDp,
          maskDiameterDp: dto.withoutBackground.maskDiameterDp,
          toleranceDp: dto.withoutBackground.toleranceDp,
        ),
      );
    } on DioException catch (e) {
      throw BaseException(
        message: e.response?.data?.toString() ?? e.message ?? 'Network error',
      );
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
