import 'package:injectable/injectable.dart';

import '../../../extension/extension.dart';
import '../../../utility/utility.dart';
import '../../dto/dto.dart';
import '../../models/models.dart';
import '../mapper.dart';

@Injectable(as: Mapper<ColorDTO?, ColorSchemeModel?>)
class ColorsMapper extends Mapper<ColorDTO?, ColorSchemeModel?> {
  @override
  ColorDTO? mapToDto(ColorSchemeModel? model) {
    return model == null
        ? const ColorDTO()
        : ColorDTO(
            primary: model.primary?.toHex(),
            onPrimary: model.onPrimary?.toHex(),
            secondary: model.secondary?.toHex(),
            secondaryContainer: model.secondaryContainer?.toHex(),
            onSecondaryContainer: model.onSecondaryContainer?.toHex(),
            tertiary: model.tertiary?.toHex(),
            error: model.error?.toHex(),
            outline: model.outline?.toHex(),
            background: model.background?.toHex(),
            onBackground: model.onBackground?.toHex(),
            surface: model.surface?.toHex(),
            onSurface: model.onSurface?.toHex(),
            gradientTabColor: model.gradientTabColor?.map((e) => e.toHex()).toList(),
            launch: LaunchDTO(
              adaptiveIconBackground: model.launch?.adaptiveIconBackground?.toHex(),
              splashBackground: model.launch?.splashBackground?.toHex(),
            ),
          );
  }

  @override
  ColorSchemeModel? mapToModel(ColorDTO? dto) {
    return dto == null
        ? const ColorSchemeModel()
        : ColorSchemeModel(
            primary: UtilityColor.tryParseColorFromHex(
              dto.primary,
            ),
            onPrimary: UtilityColor.tryParseColorFromHex(
              dto.onPrimary,
            ),
            secondary: UtilityColor.tryParseColorFromHex(
              dto.secondary,
            ),
            secondaryContainer: UtilityColor.tryParseColorFromHex(
              dto.secondaryContainer,
            ),
            onSecondaryContainer: UtilityColor.tryParseColorFromHex(
              dto.onSecondaryContainer,
            ),
            tertiary: UtilityColor.tryParseColorFromHex(
              dto.tertiary,
            ),
            error: UtilityColor.tryParseColorFromHex(
              dto.error,
            ),
            outline: UtilityColor.tryParseColorFromHex(
              dto.outline,
            ),
            background: UtilityColor.tryParseColorFromHex(
              dto.background,
            ),
            onBackground: UtilityColor.tryParseColorFromHex(
              dto.onBackground,
            ),
            surface: UtilityColor.tryParseColorFromHex(
              dto.surface,
            ),
            onSurface: UtilityColor.tryParseColorFromHex(
              dto.onSurface,
            ),
            gradientTabColor: dto.gradientTabColor
                ?.map((color) => UtilityColor.tryParseColorFromHex(
                      color,
                    )!)
                .toList(),
            launch: LaunchModel(
              adaptiveIconBackground: UtilityColor.tryParseColorFromHex(
                dto.launch?.adaptiveIconBackground,
              ),
              splashBackground: UtilityColor.tryParseColorFromHex(
                dto.launch?.splashBackground,
              ),
            ),
          );
  }
}
