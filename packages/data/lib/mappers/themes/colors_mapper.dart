import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:dto/dto.dart';

import '../mapper.dart';

@Injectable(as: CommonMapper<ColorSchemeModel, ColorDTO>)
class ColorsMapper extends CommonMapper<ColorSchemeModel, ColorDTO> {
  @override
  ColorDTO convertTo(ColorSchemeModel it) {
    return ColorDTO(
      seed: it.seed,
      colors: it.colors,
      gradientTabColor: it.gradientTabColor ?? [],
      launch: LaunchDTO(
        adaptiveIconBackground: it.launch?.adaptiveIconBackground,
        splashBackground: it.launch?.splashBackground,
      ),
    );
  }

  @override
  ColorSchemeModel convertFrom(ColorDTO it) {
    return ColorSchemeModel(
      colors: it.colors,
      gradientTabColor: it.gradientTabColor,
      launch: LaunchModel(
        adaptiveIconBackground: it.launch?.adaptiveIconBackground,
        splashBackground: it.launch?.splashBackground,
      ),
    );
  }
}
