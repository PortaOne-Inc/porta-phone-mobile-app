import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:webtrit_configurator/core/core.dart';

part 'launch_assets_state.dart';

part 'launch_assets_bloc.freezed.dart';

final _logger = Logger('LaunchAssetsCubit');

class LaunchAssetsCubit extends Cubit<LaunchAssetsState> {
  LaunchAssetsCubit(
    String applicationId,
    String themeId,
    this.uploadFileUsecase,
    this.addLaunchAssetsThemeUsecase,
  ) : super(LaunchAssetsState(applicationId: applicationId, themeId: themeId));

  final UploadFileUsecase uploadFileUsecase;
  final AddLaunchAssetsThemeUsecase addLaunchAssetsThemeUsecase;

  Future<void> selectForegroundAsset(ThemeAssetModel selectedAsset) async {
    emit(state.copyWith(selectedForegroundAsset: selectedAsset));
  }

  Future<void> selectBackgroundAsset(ThemeAssetModel selectedAsset) async {
    emit(state.copyWith(selectedBackgroundAsset: selectedAsset));
  }

  Future<void> setBoxFit({
    BoxFit? boxFitAndroidLaunch,
    BoxFit? boxFitAndroidAdaptive,
    BoxFit? boxFitIOS,
    BoxFit? boxFitWeb,
  }) async {
    if (boxFitAndroidLaunch != null) {
      emit(state.copyWith(boxFitAndroidLaunch: boxFitAndroidLaunch));
    }
    if (boxFitAndroidAdaptive != null) {
      emit(state.copyWith(boxFitAndroidAdaptive: boxFitAndroidAdaptive));
    }
    if (boxFitIOS != null) {
      emit(state.copyWith(boxFitIOS: boxFitIOS));
    }
    if (boxFitWeb != null) {
      emit(state.copyWith(boxFitWeb: boxFitWeb));
    }
  }

  Future<void> setPadding({
    double? paddingAndroidLaunch,
    double? paddingAndroidAdaptive,
    double? paddingIOS,
    double? paddingWEB,
  }) async {
    if (paddingAndroidLaunch != null) {
      emit(state.copyWith(paddingAndroidLaunch: paddingAndroidLaunch));
    }
    if (paddingAndroidAdaptive != null) {
      emit(state.copyWith(paddingAndroidAdaptive: paddingAndroidAdaptive));
    }
    if (paddingIOS != null) {
      emit(state.copyWith(paddingIOS: paddingIOS));
    }
    if (paddingWEB != null) {
      emit(state.copyWith(paddingWEB: paddingWEB));
    }
  }

  Future<void> selectBackgroundColor(Color? color) async {
    emit(state.copyWith(selectedBackgroundColor: color));
  }

  Future<void> uploadAssets(
    Future<Uint8List?> launchAssets,
    Future<Uint8List?> adaptiveAssets,
    Future<Uint8List?> iosAssets,
    Future<Uint8List?> webAssets,
  ) async {
    emit(state.copyWith(status: LaunchAssetsStateEnum.loading));
    final launchUint8List = await launchAssets;
    final adaptiveUint8List = await adaptiveAssets;
    final iosUint8List = await iosAssets;
    final webUint8List = await webAssets;

    final launchUrl = await uploadFileUsecase.execute(fileName: '${DateTime.now()}.png', data: launchUint8List!);
    final adaptiveUrl = await uploadFileUsecase.execute(fileName: '${DateTime.now()}.png', data: adaptiveUint8List!);
    final iosUrl = await uploadFileUsecase.execute(fileName: '${DateTime.now()}.png', data: iosUint8List!);
    final webUrl = await uploadFileUsecase.execute(fileName: '${DateTime.now()}.png', data: webUint8List!);

    _logger.info('Launch URL: $launchUrl Adaptive URL: $adaptiveUrl iOS URL: $iosUrl Web URL: $webUrl');

    await addLaunchAssetsThemeUsecase.execute(
        applicationId: state.applicationId,
        themeId: state.themeId,
        launchAssets: LaunchAssetsModel(
          originalAssetId: state.selectedForegroundAsset!.id,
          adaptiveIconForegroundUrl: launchUrl,
          adaptiveIconBackgroundUrl: adaptiveUrl,
          androidLauncherIconUrl: launchUrl,
          iosLauncherIconUrl: iosUrl,
          webLauncherIconUrl: webUrl,
          backgroundColor: state.selectedBackgroundColor!.toHex(),
        ));

    emit(state.copyWith(status: LaunchAssetsStateEnum.initial));
  }
}
