import 'dart:typed_data';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/core/widgets/buttons/image_renderer.dart';

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

  Future<void> selectForegroundAsset(ThemeAssetModel selectedAsset) async {
    emit(state.copyWith(selectedForegroundAsset: selectedAsset));
  }

  Future<void> selectBackgroundColor(Color color) async {
    emit(state.copyWith(backgroundColor: color));
  }

  Future<void> uploadAsset(
    Future<Uint8List?> asset,
  ) async {
    emit(state.copyWith(status: SplashAssetsStateEnum.loading));
    final assetUint8List = await asset;

    final launchUrl = await uploadFileUsecase.execute(fileName: '${DateTime.now()}.png', data: assetUint8List!);

    await updateSplashAssetsThemeUsecase.execute(
        applicationId: state.applicationId,
        themeId: state.themeId,
        splashAsset: SplashAssetModel(
          originalAssetId: state.selectedForegroundAsset!.id,
          pictureUrl: launchUrl,
          color: state.backgroundColor!.toHex(),
        ));

    emit(state.copyWith(status: SplashAssetsStateEnum.initial));
  }
}
