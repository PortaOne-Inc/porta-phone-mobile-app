import 'dart:async';
import 'dart:typed_data';

import 'package:domain/domain.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';

part 'launch_assets_state.dart';

part 'launch_assets_bloc.freezed.dart';

final _logger = Logger('LaunchAssetsCubit');

class LaunchAssetsCubit extends Cubit<LaunchAssetsState> {
  LaunchAssetsCubit({
    required String applicationId,
    required String themeId,
    required GetLaunchAssetsUsecase getUsecase,
    required UpsertLaunchAssetsUsecase upsertWithFilesUsecase,
    required GetConstraintsDefaultsUsecase getConstraintsDefaultsUsecase,
    required WatchApplicationAssetsUsecase watchApplicationAssetsUsecase,
    required DeleteLaunchAssetsUsecase deleteLaunchAssetsUsecase,
  }) : _getUsecase = getUsecase,
       _upsertWithFilesUsecase = upsertWithFilesUsecase,
       _getConstraintsDefaultsUsecase = getConstraintsDefaultsUsecase,
       _watchApplicationAssetsUsecase = watchApplicationAssetsUsecase,
       _deleteLaunchAssetsUsecase = deleteLaunchAssetsUsecase,
       super(
         LaunchAssetsState(applicationId: applicationId, themeId: themeId),
       ) {
    _assetsSub = _watchApplicationAssetsUsecase
        .execute(state.applicationId)
        .listen(
          (assets) {
            final src = state.envelope?.entity.source;
            emit(
              state.copyWith(
                assets: assets,
                selectedForegroundAsset:
                    _resolveById(assets, src?.foregroundAssetId) ??
                    state.selectedForegroundAsset,
                selectedBackgroundAsset:
                    _resolveById(assets, src?.backgroundAssetId) ??
                    state.selectedBackgroundAsset,
              ),
            );
          },
          onError: (Object error, StackTrace stackTrace) {
            _logger.warning(
              'watchApplicationAssetsUsecase stream error',
              error,
              stackTrace,
            );
          },
        );
  }

  final GetLaunchAssetsUsecase _getUsecase;
  final UpsertLaunchAssetsUsecase _upsertWithFilesUsecase;
  final GetConstraintsDefaultsUsecase _getConstraintsDefaultsUsecase;
  final WatchApplicationAssetsUsecase _watchApplicationAssetsUsecase;
  final DeleteLaunchAssetsUsecase _deleteLaunchAssetsUsecase;

  StreamSubscription<List<AssetModel>>? _assetsSub;

  static const _defaultUrlTtlSec = 3600;

  @override
  Future<void> close() async {
    await _assetsSub?.cancel();
    return super.close();
  }

  Future<void> load({bool withValidation = true}) async {
    emit(state.copyWith(status: LaunchAssetsStatus.loading, error: null));
    try {
      final env = await _getUsecase.execute(
        state.applicationId,
        state.themeId,
        includeUrl: true,
        urlTtlSec: _defaultUrlTtlSec,
        withValidation: withValidation,
      );
      final defaultConstraints = await _getConstraintsDefaultsUsecase.execute();

      final params = env.entity.params;
      final src = env.entity.source;

      emit(
        state.copyWith(
          status: LaunchAssetsStatus.loaded,
          envelope: env,
          constraints: defaultConstraints,
          selectedForegroundAsset:
              _resolveById(state.assets, src?.foregroundAssetId) ??
              state.selectedForegroundAsset,
          selectedBackgroundAsset:
              _resolveById(state.assets, src?.backgroundAssetId) ??
              state.selectedBackgroundAsset,
          selectedBackgroundColorHex: src?.backgroundColorHex,
          paddingAndroidLegacy: params?.androidLegacy?.paddingDp ?? 0,
          paddingAndroidAdaptive: params?.androidAdaptive?.paddingDp ?? 0,
          paddingIOS: params?.ios?.paddingDp ?? 0,
          paddingWEB: params?.web?.paddingDp ?? 0,
        ),
      );
    } catch (e, st) {
      _logger.severe('load failed', e, st);
      emit(
        state.copyWith(status: LaunchAssetsStatus.failure, error: e.toString()),
      );
    }
  }

  Future<void> delete() async {
    try {
      await _deleteLaunchAssetsUsecase.execute(
        state.applicationId,
        state.themeId,
      );
      emit(
        state.copyWith(
          envelope: null,
          selectedForegroundAsset: null,
          selectedBackgroundAsset: null,
          selectedBackgroundColorHex: null,
          status: LaunchAssetsStatus.loaded,
        ),
      );
    } catch (e, st) {
      _logger.severe('delete failed', e, st);
      emit(
        state.copyWith(status: LaunchAssetsStatus.failure, error: e.toString()),
      );
    }
  }

  void selectForegroundAsset(AssetModel asset) =>
      emit(state.copyWith(selectedForegroundAsset: asset));

  void selectBackgroundAsset(AssetModel asset) =>
      emit(state.copyWith(selectedBackgroundAsset: asset));

  void selectBackgroundColor(Color? color) =>
      emit(state.copyWith(selectedBackgroundColorHex: color?.toHex()));

  void setPadding({
    double? paddingAndroidLegacy,
    double? paddingAndroidAdaptive,
    double? paddingIOS,
    double? paddingWEB,
  }) {
    emit(
      state.copyWith(
        paddingAndroidLegacy:
            paddingAndroidLegacy ?? state.paddingAndroidLegacy,
        paddingAndroidAdaptive:
            paddingAndroidAdaptive ?? state.paddingAndroidAdaptive,
        paddingIOS: paddingIOS ?? state.paddingIOS,
        paddingWEB: paddingWEB ?? state.paddingWEB,
      ),
    );
  }

  Future<void> startRender() async {
    emit(state.copyWith(saving: true, error: null));
  }

  Future<void> saveWithExports(
    Uint8List adaptiveLegacyImage,
    Uint8List androidAdaptiveImage,
    Uint8List iosImage,
    Uint8List webImage,
  ) async {
    emit(state.copyWith(saving: true, error: null));
    try {
      final source = _buildSource();
      final params = _buildParams();

      final uploads = _mapExportsToUploads(
        adaptiveLegacyImage,
        androidAdaptiveImage,
        iosImage,
        webImage,
      );

      await _upsertWithFilesUsecase.execute(
        applicationId: state.applicationId,
        themeId: state.themeId,
        source: source,
        params: params,
        uploads: uploads,
      );

      final env = await _getUsecase.execute(
        state.applicationId,
        state.themeId,
        includeUrl: true,
        urlTtlSec: _defaultUrlTtlSec,
        withValidation: true,
      );

      emit(
        state.copyWith(
          saving: false,
          envelope: env,
          status: LaunchAssetsStatus.loaded,
        ),
      );
    } catch (e, st) {
      _logger.severe('saveWithExports failed', e, st);
      emit(
        state.copyWith(
          saving: false,
          status: LaunchAssetsStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  // helpers
  static AssetModel? _resolveById(List<AssetModel> list, String? id) {
    if (id == null || id.isEmpty) return null;
    for (final a in list) {
      if (a.id == id) return a;
    }
    return null;
  }

  SourceConfigModel _buildSource() => SourceConfigModel(
    foregroundAssetId: state.selectedForegroundAsset?.id,
    backgroundAssetId: state.selectedBackgroundAsset?.id,
    backgroundColorHex: state.selectedBackgroundColorHex,
  );

  PlatformParamsModel _buildParams() => PlatformParamsModel(
    androidLegacy: FitPaddingModel(paddingDp: state.paddingAndroidLegacy),
    androidAdaptive: FitPaddingModel(paddingDp: state.paddingAndroidAdaptive),
    ios: FitPaddingModel(paddingDp: state.paddingIOS),
    web: FitPaddingModel(paddingDp: state.paddingWEB),
  );

  List<LaunchArtifactUpload> _mapExportsToUploads(
    Uint8List adaptiveLegacyImage,
    Uint8List androidAdaptiveImage,
    Uint8List iosImage,
    Uint8List webImage,
  ) {
    return [
      LaunchArtifactUpload(
        target: LaunchOutputTarget.androidLegacy,
        // filename: 'android_legacy.png',
        mimeType: 'image/png',
        bytes: adaptiveLegacyImage,
      ),
      LaunchArtifactUpload(
        target: LaunchOutputTarget.androidAdaptiveForeground,
        // filename: 'android_adaptive_foreground.png',
        mimeType: 'image/png',
        bytes: androidAdaptiveImage,
      ),
      LaunchArtifactUpload(
        target: LaunchOutputTarget.ios,
        // filename: 'ios.png',
        mimeType: 'image/png',
        bytes: iosImage,
      ),
      LaunchArtifactUpload(
        target: LaunchOutputTarget.web,
        // filename: 'web.png',
        mimeType: 'image/png',
        bytes: webImage,
      ),
    ];
  }
}
