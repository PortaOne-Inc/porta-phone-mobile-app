import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

@Named(UsecaseThemeGet.applicationUsecaseKey)
@Injectable(as: UsecaseThemeGet)
class UsecaseThemeGetImpl implements UsecaseThemeGet {
  UsecaseThemeGetImpl({
    required this.themeRepository,
    required this.authRepository,
    required this.mapper,
    @factoryParam required this.applicationId,
    @factoryParam required this.themeId,
  });

  String applicationId;
  String themeId;
  final ThemeRepository themeRepository;
  final AuthRepository authRepository;

  final Mapper<ThemeDTO?, ThemeModel?> mapper;

  @override
  Future<ThemeModel> execute() async {
    final dto = await themeRepository.getTheme(applicationId, themeId);
    return mapper.mapToModel(dto)!;
  }
}
