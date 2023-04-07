import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_theme_get_by_id.dart';

@Injectable(as: UsecaseThemeGetById)
class UsecaseThemeGetByIdImpl implements UsecaseThemeGetById {
  UsecaseThemeGetByIdImpl(this.themeRepository, this.authRepository, this.mapper);

  final ThemeRepository themeRepository;
  final AuthRepository authRepository;

  final Mapper<ThemeDTO?, ThemeModel?> mapper;

  @override
  Future<ThemeModel> execute({required String themeId, required String applicationId}) async {
    final uid = await authRepository.getUserUID();
    final dto = await themeRepository.getTheme(uid!, applicationId, themeId);
    return mapper.mapToModel(dto)!;
  }
}
