import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';
import 'package:data/mappers/mapper.dart';

import '../../dto/theme/theme_dto.dart';

@Injectable(as: CommonMapper<ThemeModel, ThemeDTO>)
class ThemeDtoMapper extends CommonMapper<ThemeModel, ThemeDTO> {
  @override
  ThemeModel convertFrom(ThemeDTO it) {
    return ThemeModel(
      id: it.id,
      applicationId: it.applicationId,
      title: it.title,
      previewAssetId: it.previewAssetId,
      status: _mapStatus(it.status),
      isDefault: it.isDefault ?? false,
      version: it.version ?? 0,
      sortIndex: it.sortIndex,
      assetsCount: it.assetsCount,
      embedsCount: it.embedsCount,
      featureAccessExists: it.featureAccessExists,
      slug: it.slug,
      description: it.description,
      parentThemeId: it.parentThemeId,
      tags: it.tags,
      createdBy: it.createdBy,
      updatedBy: it.updatedBy,
      createdAt: it.createdAt,
      updatedAt: it.updatedAt,
      deletedAt: it.deletedAt,
    );
  }

  @override
  ThemeDTO convertTo(ThemeModel it) {
    return ThemeDTO(
      id: it.id,
      applicationId: it.applicationId,
      title: it.title,
      previewAssetId: it.previewAssetId,
      status: _mapStatusBack(it.status),
      isDefault: it.isDefault,
      version: it.version,
      sortIndex: it.sortIndex,
      assetsCount: it.assetsCount,
      embedsCount: it.embedsCount,
      featureAccessExists: it.featureAccessExists,
      slug: it.slug,
      description: it.description,
      parentThemeId: it.parentThemeId,
      tags: it.tags,
      createdBy: it.createdBy,
      updatedBy: it.updatedBy,
      createdAt: it.createdAt,
      updatedAt: it.updatedAt,
      deletedAt: it.deletedAt,
    );
  }

  // —— helpers ——
  ThemeStatus _mapStatus(String? raw) {
    switch (raw) {
      case 'published':
        return ThemeStatus.published;
      case 'archived':
        return ThemeStatus.archived;
      case 'draft':
      default:
        return ThemeStatus.draft;
    }
  }

  String? _mapStatusBack(ThemeStatus status) {
    switch (status) {
      case ThemeStatus.published:
        return 'published';
      case ThemeStatus.archived:
        return 'archived';
      case ThemeStatus.draft:
        return 'draft';
    }
  }
}
