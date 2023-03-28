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
      id: model.id,
      images: ImageCollectionDTO(
        applicationLogo: model.images?.applicationLogo?.url,
        notificationLogo: model.images?.notificationLogo?.url,
        onboarding: model.images?.onboarding?.url,
        adaptiveIconBackground: model.images?.adaptiveIconBackground?.url,
        adaptiveIconForeground: model.images?.adaptiveIconForeground?.url,
        androidLauncherIcon: model.images?.androidLauncherIcon?.url,
        iosLauncherIcon: model.images?.iosLauncherIcon?.url,
        webLauncherIcon: model.images?.webLauncherIcon?.url,
      ),
    );
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
          applicationLogo: ImageModel(url: dto.images?.applicationLogo),
          notificationLogo: ImageModel(url: dto.images?.notificationLogo),
          onboarding: ImageModel(url: dto.images?.onboarding),
          adaptiveIconBackground: ImageModel(url: dto.images?.adaptiveIconBackground),
          adaptiveIconForeground: ImageModel(url: dto.images?.adaptiveIconForeground),
          androidLauncherIcon: ImageModel(url: dto.images?.androidLauncherIcon),
          iosLauncherIcon: ImageModel(url: dto.images?.iosLauncherIcon),
          webLauncherIcon: ImageModel(url: dto.images?.webLauncherIcon),
        ),
        id: dto.id);
  }
}
