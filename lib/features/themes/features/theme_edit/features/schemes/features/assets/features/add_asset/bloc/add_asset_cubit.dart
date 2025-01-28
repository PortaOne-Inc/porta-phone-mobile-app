import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'add_asset_state.dart';

part 'add_asset_cubit.freezed.dart';

class AddAssetCubit extends Cubit<AddAssetState> {
  AddAssetCubit(
    this._applicationId,
    this._themeId,
    this.uploadFileUsecase,
    this.addAssetsThemeUsecase,
  ) : super(const AddAssetState());

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
      status: AddAssetStateEnum.loading,
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
      status: AddAssetStateEnum.initial,
    ));
  }
}
