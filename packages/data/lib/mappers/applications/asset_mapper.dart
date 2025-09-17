import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';
import 'package:data/dto/dto.dart';
import 'package:data/mappers/mappers.dart';

@Injectable(as: CommonMapper<AssetModel, AssetDTO>)
class AssetMapper extends CommonMapper<AssetModel, AssetDTO> {
  AssetMapper(this.assetLinkMapper);

  final CommonMapper<AssetLink, AssetLinkDto> assetLinkMapper;

  @override
  AssetDTO convertTo(AssetModel it) {
    return AssetDTO(
      id: it.id,
      ownerId: it.ownerId,
      storagePath: it.storagePath,
      mimeType: it.mimeType,
      size: it.size,
      checksum: it.checksum,
      createdAt: it.createdAt.toUtc().toIso8601String(),
      updatedAt: it.updatedAt.toUtc().toIso8601String(),
      refCount: it.refCount,
      usedBy: assetLinkMapper.convertListTo(it.usedBy),
      downloadUrl: it.downloadUrl,
    );
  }

  @override
  AssetModel convertFrom(AssetDTO it) {
    return AssetModel(
      id: it.id,
      ownerId: it.ownerId,
      storagePath: it.storagePath,
      mimeType: it.mimeType,
      size: it.size,
      checksum: it.checksum,
      createdAt: DateTime.parse(it.createdAt).toUtc(),
      updatedAt: DateTime.parse(it.updatedAt).toUtc(),
      refCount: it.refCount,
      usedBy: assetLinkMapper.convertListFrom(it.usedBy),
      downloadUrl: it.downloadUrl,
    );
  }
}
