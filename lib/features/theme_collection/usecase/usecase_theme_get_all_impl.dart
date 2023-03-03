import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_theme_get_all.dart';

@Injectable(as: UsecaseThemeGetAll)
class UsecaseThemeGetAllImpl extends UsecaseThemeGetAll {
  UsecaseThemeGetAllImpl(this.themeRepository, this.authRepository, this.mapper);

  final ThemeRepository themeRepository;
  final AuthRepository authRepository;

  final Mapper<ThemeDTO, ThemeModel> mapper;

  @override
  FutureOr<List<ThemeModel>> execute({required String applicationId, int? countThemes}) async {
    final uid = await authRepository.getUserUID();
    final theme = await themeRepository.getThemes(uid!, applicationId);
    final models = mapper.mapToModels(theme);

    if (countThemes == null) {
      return models.toList();
    } else {
      return models.take((countThemes)).toList();
    }
  }
}
