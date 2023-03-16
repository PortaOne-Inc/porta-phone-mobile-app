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
        fontFamily: model.fontFamily,
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
        fontFamily: dto.fontFamily,
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


}
