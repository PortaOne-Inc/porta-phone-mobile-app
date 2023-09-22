import 'package:injectable/injectable.dart';

import 'package:data/data.dart';

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
        primaryOnboardingLogo: model.images.primaryOnboardingLogo.url,
        secondaryOnboardingLogo: model.images.secondaryOnboardingLogo.url,
        notificationLogo: model.systemAssets.notificationLogo.url,
        adaptiveIconBackground: model.systemAssets.adaptiveIconBackground.url,
        adaptiveIconForeground: model.systemAssets.adaptiveIconForeground.url,
        androidLauncherIcon: model.systemAssets.androidLauncherIcon.url,
        iosLauncherIcon: model.systemAssets.iosLauncherIcon.url,
        webLauncherIcon: model.systemAssets.webLauncherIcon.url,
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
          primaryOnboardingLogo: ImageModel(url: dto.images?.primaryOnboardingLogo),
          secondaryOnboardingLogo: ImageModel(url: dto.images?.secondaryOnboardingLogo),
        ),
        systemAssets: SystemAssetsModel(
          notificationLogo: ImageModel(url: dto.images?.notificationLogo),
          adaptiveIconBackground: ImageModel(url: dto.images?.adaptiveIconBackground),
          adaptiveIconForeground: ImageModel(url: dto.images?.adaptiveIconForeground),
          androidLauncherIcon: ImageModel(url: dto.images?.androidLauncherIcon),
          iosLauncherIcon: ImageModel(url: dto.images?.iosLauncherIcon),
          webLauncherIcon: ImageModel(url: dto.images?.webLauncherIcon),
        ),
        id: dto.id);
  }
}
