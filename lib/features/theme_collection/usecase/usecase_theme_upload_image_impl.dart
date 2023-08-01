import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/core/core.dart';

import 'usecase_theme_upload_image.dart';

@Injectable(as: UsecaseThemeUploadImage)
class UsecaseThemeUploadImageImpl implements UsecaseThemeUploadImage {
  UsecaseThemeUploadImageImpl(
    this._themeRepository,
    this.authRepository,
    this.mapper,
  );

  final AuthRepository authRepository;
  final ThemeRepository _themeRepository;
  final Mapper<ImageDTO?, ImageModel?> mapper;

  @override
  Future<String?> execute({required ImageModel? imageModel}) async {
    if (imageModel?.isNotAvailable ?? true) return null;
    final image = await _themeRepository.uploadThemeImage(mapper.mapToDto(imageModel)!);
    return image;
  }
}
