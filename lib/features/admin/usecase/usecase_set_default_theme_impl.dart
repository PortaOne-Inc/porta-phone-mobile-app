import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_set_default_theme.dart';

@Injectable(as: UsecaseSetDefaultTheme)
class UsecaseSetDefaultThemeImpl implements UsecaseSetDefaultTheme {
  UsecaseSetDefaultThemeImpl(
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
