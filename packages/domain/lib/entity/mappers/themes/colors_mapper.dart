import 'package:injectable/injectable.dart';
import 'package:dto/dto.dart';
import 'package:domain/extension/extension.dart';
import 'package:domain/utility/utility.dart';
import '../../models/models.dart';
import '../mapper.dart';

// TODO(Serdun): Create some converter for simplify this mapper
@Injectable(as: Mapper<ColorDTO?, ColorSchemeModel?>)
class ColorsMapper extends Mapper<ColorDTO?, ColorSchemeModel?> {
  @override
  ColorDTO? mapToDto(ColorSchemeModel? model) {
    return model == null
        ? const ColorDTO()
        : ColorDTO(
      primary: model.primary?.toHex(),
      onPrimary: model.onPrimary?.toHex(),
      primaryContainer: model.primaryContainer?.toHex(),
      onPrimaryContainer: model.onPrimaryContainer?.toHex(),
      primaryFixed: model.primaryFixed?.toHex(),
      primaryFixedDim: model.primaryFixedDim?.toHex(),
      onPrimaryFixed: model.onPrimaryFixed?.toHex(),
      onPrimaryFixedVariant: model.onPrimaryFixedVariant?.toHex(),
      secondary: model.secondary?.toHex(),
      onSecondary: model.onSecondary?.toHex(),
      secondaryContainer: model.secondaryContainer?.toHex(),
      onSecondaryContainer: model.onSecondaryContainer?.toHex(),
      secondaryFixed: model.secondaryFixed?.toHex(),
      secondaryFixedDim: model.secondaryFixedDim?.toHex(),
      onSecondaryFixed: model.onSecondaryFixed?.toHex(),
      onSecondaryFixedVariant: model.onSecondaryFixedVariant?.toHex(),
      tertiary: model.tertiary?.toHex(),
      onTertiary: model.onTertiary?.toHex(),
      tertiaryContainer: model.tertiaryContainer?.toHex(),
      onTertiaryContainer: model.onTertiaryContainer?.toHex(),
      tertiaryFixed: model.tertiaryFixed?.toHex(),
      tertiaryFixedDim: model.tertiaryFixedDim?.toHex(),
      onTertiaryFixed: model.onTertiaryFixed?.toHex(),
      onTertiaryFixedVariant: model.onTertiaryFixedVariant?.toHex(),
      error: model.error?.toHex(),
      onError: model.onError?.toHex(),
      errorContainer: model.errorContainer?.toHex(),
      onErrorContainer: model.onErrorContainer?.toHex(),
      outline: model.outline?.toHex(),
      outlineVariant: model.outlineVariant?.toHex(),
      surface: model.surface?.toHex(),
      onSurface: model.onSurface?.toHex(),
      surfaceDim: model.surfaceDim?.toHex(),
      surfaceBright: model.surfaceBright?.toHex(),
      surfaceContainerLowest: model.surfaceContainerLowest?.toHex(),
      surfaceContainerLow: model.surfaceContainerLow?.toHex(),
      surfaceContainer: model.surfaceContainer?.toHex(),
      surfaceContainerHigh: model.surfaceContainerHigh?.toHex(),
      surfaceContainerHighest: model.surfaceContainerHighest?.toHex(),
      onSurfaceVariant: model.onSurfaceVariant?.toHex(),
      inverseSurface: model.inverseSurface?.toHex(),
      onInverseSurface: model.onInverseSurface?.toHex(),
      inversePrimary: model.inversePrimary?.toHex(),
      shadow: model.shadow?.toHex(),
      scrim: model.scrim?.toHex(),
      surfaceTint: model.surfaceTint?.toHex(),
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
      primary: UtilityColor.tryParseColorFromHex(dto.primary),
      onPrimary: UtilityColor.tryParseColorFromHex(dto.onPrimary),
      primaryContainer: UtilityColor.tryParseColorFromHex(dto.primaryContainer),
      onPrimaryContainer: UtilityColor.tryParseColorFromHex(dto.onPrimaryContainer),
      primaryFixed: UtilityColor.tryParseColorFromHex(dto.primaryFixed),
      primaryFixedDim: UtilityColor.tryParseColorFromHex(dto.primaryFixedDim),
      onPrimaryFixed: UtilityColor.tryParseColorFromHex(dto.onPrimaryFixed),
      onPrimaryFixedVariant: UtilityColor.tryParseColorFromHex(dto.onPrimaryFixedVariant),
      secondary: UtilityColor.tryParseColorFromHex(dto.secondary),
      onSecondary: UtilityColor.tryParseColorFromHex(dto.onSecondary),
      secondaryContainer: UtilityColor.tryParseColorFromHex(dto.secondaryContainer),
      onSecondaryContainer: UtilityColor.tryParseColorFromHex(dto.onSecondaryContainer),
      secondaryFixed: UtilityColor.tryParseColorFromHex(dto.secondaryFixed),
      secondaryFixedDim: UtilityColor.tryParseColorFromHex(dto.secondaryFixedDim),
      onSecondaryFixed: UtilityColor.tryParseColorFromHex(dto.onSecondaryFixed),
      onSecondaryFixedVariant: UtilityColor.tryParseColorFromHex(dto.onSecondaryFixedVariant),
      tertiary: UtilityColor.tryParseColorFromHex(dto.tertiary),
      onTertiary: UtilityColor.tryParseColorFromHex(dto.onTertiary),
      tertiaryContainer: UtilityColor.tryParseColorFromHex(dto.tertiaryContainer),
      onTertiaryContainer: UtilityColor.tryParseColorFromHex(dto.onTertiaryContainer),
      tertiaryFixed: UtilityColor.tryParseColorFromHex(dto.tertiaryFixed),
      tertiaryFixedDim: UtilityColor.tryParseColorFromHex(dto.tertiaryFixedDim),
      onTertiaryFixed: UtilityColor.tryParseColorFromHex(dto.onTertiaryFixed),
      onTertiaryFixedVariant: UtilityColor.tryParseColorFromHex(dto.onTertiaryFixedVariant),
      error: UtilityColor.tryParseColorFromHex(dto.error),
      onError: UtilityColor.tryParseColorFromHex(dto.onError),
      errorContainer: UtilityColor.tryParseColorFromHex(dto.errorContainer),
      onErrorContainer: UtilityColor.tryParseColorFromHex(dto.onErrorContainer),
      outline: UtilityColor.tryParseColorFromHex(dto.outline),
      outlineVariant: UtilityColor.tryParseColorFromHex(dto.outlineVariant),
      surface: UtilityColor.tryParseColorFromHex(dto.surface),
      onSurface: UtilityColor.tryParseColorFromHex(dto.onSurface),
      surfaceDim: UtilityColor.tryParseColorFromHex(dto.surfaceDim),
      surfaceBright: UtilityColor.tryParseColorFromHex(dto.surfaceBright),
      surfaceContainerLowest: UtilityColor.tryParseColorFromHex(dto.surfaceContainerLowest),
      surfaceContainerLow: UtilityColor.tryParseColorFromHex(dto.surfaceContainerLow),
      surfaceContainer: UtilityColor.tryParseColorFromHex(dto.surfaceContainer),
      surfaceContainerHigh: UtilityColor.tryParseColorFromHex(dto.surfaceContainerHigh),
      surfaceContainerHighest: UtilityColor.tryParseColorFromHex(dto.surfaceContainerHighest),
      onSurfaceVariant: UtilityColor.tryParseColorFromHex(dto.onSurfaceVariant),
      inverseSurface: UtilityColor.tryParseColorFromHex(dto.inverseSurface),
      onInverseSurface: UtilityColor.tryParseColorFromHex(dto.onInverseSurface),
      inversePrimary: UtilityColor.tryParseColorFromHex(dto.inversePrimary),
      shadow: UtilityColor.tryParseColorFromHex(dto.shadow),
      scrim: UtilityColor.tryParseColorFromHex(dto.scrim),
      surfaceTint: UtilityColor.tryParseColorFromHex(dto.surfaceTint),
      gradientTabColor: dto.gradientTabColor?.map((color) => UtilityColor.tryParseColorFromHex(color)!).toList(),
      launch: LaunchModel(
        adaptiveIconBackground: UtilityColor.tryParseColorFromHex(dto.launch?.adaptiveIconBackground),
        splashBackground: UtilityColor.tryParseColorFromHex(dto.launch?.splashBackground),
      ),
    );
  }
}