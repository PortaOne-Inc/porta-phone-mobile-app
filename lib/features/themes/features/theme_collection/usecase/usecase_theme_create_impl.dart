import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/core/core.dart';

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
  final Mapper<ThemeDTO?, ThemeModel?> mapper;

  @override
  Future<ThemeModel> execute({
    required String applicationId,
    required ThemeModel themeModel,
  }) async {
    final theme = await _themeRepository.createTheme(applicationId, mapper.mapToDto(themeModel)!);
    return mapper.mapToModel(theme)!;
  }
}
