import 'dart:async';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/extensions/extensions.dart';

import '../constants/default_constraints_model.dart';

part 'splash_assets_state.dart';

part 'splash_assets_bloc.freezed.dart';

enum SplashAssetsStatus { initial, loading, success, failure }

final _logger = Logger('SplashAssetsBloc');

class SplashAssetsBloc extends Cubit<SplashAssetsState> {
  SplashAssetsBloc({
    required String applicationId,
    required String themeId,
    required this.getSplashAssetUsecase,
    required this.upsertWithFilesUsecase,
    required this.watchApplicationAssetsUsecase,
    required this.getConstraintsDefaultsUsecase,
    required this.deleteSplashAssetUsecase,
  }) : super(
         SplashAssetsState(applicationId: applicationId, themeId: themeId),
       ) {
    _assetsSub = watchApplicationAssetsUsecase
        .execute(state.applicationId)
        .listen(
          (assets) {
            final fgId = state.existing?.source?.foregroundAssetId;
            final selected = _resolveById(assets, fgId) ?? state.selectedAsset;

            emit(state.copyWith(assets: assets, selectedAsset: selected));
          },
          onError: (Object error) => _logger.warning(
            'watchApplicationAssetsUsecase stream error',
            error,
          ),
        );
  }

  final GetSplashAssetUsecase getSplashAssetUsecase;
  final UpsertSplashAssetUsecase upsertWithFilesUsecase;
  final WatchApplicationAssetsUsecase watchApplicationAssetsUsecase;
  final GetSplashConstraintsDefaultsUsecase getConstraintsDefaultsUsecase;
  final DeleteSplashAssetUsecase deleteSplashAssetUsecase;

  StreamSubscription<List<AssetModel>>? _assetsSub;

  @override
  Future<void> close() async {
    await _assetsSub?.cancel();
    return super.close();
  }

  Future<void> load() async {
    emit(state.copyWith(status: SplashAssetsStatus.loading, error: null));
    try {
      final defaults = await getConstraintsDefaultsUsecase.execute(
        applicationId: state.applicationId,
        themeId: state.themeId,
      );

      final model = await getSplashAssetUsecase.execute(
        applicationId: state.applicationId,
        themeId: state.themeId,
      );

      final resolved = _resolveById(
        state.assets,
        model.source?.foregroundAssetId,
      );

      final android12Slice = defaults.android12 ?? defaultAndroid12ConstraintsModel;
      final android12MinPad =
          (android12Slice.fullSizeDp - android12Slice.maskDiameterDp) / 2;

      emit(
        state.copyWith(
          status: SplashAssetsStatus.success,
          constraintsDefaults: defaults,
          existing: model,
          updatedAt: model.updatedAt,
          selectedAsset: resolved ?? state.selectedAsset,
          padding: model.params?.padding ?? 0,
          android12Padding: math.max(state.android12Padding, android12MinPad),
          backgroundColorHex: model.source?.backgroundColorHex,
        ),
      );
    } catch (e) {
      try {
        final defaults = await getConstraintsDefaultsUsecase.execute(
          applicationId: state.applicationId,
          themeId: state.themeId,
        );
        emit(
          state.copyWith(
            constraintsDefaults: defaults,
            status: SplashAssetsStatus.initial,
            error: null,
          ),
        );
      } catch (_) {
        emit(state.copyWith(status: SplashAssetsStatus.failure, error: e));
      }
    }
  }

  void selectAsset(AssetModel? asset) {
    emit(
      state.copyWith(selectedAsset: asset, status: SplashAssetsStatus.initial),
    );
  }

  void selectBackgroundColor(Color? color) {
    emit(
      state.copyWith(
        backgroundColorHex: color?.toHex(),
        status: SplashAssetsStatus.initial,
      ),
    );
  }

  void selectPadding(double padding) {
    emit(state.copyWith(padding: padding, status: SplashAssetsStatus.initial));
  }

  void selectAndroid12Padding(double padding) {
    emit(state.copyWith(android12Padding: padding, status: SplashAssetsStatus.initial));
  }

  Future<void> startRender() async {
    emit(state.copyWith(status: SplashAssetsStatus.loading, error: null));
  }

  Future<void> saveWithExports(Uint8List splash, Uint8List? android12Splash) async {
    emit(state.copyWith(status: SplashAssetsStatus.loading, error: null));

    try {
      final uploads = <ArtifactUpload>[
        ArtifactUpload(
          target: SplashUploadTarget.splash,
          mimeType: 'image/png',
          bytes: splash,
        ),
      ];

      if (android12Splash != null) {
        uploads.add(ArtifactUpload(
          target: SplashUploadTarget.android12Splash,
          mimeType: 'image/png',
          bytes: android12Splash,
        ));
      }

      await upsertWithFilesUsecase.execute(
        applicationId: state.applicationId,
        themeId: state.themeId,
        params: SplashAssetParams(padding: state.padding),
        source: SplashSource(
          foregroundAssetId: state.selectedAsset?.id,
          backgroundColorHex: state.backgroundColorHex,
        ),
        uploads: uploads,
      );

      final fresh = await getSplashAssetUsecase.execute(
        applicationId: state.applicationId,
        themeId: state.themeId,
      );

      emit(state.copyWith(existing: fresh, status: SplashAssetsStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SplashAssetsStatus.failure, error: e));
    }
  }

  Future<void> delete() async {
    emit(state.copyWith(status: SplashAssetsStatus.loading, error: null));
    try {
      await deleteSplashAssetUsecase.execute(
        applicationId: state.applicationId,
        themeId: state.themeId,
      );
      emit(
        state.copyWith(
          existing: null,
          selectedAsset: null,
          backgroundColorHex: null,
          padding: 0,
          status: SplashAssetsStatus.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: SplashAssetsStatus.failure, error: e));
    }
  }

  static AssetModel? _resolveById(List<AssetModel> list, String? id) {
    if (id == null || id.isEmpty) return null;
    for (final a in list) {
      if (a.id == id) return a;
    }
    return null;
  }
}
