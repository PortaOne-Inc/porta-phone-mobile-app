import 'package:injectable/injectable.dart';

import '../../../dto/dto.dart';
import '../../../models/theme/theme.dart';
import '../../mapper.dart';

@Injectable(as: Mapper<ThemeDTO, ThemeModel>)
class ThemeMapper extends Mapper<ThemeDTO, ThemeModel> {
  final Mapper<ColorDTO, ColorsModel> colorsMapper;
  final Mapper<TextStyleDTO, TextStyleModel> textStyleMapper;
  final Mapper<ImageDTO, ImageModel> imageMapper;

  ThemeMapper(this.colorsMapper, this.textStyleMapper, this.imageMapper);

  @override
  ThemeDTO mapToDto(ThemeModel model) {
    return ThemeDTO(
        colors: colorsMapper.mapToDto(model.colors),
        commonConfig: ThemeCommonDTO(appName: model.commonConfig.appName, note: model.commonConfig.note),
        textStyles: _toTextStyleCollectionDTO(model.textStyles),
        images: ImageCollectionDTO(
            logo: imageMapper.mapToDto(model.images.logo), onboarding: imageMapper.mapToDto(model.images.onboarding)),
        id: model.id);
  }

  @override
  ThemeModel mapToModel(ThemeDTO dto) {
    return ThemeModel(
        colors: colorsMapper.mapToModel(dto.colors ?? const ColorDTO()),
        commonConfig: CommonConfigModel(appName: dto.commonConfig?.appName ?? '', note: dto.commonConfig?.note ?? ''),
        textStyles: _toTextStyleCollectionModel(dto.textStyles),
        images: ConfiguratorImagesSetting(
            logo: imageMapper.mapToModel(dto.images?.logo ?? const ImageDTO()),
            onboarding: imageMapper.mapToModel(dto.images?.onboarding ?? const ImageDTO())),
        id: dto.id);
  }

  FontModel _toTextStyleCollectionModel(TextStyleCollectionDTO? dto) {
    return FontModel(
      generalFontName: dto?.generalFontName ?? '',
      displayLarge: dto?.displayLarge == null ? TextStyleModel() : textStyleMapper.mapToModel(dto!.displayLarge!),
      displayMedium: dto?.displayMedium == null ? TextStyleModel() : textStyleMapper.mapToModel(dto!.displayMedium!),
      displaySmall: dto?.displaySmall == null ? TextStyleModel() : textStyleMapper.mapToModel(dto!.displaySmall!),
      headlineLarge: dto?.headlineLarge == null ? TextStyleModel() : textStyleMapper.mapToModel(dto!.headlineLarge!),
      headlineMedium: dto?.headlineMedium == null ? TextStyleModel() : textStyleMapper.mapToModel(dto!.headlineMedium!),
      headlineSmall: dto?.headlineSmall == null ? TextStyleModel() : textStyleMapper.mapToModel(dto!.headlineSmall!),
      titleLarge: dto?.titleLarge == null ? TextStyleModel() : textStyleMapper.mapToModel(dto!.titleLarge!),
      titleMedium: dto?.titleMedium == null ? TextStyleModel() : textStyleMapper.mapToModel(dto!.titleMedium!),
      titleSmall: dto?.titleSmall == null ? TextStyleModel() : textStyleMapper.mapToModel(dto!.titleSmall!),
      bodyLarge: dto?.bodyLarge == null ? TextStyleModel() : textStyleMapper.mapToModel(dto!.bodyLarge!),
      bodyMedium: dto?.bodyMedium == null ? TextStyleModel() : textStyleMapper.mapToModel(dto!.bodyMedium!),
      bodySmall: dto?.bodySmall == null ? TextStyleModel() : textStyleMapper.mapToModel(dto!.bodySmall!),
      labelLarge: dto?.labelLarge == null ? TextStyleModel() : textStyleMapper.mapToModel(dto!.labelLarge!),
      labelMedium: dto?.labelMedium == null ? TextStyleModel() : textStyleMapper.mapToModel(dto!.labelMedium!),
      labelSmall: dto?.labelSmall == null ? TextStyleModel() : textStyleMapper.mapToModel(dto!.labelSmall!),
    );
  }

  TextStyleCollectionDTO _toTextStyleCollectionDTO(FontModel model) {
    return TextStyleCollectionDTO(
      generalFontName: model.generalFontName,
      displayLarge: textStyleMapper.mapToDto(model.displayLarge),
      displayMedium: textStyleMapper.mapToDto(model.displayMedium),
      displaySmall: textStyleMapper.mapToDto(model.displaySmall),
      headlineLarge: textStyleMapper.mapToDto(model.headlineLarge),
      headlineMedium: textStyleMapper.mapToDto(model.headlineMedium),
      headlineSmall: textStyleMapper.mapToDto(model.headlineSmall),
      titleLarge: textStyleMapper.mapToDto(model.titleLarge),
      titleMedium: textStyleMapper.mapToDto(model.titleMedium),
      titleSmall: textStyleMapper.mapToDto(model.titleSmall),
      bodyLarge: textStyleMapper.mapToDto(model.bodyLarge),
      bodyMedium: textStyleMapper.mapToDto(model.bodyMedium),
      bodySmall: textStyleMapper.mapToDto(model.bodySmall),
      labelLarge: textStyleMapper.mapToDto(model.labelLarge),
      labelMedium: textStyleMapper.mapToDto(model.labelMedium),
      labelSmall: textStyleMapper.mapToDto(model.labelSmall),
    );
  }
}
