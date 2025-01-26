import 'dart:typed_data';

import 'package:bloc/bloc.dart';

import 'package:domain/domain.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'assets_state.dart';

part 'assets_cubit.freezed.dart';

final _logger = Logger('AssetsCubit');

class AssetsCubit extends Cubit<AssetsState> {
  AssetsCubit(this.uploadFileUsecase) : super(const AssetsState());

  final UploadFileUsecase uploadFileUsecase;

  Future<void> createAsset(
    String name,
    String description,
    ThemeAssetType type,
    String fileName,
    Uint8List file,
  ) async {
    final data = await uploadFileUsecase.execute(fileName: fileName, data: file);

    final assetModel = ThemeAssetModel.create(
      name: name,
      description: description,
      type: ThemeAssetType.unknown,
      url: data,
      file: file,
    );

    emit(state.copyWith(
      asset: assetModel,
    ));
  }
}
