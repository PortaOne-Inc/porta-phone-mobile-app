import 'package:flutter/material.dart';

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
              defaultColor: Colors.white,
            ),
            onPrimary: UtilityColor.tryParseColorFromHex(
              dto.onPrimary,
              defaultColor: Colors.white,
            ),
            secondary: UtilityColor.tryParseColorFromHex(
              dto.secondary,
              defaultColor: Colors.white,
            ),
            secondaryContainer: UtilityColor.tryParseColorFromHex(
              dto.secondaryContainer,
              defaultColor: Colors.white,
            ),
            onSecondaryContainer: UtilityColor.tryParseColorFromHex(
              dto.onSecondaryContainer,
              defaultColor: Colors.white,
            ),
            tertiary: UtilityColor.tryParseColorFromHex(
              dto.tertiary,
              defaultColor: Colors.white,
            ),
            error: UtilityColor.tryParseColorFromHex(
              dto.error,
              defaultColor: Colors.white,
            ),
            outline: UtilityColor.tryParseColorFromHex(
              dto.outline,
              defaultColor: Colors.white,
            ),
            background: UtilityColor.tryParseColorFromHex(
              dto.background,
              defaultColor: Colors.white,
            ),
            onBackground: UtilityColor.tryParseColorFromHex(
              dto.onBackground,
              defaultColor: Colors.white,
            ),
            surface: UtilityColor.tryParseColorFromHex(
              dto.surface,
              defaultColor: Colors.white,
            ),
            onSurface: UtilityColor.tryParseColorFromHex(
              dto.onSurface,
              defaultColor: Colors.white,
            ),
            gradientTabColor: dto.gradientTabColor
                ?.map((color) => UtilityColor.tryParseColorFromHex(
                      color,
                      defaultColor: Colors.white,
                    )!)
                .toList(),
            launch: LaunchModel(
              adaptiveIconBackground: UtilityColor.tryParseColorFromHex(
                dto.launch?.adaptiveIconBackground,
                defaultColor: Colors.white,
              ),
              splashBackground: UtilityColor.tryParseColorFromHex(
                dto.launch?.splashBackground,
                defaultColor: Colors.white,
              ),
            ),
          );
  }
}
