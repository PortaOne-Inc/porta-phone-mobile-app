import 'package:freezed_annotation/freezed_annotation.dart';

part 'assets_renditions.freezed.dart';

part 'assets_renditions.g.dart';

@freezed
sealed class AssetsRendition with _$AssetsRendition {
  const factory AssetsRendition({
    required String id,
    required String ownerId,
    required String applicationId,
    required String themeId,
    required String kind,
    required List<AssetsRenditionSource> sources,
    required String storagePath,
    required String mimeType,
    required int size,
    required String checksum,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int refCount,
    required List<dynamic> usedBy,
    required String downloadUrl,
  }) = _AssetsRendition;

  factory AssetsRendition.fromJson(Map<String, dynamic> json) =>
      _$AssetsRenditionFromJson(json);
}

@freezed
sealed class AssetsRenditionSource with _$AssetsRenditionSource {
  const factory AssetsRenditionSource({
    required String type,
    required String id,
  }) = _AssetsRenditionSource;

  factory AssetsRenditionSource.fromJson(Map<String, dynamic> json) =>
      _$AssetsRenditionSourceFromJson(json);
}
