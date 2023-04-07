import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_theme_update.dart';
import 'usecase_theme_upload_image.dart';

@Injectable(as: UsecaseThemeUpdate)
class UsecaseThemeUpdateImpl extends UsecaseThemeUpdate {
  UsecaseThemeUpdateImpl({
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
  Future<ThemeModel> execute({
    required String applicationId,
    required ThemeModel themeModel,
  }) async {
    final uid = await authRepository.getUserUID();
    final dtoTheme = mapper.mapToDto(themeModel);

    final notificationLogo = await uploadImage.execute(imageModel: themeModel.images?.notificationLogo);
    final onboarding = await uploadImage.execute(imageModel: themeModel.images?.onboarding);
    final applicationLogo = await uploadImage.execute(imageModel: themeModel.images?.applicationLogo);
    final adaptiveIconBackground = await uploadImage.execute(imageModel: themeModel.images?.adaptiveIconBackground);
    final adaptiveIconForeground = await uploadImage.execute(imageModel: themeModel.images?.adaptiveIconForeground);
    final iosLauncherIcon = await uploadImage.execute(imageModel: themeModel.images?.iosLauncherIcon);
    final androidLauncherIcon = await uploadImage.execute(imageModel: themeModel.images?.androidLauncherIcon);
    final webLauncherIcon = await uploadImage.execute(imageModel: themeModel.images?.webLauncherIcon);

    final theme = await themeRepository.updateTheme(
        uid!,
        applicationId,
        dtoTheme?.copyWith(
            images: ImageCollectionDTO(
          onboarding: onboarding,
          notificationLogo: notificationLogo,
          applicationLogo: applicationLogo,
          adaptiveIconBackground: adaptiveIconBackground,
          adaptiveIconForeground: adaptiveIconForeground,
          iosLauncherIcon: iosLauncherIcon,
          androidLauncherIcon: androidLauncherIcon,
          webLauncherIcon: webLauncherIcon,
        )));
    return mapper.mapToModel(theme)!;
  }
}
