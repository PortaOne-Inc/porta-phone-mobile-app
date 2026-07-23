import 'package:freezed_annotation/freezed_annotation.dart';

import 'asset_link.dart';

part 'asset_model.freezed.dart';

part 'asset_model.g.dart';

@freezed
sealed class AssetModel with _$AssetModel {
  const factory AssetModel({
    required String id,
    required String ownerId,
    required String storagePath,
    required String mimeType,
    required int size,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? checksum,
    @Default(0) int refCount,
    @Default(<AssetLink>[]) List<AssetLink> usedBy,
    String? downloadUrl,
  }) = _AssetModel;

  factory AssetModel.fromJson(Map<String, dynamic> json) =>
      _$AssetModelFromJson(json);
}
