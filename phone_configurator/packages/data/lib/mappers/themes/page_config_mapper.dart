import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../../dto/dto.dart';
import '../mapper.dart';

@Singleton(as: CommonMapper<PageConfigModel, PageConfigDto>)
class PageConfigMapper extends CommonMapper<PageConfigModel, PageConfigDto> {
  @override
  PageConfigModel convertFrom(PageConfigDto it) {
    return PageConfigModel(
      id: it.id,
      applicationId: it.applicationId,
      themeId: it.themeId,
      variant: BrightnessVariant.values.byName(it.variant),
      config: it.config,
      version: it.version,
      createdAt: it.createdAt,
      updatedAt: it.updatedAt,
    );
  }

  @override
  PageConfigDto convertTo(PageConfigModel it) {
    return PageConfigDto(
      id: it.id ?? '${it.themeId}_${it.variant.name}',
      applicationId: it.applicationId,
      themeId: it.themeId,
      variant: it.variant.name,
      config: it.config,
      version: it.version,
      createdAt: it.createdAt,
      updatedAt: it.updatedAt,
    );
  }

  @override
  List<PageConfigModel> convertListFrom(List<PageConfigDto> it) =>
      it.map(convertFrom).toList();
}
