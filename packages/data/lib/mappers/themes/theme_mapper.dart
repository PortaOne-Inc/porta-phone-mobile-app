import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';
import 'package:dto/dto.dart';

import '../mapper.dart';

@Injectable(as: CommonMapper<ThemeModel, ThemeDTO>)
class ThemeMapper extends CommonMapper<ThemeModel, ThemeDTO> {
  ThemeMapper(
    this.colorsMapper,
    this.imageMapper,
    this.textsMapper,
  );

  final CommonMapper<ColorSchemeModel, ColorDTO> colorsMapper;
  final CommonMapper<ImageModel?, ImageDTO?> imageMapper;
  final CommonMapper<TextsModel?, TextsDTO?> textsMapper;

  @override
  ThemeDTO convertTo(ThemeModel it) {
    final colorScheme = it.colors != null ? colorsMapper.convertTo(it.colors!) : null;
    final images = ImageCollectionDTO(
      primaryOnboardingLogo: it.images.primaryOnboardingLogo.url,
      secondaryOnboardingLogo: it.images.secondaryOnboardingLogo.url,
      notificationLogo: it.systemAssets.notificationLogo.url,
      adaptiveIconBackground: it.systemAssets.adaptiveIconBackground.url,
      adaptiveIconForeground: it.systemAssets.adaptiveIconForeground.url,
      androidLauncherIcon: it.systemAssets.androidLauncherIcon.url,
      iosLauncherIcon: it.systemAssets.iosLauncherIcon.url,
      webLauncherIcon: it.systemAssets.webLauncherIcon.url,
    );

    return ThemeDTO(
      id: it.id,
      name: it.name,
      fontFamily: it.fontFamily,
      images: images,
      colors: colorScheme,
      texts: textsMapper.convertTo(it.texts),
    );
  }

  @override
  ThemeModel convertFrom(ThemeDTO it) {
    final colorScheme = it.colors != null ? colorsMapper.convertFrom(it.colors!) : null;
    final assets = SystemAssetsModel(
      notificationLogo: ImageModel(url: it.images?.notificationLogo),
      adaptiveIconBackground: ImageModel(url: it.images?.adaptiveIconBackground),
      adaptiveIconForeground: ImageModel(url: it.images?.adaptiveIconForeground),
      androidLauncherIcon: ImageModel(url: it.images?.androidLauncherIcon),
      iosLauncherIcon: ImageModel(url: it.images?.iosLauncherIcon),
      webLauncherIcon: ImageModel(url: it.images?.webLauncherIcon),
    );
    final images = ImageSchemeModel(
      primaryOnboardingLogo: ImageModel(url: it.images?.primaryOnboardingLogo),
      secondaryOnboardingLogo: ImageModel(url: it.images?.secondaryOnboardingLogo),
    );

    return ThemeModel(
      id: it.id,
      name: it.name,
      fontFamily: it.fontFamily,
      colors: colorScheme,
      texts: textsMapper.convertFrom(it.texts),
      images: images,
      systemAssets: assets,
    );
  }
}
