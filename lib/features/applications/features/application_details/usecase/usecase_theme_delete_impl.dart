import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/core/core.dart';

import 'usecase_theme_delete.dart';

@Injectable(as: UsecaseThemeDeleteCreate)
class UsecaseThemeDeleteCreateImpl implements UsecaseThemeDeleteCreate {
  UsecaseThemeDeleteCreateImpl(
    this.themeRepository,
    this.authRepository,
    this.applicationMapper,
  );

  final ThemeRepository themeRepository;
  final AuthRepository authRepository;
  final Mapper<ThemeDTO?, ThemeModel?> applicationMapper;

  @override
  Future<void> execute({
    required String applicationId,
    required String themeId,
  }) async {
    await themeRepository.deleteTheme(applicationId, themeId);
  }
}
