import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';

import '../../dto/dto.dart';
import '../../models/theme/theme.dart';
import '../mapper.dart';

@Injectable(as: Mapper<ThemeDTO?, AppConfigurationModel?>)
class ThemeMapper extends Mapper<ThemeDTO?, AppConfigurationModel?> {
  ThemeMapper(
    this.colorsMapper,
    this.textStyleMapper,
    this.imageMapper,
  );

  final Mapper<ColorDTO?, ColorSchemeModel?> colorsMapper;
  final Mapper<TextStyleDTO?, TextStyle?> textStyleMapper;
  final Mapper<ImageDTO?, ImageModel?> imageMapper;

  @override
  ThemeDTO? mapToDto(AppConfigurationModel? model) {
    if (model == null) {
      return null;
    }

    return ThemeDTO(
        colorScheme: colorsMapper.mapToDto(model.colorScheme),
        commonConfig: ThemeCommonDTO(
          appName: model.commonConfig?.appName,
        ),
        fontFamily: model.fontFamily,
        images: ImageCollectionDTO(
          applicationLogo: imageMapper.mapToDto(model.images?.applicationLogo),
          notificationLogo: imageMapper.mapToDto(model.images?.notificationLogo),
          onboarding: imageMapper.mapToDto(model.images?.onboarding),
        ),
        id: model.id);
  }

  @override
  AppConfigurationModel? mapToModel(ThemeDTO? dto) {
    if (dto == null) {
      return null;
    }

    return AppConfigurationModel(
        colorScheme: colorsMapper.mapToModel(dto.colorScheme),
        commonConfig: CommonConfigModel(
          appName: dto.commonConfig?.appName ?? '',
        ),
        fontFamily: dto.fontFamily,
        images: ConfiguratorImagesSetting(
          applicationLogo: imageMapper.mapToModel(
            dto.images?.applicationLogo,
          ),
          notificationLogo: imageMapper.mapToModel(
            dto.images?.applicationLogo,
          ),
          onboarding: imageMapper.mapToModel(
            dto.images?.onboarding,
          ),
          adaptiveIconBackground: imageMapper.mapToModel(
            dto.images?.adaptiveIconBackground,
          ),
          adaptiveIconForeground: imageMapper.mapToModel(
            dto.images?.adaptiveIconForeground,
          ),
          androidLauncherIcon: imageMapper.mapToModel(
            dto.images?.androidLauncherIcon,
          ),
          iosLauncherIcon: imageMapper.mapToModel(
            dto.images?.iosLauncherIcon,
          ),
          webLauncherIcon: imageMapper.mapToModel(
            dto.images?.webLauncherIcon,
          ),
        ),
        id: dto.id);
  }
}
