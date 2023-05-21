import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';

import '../../dto/dto.dart';
import '../../models/models.dart';
import '../mapper.dart';

@Injectable(as: Mapper<ThemeDTO?, ThemeModel?>)
class ThemeMapper extends Mapper<ThemeDTO?, ThemeModel?> {
  ThemeMapper(
    this.colorsMapper,
    this.imageMapper,
    this.textsMapper,
  );

  final Mapper<ColorDTO?, ColorSchemeModel?> colorsMapper;
  final Mapper<ImageDTO?, ImageModel?> imageMapper;
  final Mapper<TextsDTO?, TextsModel?> textsMapper;

  @override
  ThemeDTO? mapToDto(ThemeModel? model) {
    if (model == null) {
      return null;
    }

    return ThemeDTO(
      name: model.name,
      fontFamily: model.fontFamily,
      id: model.id,
      colors: colorsMapper.mapToDto(model.colors),
      texts: textsMapper.mapToDto(model.texts),
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
  ThemeModel? mapToModel(ThemeDTO? dto) {
    if (dto == null) {
      return null;
    }

    return ThemeModel(
        colors: colorsMapper.mapToModel(dto.colors),
        name: dto.name,
        fontFamily: dto.fontFamily,
        texts: textsMapper.mapToModel(dto.texts),
        images: ImageSchemeModel(
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
