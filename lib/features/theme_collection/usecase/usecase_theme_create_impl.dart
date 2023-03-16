import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_theme_create.dart';

@Injectable(as: UsecaseThemeCreate)
class UsecaseThemeCreateImpl implements UsecaseThemeCreate {
  UsecaseThemeCreateImpl(
    this._themeRepository,
    this.authRepository,
    this.mapper,
  );

  final AuthRepository authRepository;
  final ThemeRepository _themeRepository;
  final Mapper<ThemeDTO, AppConfigurationModel> mapper;

  @override
  Future<AppConfigurationModel> execute({
    required String applicationId,
    required AppConfigurationModel themeModel,
  }) async {
    final uid = await authRepository.getUserUID();
    final theme = await _themeRepository.createTheme(uid!, applicationId, mapper.mapToDto(themeModel));
    return mapper.mapToModel(theme);
  }
}
