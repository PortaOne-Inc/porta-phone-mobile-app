import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import '../../../features/theme_collection/usecase/usecase_theme_upload_image.dart';

@Named(UsecaseThemeUpdate.staticEditUsecaseKey)
@Injectable(as: UsecaseThemeUpdate)
class UsecaseThemeStaticUpdateImpl extends UsecaseThemeUpdate {
  UsecaseThemeStaticUpdateImpl({
    required this.uploadImage,
    required this.themeRepository,
    required this.authRepository,
    required this.mapper,
  });

  final ThemeRepository themeRepository;
  final AuthRepository authRepository;
  final Mapper<ThemeDTO?, ThemeModel?> mapper;
  final UsecaseThemeUploadImage uploadImage;

  @override
  Future<ThemeModel?> execute({
    required ThemeModel themeModel,
  }) async {
    final dtoTheme = mapper.mapToDto(themeModel);

    final images = ImageCollectionDTO(
      primaryOnboardingLogo: await _getImageUrl(themeModel.images?.primaryOnboardingLogo),
      secondaryOnboardingLogo: await _getImageUrl(themeModel.images?.secondaryOnboardingLogo),
      notificationLogo: await _getImageUrl(themeModel.images?.notificationLogo),
      adaptiveIconBackground: await _getImageUrl(themeModel.images?.adaptiveIconBackground),
      adaptiveIconForeground: await _getImageUrl(themeModel.images?.adaptiveIconForeground),
      iosLauncherIcon: await _getImageUrl(themeModel.images?.iosLauncherIcon),
      androidLauncherIcon: await _getImageUrl(themeModel.images?.androidLauncherIcon),
      webLauncherIcon: await _getImageUrl(themeModel.images?.webLauncherIcon),
    );

    final theme = await themeRepository.updateStaticTheme(dtoTheme?.copyWith(images: images));

    return mapper.mapToModel(theme);
  }

  // If model was changed in ui and added new image it's mean field ready to upload
  bool _isShouldBeUploadedImage(ImageModel? imageModel) {
    return imageModel?.data != null;
  }

  // Get url for dto if base64 resource available in data
  Future<String?> _getImageUrl(ImageModel? imageModel) async {
    if (_isShouldBeUploadedImage(imageModel)) {
      return await uploadImage.execute(imageModel: imageModel);
    } else {
      return imageModel?.url;
    }
  }
}
