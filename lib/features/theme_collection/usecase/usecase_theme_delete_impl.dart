import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_theme_delete.dart';

@Injectable(as: UsecaseThemeDeleteCreate)
class UsecaseThemeDeleteCreateImpl implements UsecaseThemeDeleteCreate {
  UsecaseThemeDeleteCreateImpl(this.themeRepository, this.authRepository, this.applicationMapper);

  final ThemeRepository themeRepository;
  final AuthRepository authRepository;
  final Mapper<ThemeDTO, ThemeModel> applicationMapper;

  @override
  Future<void> execute({required String applicationId, required ThemeModel themeModel}) async {
    final uid = await authRepository.getUserUID();
    themeRepository.deleteTheme(uid!, applicationId, applicationMapper.mapToDto(themeModel));
  }
}
