import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_theme_update.dart';

@Injectable(as: UsecaseThemeUpdate)
class UsecaseThemeUpdateImpl extends UsecaseThemeUpdate {
  UsecaseThemeUpdateImpl({
    required this.themeRepository,
    required this.authRepository,
    required this.mapper,
  });

  final ThemeRepository themeRepository;
  final AuthRepository authRepository;
  final Mapper<ThemeDTO, ThemeModel> mapper;

  @override
  Future<ThemeModel> execute({
    required String applicationId,
    required ThemeModel themeModel,
  }) async {
    final uid = await authRepository.getUserUID();
    final theme = await themeRepository.updateTheme(
      uid!,
      applicationId,
      mapper.mapToDto(themeModel),
    );
    return mapper.mapToModel(theme);
  }
}
