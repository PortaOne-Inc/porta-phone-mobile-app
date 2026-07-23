import 'package:flutter/foundation.dart';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mime/mime.dart';

import 'package:domain/domain.dart';

part 'assets_state.dart';

part 'assets_cubit.freezed.dart';

class AssetsCubit extends Cubit<AssetsState> {
  AssetsCubit({
    required String applicationId,
    required GetApplicationAssetsUsecase getApplicationAssetsUsecase,
    required CreateApplicationAssetUsecase createApplicationAssetUsecase,
    required DeleteApplicationAssetUsecase deleteApplicationAssetUsecase,
  }) : _get = getApplicationAssetsUsecase,
       _create = createApplicationAssetUsecase,
       _delete = deleteApplicationAssetUsecase,
       super(AssetsState(applicationId: applicationId));

  final GetApplicationAssetsUsecase _get;
  final CreateApplicationAssetUsecase _create;
  final DeleteApplicationAssetUsecase _delete;

  /// Load (or reload) assets. Each asset is expected to already contain a `downloadUrl`.
  Future<void> load() async {
    emit(state.copyWith(status: AssetsStatus.loading, errorMessage: null));
    try {
      final items = await _get.execute(applicationId: state.applicationId);
      emit(state.copyWith(status: AssetsStatus.loaded, assets: items));
    } catch (e) {
      emit(
        state.copyWith(
          status: AssetsStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  /// Change application scope at runtime and reload.
  Future<void> changeApplication(String applicationId) async {
    emit(
      state.copyWith(
        applicationId: applicationId,
        status: AssetsStatus.initial,
        assets: const [],
        errorMessage: null,
      ),
    );
    await load();
  }

  /// Pick a file and upload it. The created asset should already contain `downloadUrl`.
  Future<AssetModel?> pickAndUpload() async {
    emit(state.copyWith(creating: true, createError: null));
    try {
      final result = await (kIsWeb
          ? file_picker.FilePicker.platform.pickFiles(withData: true)
          : file_picker.FilePicker.platform.pickFiles());

      if (result == null || result.files.isEmpty) {
        emit(state.copyWith(creating: false));
        return null;
      }

      final picked = result.files.single;
      final filename = picked.name;

      // Ensure bytes on all platforms (web requires withData: true).
      final bytes =
          picked.bytes ??
          (await file_picker.FilePicker.platform.pickFiles(
            withData: true,
            allowedExtensions: picked.extension != null
                ? [picked.extension!]
                : null,
          ))?.files.single.bytes;

      if (bytes == null) {
        throw Exception(
          'Unable to read file bytes. On web use pickFiles(withData: true).',
        );
      }

      // Detect MIME by filename/signature
      final mimeType =
          lookupMimeType(filename, headerBytes: bytes.take(12).toList()) ??
          'application/octet-stream';

      final created = await _create.execute(
        applicationId: state.applicationId,
        filename: filename,
        bytes: bytes,
        mimeType: mimeType,
      );

      // No extra URL resolution needed; append straight to the list.
      emit(state.copyWith(creating: false, assets: [created, ...state.assets]));
      return created;
    } catch (e) {
      emit(state.copyWith(creating: false, createError: e.toString()));
      return null;
    }
  }

  /// Delete an asset by id.
  Future<void> deleteAsset(String assetId) async {
    emit(
      state.copyWith(
        deleting: true,
        deletingAssetId: assetId,
        deleteError: null,
      ),
    );
    try {
      await _delete.execute(
        applicationId: state.applicationId,
        assetId: assetId,
      );
      emit(
        state.copyWith(
          deleting: false,
          deletingAssetId: null,
          assets: state.assets.where((a) => a.id != assetId).toList(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          deleting: false,
          deletingAssetId: null,
          deleteError: e.toString(),
        ),
      );
    }
  }
}
