import 'dart:typed_data';

import 'package:bloc/bloc.dart';

import 'package:domain/domain.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'assets_state.dart';

part 'assets_cubit.freezed.dart';

class AssetsCubit extends Cubit<AssetsState> {
  AssetsCubit(
    this._applicationId,
    this._themeId,
    this.uploadFileUsecase,
    this.addAssetsThemeUsecase,
  ) : super(const AssetsState());

  final UploadFileUsecase uploadFileUsecase;
  final AddAssetsThemeUsecase addAssetsThemeUsecase;

  final String _applicationId;
  final String _themeId;

  Future<void> createAsset(
    String name,
    String description,
    ThemeAssetType type,
    String fileName,
    Uint8List file,
  ) async {
    emit(state.copyWith(
      status: AssetsStateEnum.loading,
    ));

    final data = await uploadFileUsecase.execute(fileName: fileName, data: file);
    final assets = await addAssetsThemeUsecase.execute(
      applicationId: _applicationId,
      themeId: _themeId,
      asset: ThemeAssetModel.create(
        name: name,
        description: description,
        type: type,
        url: data,
      ),
    );

    emit(state.copyWith(
      asset: assets.last,
      status: AssetsStateEnum.initial,
    ));
  }
}
