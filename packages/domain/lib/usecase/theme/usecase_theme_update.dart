import 'package:injectable/injectable.dart';

import 'package:dto/dto.dart';

import '../../entity/entity.dart';
import '../../repository/repository.dart';

abstract class UsecaseThemeUpdate {
  static const String applicationEditUsecaseKey = 'applicationEditUsecaseKey';
  static const String staticEditUsecaseKey = 'staticEditUsecaseKey';

  Future<ThemeModel?> execute({
    required ThemeModel themeModel,
  });
}

@Named(UsecaseThemeUpdate.staticEditUsecaseKey)
@Injectable(as: UsecaseThemeUpdate)
class UsecaseThemeStaticUpdateImpl extends UsecaseThemeUpdate {
  UsecaseThemeStaticUpdateImpl({
    required this.themeRepository,
    required this.authRepository,
    required this.resourcesRepository,
    required this.mapper,
  });

  final ThemeRepository themeRepository;
  final AuthRepository authRepository;
  final ResourcesRepository resourcesRepository;

  final Mapper<ThemeDTO?, ThemeModel?> mapper;

  @override
  Future<ThemeModel?> execute({
    required ThemeModel themeModel,
  }) async {
    final dtoTheme = mapper.mapToDto(themeModel);

    final images = ImageCollectionDTO(
      primaryOnboardingLogo: await _getImageUrl(themeModel.images.primaryOnboardingLogo),
      secondaryOnboardingLogo: await _getImageUrl(themeModel.images.secondaryOnboardingLogo),
      notificationLogo: await _getImageUrl(themeModel.systemAssets.notificationLogo),
      adaptiveIconBackground: await _getImageUrl(themeModel.systemAssets.adaptiveIconBackground),
      adaptiveIconForeground: await _getImageUrl(themeModel.systemAssets.adaptiveIconForeground),
      iosLauncherIcon: await _getImageUrl(themeModel.systemAssets.iosLauncherIcon),
      androidLauncherIcon: await _getImageUrl(themeModel.systemAssets.androidLauncherIcon),
      webLauncherIcon: await _getImageUrl(themeModel.systemAssets.webLauncherIcon),
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
      return await resourcesRepository.putBase64('theme', imageModel!.name!, imageModel.data!);
    } else {
      return imageModel?.url;
    }
  }
}

@Named(UsecaseThemeUpdate.applicationEditUsecaseKey)
@Injectable(as: UsecaseThemeUpdate)
class UsecaseThemeUpdateImpl extends UsecaseThemeUpdate {
  UsecaseThemeUpdateImpl({
    required this.themeRepository,
    required this.authRepository,
    required this.resourcesRepository,
    required this.mapper,
    @factoryParam required this.applicationId,
  });

  String applicationId;

  final ThemeRepository themeRepository;
  final AuthRepository authRepository;
  final ResourcesRepository resourcesRepository;

  final Mapper<ThemeDTO?, ThemeModel?> mapper;

  @override
  Future<ThemeModel?> execute({
    required ThemeModel themeModel,
  }) async {
    final dtoTheme = mapper.mapToDto(themeModel);

    final images = ImageCollectionDTO(
      primaryOnboardingLogo: await _getImageUrl(themeModel.images.primaryOnboardingLogo),
      secondaryOnboardingLogo: await _getImageUrl(themeModel.images.secondaryOnboardingLogo),
      notificationLogo: await _getImageUrl(themeModel.systemAssets.notificationLogo),
      adaptiveIconBackground: await _getImageUrl(themeModel.systemAssets.adaptiveIconBackground),
      adaptiveIconForeground: await _getImageUrl(themeModel.systemAssets.adaptiveIconForeground),
      iosLauncherIcon: await _getImageUrl(themeModel.systemAssets.iosLauncherIcon),
      androidLauncherIcon: await _getImageUrl(themeModel.systemAssets.androidLauncherIcon),
      webLauncherIcon: await _getImageUrl(themeModel.systemAssets.webLauncherIcon),
    );

    final theme = await themeRepository.updateTheme(applicationId, dtoTheme?.copyWith(images: images));

    return mapper.mapToModel(theme);
  }

  // If model was changed in ui and added new image it's mean field ready to upload
  bool _isShouldBeUploadedImage(ImageModel? imageModel) {
    return imageModel?.data != null;
  }

  // Get url for dto if base64 resource available in data
  Future<String?> _getImageUrl(ImageModel imageModel) async {
    if (_isShouldBeUploadedImage(imageModel)) {
      return await resourcesRepository.putBase64('theme', imageModel.name!, imageModel.data!);
    } else {
      return imageModel.url;
    }
  }
}
