import 'package:injectable/injectable.dart';

import '../../../dto/dto.dart';
import '../../../models/theme/theme.dart';
import '../../mapper.dart';

@Injectable(as: Mapper<ThemeDTO, ThemeModel>)
class ThemeMapper extends Mapper<ThemeDTO, ThemeModel> {
  ThemeMapper(
    this.colorsMapper,
    this.textStyleMapper,
    this.imageMapper,
  );

  final Mapper<ColorDTO, ColorsModel> colorsMapper;
  final Mapper<TextStyleDTO, TextStyleModel> textStyleMapper;
  final Mapper<ImageDTO, ImageModel> imageMapper;

  @override
  ThemeDTO mapToDto(ThemeModel model) {
    return ThemeDTO(
        colors: colorsMapper.mapToDto(model.colors),
        commonConfig: ThemeCommonDTO(
          appName: model.commonConfig.appName,
        ),
        textStyles: _toTextStyleCollectionDTO(model.textStyles),
        images: ImageCollectionDTO(
            applicationLogo: imageMapper.mapToDto(model.images.applicationLogo),
            notificationLogo: imageMapper.mapToDto(model.images.notificationLogo),
            onboarding: imageMapper.mapToDto(model.images.onboarding)),
        id: model.id);
  }

  @override
  ThemeModel mapToModel(ThemeDTO dto) {
    return ThemeModel(
        colors: colorsMapper.mapToModel(dto.colors ?? const ColorDTO()),
        commonConfig: CommonConfigModel(
          appName: dto.commonConfig?.appName ?? '',
        ),
        textStyles: _toTextStyleCollectionModel(dto.textStyles),
        images: ConfiguratorImagesSetting(
          applicationLogo: imageMapper.mapToModel(
            dto.images?.applicationLogo ?? const ImageDTO(),
          ),
          notificationLogo: imageMapper.mapToModel(
            dto.images?.applicationLogo ?? const ImageDTO(),
          ),
          onboarding: imageMapper.mapToModel(
            dto.images?.onboarding ?? const ImageDTO(),
          ),
          adaptiveIconBackground: imageMapper.mapToModel(
            dto.images?.adaptiveIconBackground ?? const ImageDTO(),
          ),
          adaptiveIconForeground: imageMapper.mapToModel(
            dto.images?.adaptiveIconForeground ?? const ImageDTO(),
          ),
          androidLauncherIcon: imageMapper.mapToModel(
            dto.images?.androidLauncherIcon ?? const ImageDTO(),
          ),
          iosLauncherIcon: imageMapper.mapToModel(
            dto.images?.iosLauncherIcon ?? const ImageDTO(),
          ),
          webLauncherIcon: imageMapper.mapToModel(
            dto.images?.webLauncherIcon ?? const ImageDTO(),
          ),
        ),
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
