import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';

import '../../../dto/dto.dart';
import '../../../models/theme/theme.dart';
import '../../mapper.dart';

@Injectable(as: Mapper<ThemeDTO, AppConfigurationModel>)
class ThemeMapper extends Mapper<ThemeDTO, AppConfigurationModel> {
  ThemeMapper(
    this.colorsMapper,
    this.textStyleMapper,
    this.imageMapper,
  );

  final Mapper<ColorDTO, ColorsModel> colorsMapper;
  final Mapper<TextStyleDTO, TextStyle> textStyleMapper;
  final Mapper<ImageDTO, ImageModel> imageMapper;

  @override
  ThemeDTO mapToDto(AppConfigurationModel model) {
    return ThemeDTO(
        colors: colorsMapper.mapToDto(model.colors),
        commonConfig: ThemeCommonDTO(
          appName: model.commonConfig.appName,
        ),
        textStyles: _toTextStyleCollectionDTO(model.fontModel),
        images: ImageCollectionDTO(
          applicationLogo: imageMapper.mapToDto(model.images.applicationLogo),
          notificationLogo: imageMapper.mapToDto(model.images.notificationLogo),
          onboarding: imageMapper.mapToDto(model.images.onboarding),
        ),
        id: model.id);
  }

  @override
  AppConfigurationModel mapToModel(ThemeDTO dto) {
    return AppConfigurationModel(
        colors: colorsMapper.mapToModel(dto.colors ?? const ColorDTO()),
        commonConfig: CommonConfigModel(
          appName: dto.commonConfig?.appName ?? '',
        ),
        fontModel: _toTextStyleCollectionModel(dto.textStyles),
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

  TextThemeModel _toTextStyleCollectionModel(TextStyleCollectionDTO? dto) {
    return TextThemeModel(
      fontFamily: dto?.fontFamily,
      textTheme: TextTheme(
        displayLarge: dto?.displayLarge == null ? const TextStyle() : textStyleMapper.mapToModel(dto!.displayLarge!),
        displayMedium: dto?.displayMedium == null ? const TextStyle() : textStyleMapper.mapToModel(dto!.displayMedium!),
        displaySmall: dto?.displaySmall == null ? const TextStyle() : textStyleMapper.mapToModel(dto!.displaySmall!),
        headlineLarge: dto?.headlineLarge == null ? const TextStyle() : textStyleMapper.mapToModel(dto!.headlineLarge!),
        headlineMedium:
            dto?.headlineMedium == null ? const TextStyle() : textStyleMapper.mapToModel(dto!.headlineMedium!),
        headlineSmall: dto?.headlineSmall == null ? const TextStyle() : textStyleMapper.mapToModel(dto!.headlineSmall!),
        titleLarge: dto?.titleLarge == null ? const TextStyle() : textStyleMapper.mapToModel(dto!.titleLarge!),
        titleMedium: dto?.titleMedium == null ? const TextStyle() : textStyleMapper.mapToModel(dto!.titleMedium!),
        titleSmall: dto?.titleSmall == null ? const TextStyle() : textStyleMapper.mapToModel(dto!.titleSmall!),
        bodyLarge: dto?.bodyLarge == null ? const TextStyle() : textStyleMapper.mapToModel(dto!.bodyLarge!),
        bodyMedium: dto?.bodyMedium == null ? const TextStyle() : textStyleMapper.mapToModel(dto!.bodyMedium!),
        bodySmall: dto?.bodySmall == null ? const TextStyle() : textStyleMapper.mapToModel(dto!.bodySmall!),
        labelLarge: dto?.labelLarge == null ? const TextStyle() : textStyleMapper.mapToModel(dto!.labelLarge!),
        labelMedium: dto?.labelMedium == null ? const TextStyle() : textStyleMapper.mapToModel(dto!.labelMedium!),
        labelSmall: dto?.labelSmall == null ? const TextStyle() : textStyleMapper.mapToModel(dto!.labelSmall!),
      ),
    );
  }

  TextStyleCollectionDTO _toTextStyleCollectionDTO(TextThemeModel model) {
    return TextStyleCollectionDTO(
      fontFamily: model.fontFamily,
      displayLarge: textStyleMapper.mapToDto(model.textTheme.displayLarge!),
      displayMedium: textStyleMapper.mapToDto(model.textTheme.displayMedium!),
      displaySmall: textStyleMapper.mapToDto(model.textTheme.displaySmall!),
      headlineLarge: textStyleMapper.mapToDto(model.textTheme.headlineLarge!),
      headlineMedium: textStyleMapper.mapToDto(model.textTheme.headlineMedium!),
      headlineSmall: textStyleMapper.mapToDto(model.textTheme.headlineSmall!),
      titleLarge: textStyleMapper.mapToDto(model.textTheme.titleLarge!),
      titleMedium: textStyleMapper.mapToDto(model.textTheme.titleMedium!),
      titleSmall: textStyleMapper.mapToDto(model.textTheme.titleSmall!),
      bodyLarge: textStyleMapper.mapToDto(model.textTheme.bodyLarge!),
      bodyMedium: textStyleMapper.mapToDto(model.textTheme.bodyMedium!),
      bodySmall: textStyleMapper.mapToDto(model.textTheme.bodySmall!),
      labelLarge: textStyleMapper.mapToDto(model.textTheme.labelLarge!),
      labelMedium: textStyleMapper.mapToDto(model.textTheme.labelMedium!),
      labelSmall: textStyleMapper.mapToDto(model.textTheme.labelSmall!),
    );
  }
}
