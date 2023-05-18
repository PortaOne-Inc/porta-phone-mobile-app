import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_theme_get.dart';

@Named(UsecaseThemeGet.staticUsecaseKey)
@Injectable(as: UsecaseThemeGet)
class UsecaseThemeStaticGetImpl implements UsecaseThemeGet {
  UsecaseThemeStaticGetImpl({
    required this.themeRepository,
    required this.authRepository,
    required this.mapper,
  });

  final ThemeRepository themeRepository;
  final AuthRepository authRepository;

  final Mapper<ThemeDTO?, ThemeModel?> mapper;

  @override
  Future<ThemeModel> execute() async {
    final dto = await themeRepository.getStaticTheme();
    return mapper.mapToModel(dto)!;
  }
}
