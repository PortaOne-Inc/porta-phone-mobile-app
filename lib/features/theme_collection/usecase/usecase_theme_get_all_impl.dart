import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_theme_get_all.dart';

@Injectable(as: UsecaseThemeGetAll)
class UsecaseThemeGetAllImpl extends UsecaseThemeGetAll {
  UsecaseThemeGetAllImpl({
    required this.themeRepository,
    required this.authRepository,
    required this.mapper,
  });

  final ThemeRepository themeRepository;
  final AuthRepository authRepository;

  final Mapper<ThemeDTO?, AppConfigurationModel?> mapper;

  @override
  FutureOr<List<AppConfigurationModel>> execute({required String applicationId, int? countThemes}) async {
    final uid = await authRepository.getUserUID();
    final theme = await themeRepository.getThemes(uid!, applicationId);
    final models = mapper.mapToModels(theme).whereType<AppConfigurationModel>().toList();

    if (countThemes == null) {
      return models.toList();
    } else {
      return models.take((countThemes)).toList();
    }
  }
}
