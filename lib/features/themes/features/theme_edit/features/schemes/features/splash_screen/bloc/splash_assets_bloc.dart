import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:webtrit_configurator/core/core.dart';

part 'splash_assets_state.dart';

part 'splash_assets_bloc.freezed.dart';

class SplashAssetsBloc extends Cubit<SplashAssetsState> {
  SplashAssetsBloc({
    required String applicationId,
    required String themeId,
    required this.uploadFileUsecase,
    required this.updateSplashAssetsThemeUsecase,
  }) : super(SplashAssetsState(applicationId: applicationId, themeId: themeId));
  final UploadFileUsecase uploadFileUsecase;
  final UpdateSplashAssetsThemeUsecase updateSplashAssetsThemeUsecase;

  Future<void> selectForegroundAsset(ThemeAssetModel? selectedAsset) async {
    emit(state.copyWith(selectedForegroundAsset: selectedAsset, status: SplashAssetsStateEnum.loading));
    emit(state.copyWith(status: SplashAssetsStateEnum.initial));
  }

  Future<void> selectBackgroundColor(Color? color) async {
    emit(state.copyWith(backgroundColor: color, status: SplashAssetsStateEnum.loading));
    emit(state.copyWith(status: SplashAssetsStateEnum.initial));
  }

  Future<void> selectFit(BoxFit? fit) async {
    emit(state.copyWith(fit: fit ?? state.fit, status: SplashAssetsStateEnum.loading));
    emit(state.copyWith(status: SplashAssetsStateEnum.initial));
  }

  Future<void> selectPadding(double? padding) async {
    emit(state.copyWith(padding: padding ?? state.padding, status: SplashAssetsStateEnum.loading));
    emit(state.copyWith(status: SplashAssetsStateEnum.initial));
  }

  Future<void> uploadAsset(
    Future<Uint8List?> asset,
  ) async {
    try {
      emit(state.copyWith(status: SplashAssetsStateEnum.loading));

      final assetUint8List = await asset;

      final launchUrl = await uploadFileUsecase.execute(fileName: '${DateTime.now()}.png', data: assetUint8List!);

      final splashAsset = SplashAssetModel(
        originalAssetId: state.selectedForegroundAsset!.id,
        pictureUrl: launchUrl,
        color: state.backgroundColor?.toHex(),
        padding: state.padding,
        fit: state.fit.name,
      );

      await updateSplashAssetsThemeUsecase.execute(
        applicationId: state.applicationId,
        themeId: state.themeId,
        splashAsset: splashAsset,
      );

      emit(state.copyWith(status: SplashAssetsStateEnum.success));
    } catch (e) {
      emit(state.copyWith(status: SplashAssetsStateEnum.error, error: e));
    }
  }
}
