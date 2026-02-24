import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:data/dto/dto.dart';

import '../mapper.dart';

@LazySingleton(as: CommonMapper<WidgetsConfig, WidgetsConfigDto>)
class WidgetConfigMapper extends CommonMapper<WidgetsConfig, WidgetsConfigDto> {
  @override
  WidgetsConfig convertFrom(WidgetsConfigDto it) {
    return WidgetsConfig(
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
  WidgetsConfigDto convertTo(WidgetsConfig it) {
    return WidgetsConfigDto(
      id: it.id,
      applicationId: it.applicationId,
      themeId: it.themeId,
      variant: it.variant.name,
      config: it.config,
      version: it.version,
      createdAt: it.createdAt,
      updatedAt: it.updatedAt,
    );
  }
}
