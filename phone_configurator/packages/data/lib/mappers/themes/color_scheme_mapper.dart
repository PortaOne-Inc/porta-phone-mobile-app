import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:data/dto/dto.dart';

import '../mapper.dart';

@Injectable(as: CommonMapper<ColorSchemeModel, ColorSchemeDto>)
class ColorSchemeMapper extends CommonMapper<ColorSchemeModel, ColorSchemeDto> {
  @override
  ColorSchemeModel convertFrom(ColorSchemeDto it) {
    return ColorSchemeModel(
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
  ColorSchemeDto convertTo(ColorSchemeModel it) {
    return ColorSchemeDto(
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
