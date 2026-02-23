import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../repository/repository.dart';

abstract class UsecaseThemeDeleteCreate {
  Future<void> execute({
    required String applicationId,
    required String themeId,
  });
}

@Injectable(as: UsecaseThemeDeleteCreate)
class UsecaseThemeDeleteCreateImpl implements UsecaseThemeDeleteCreate {
  UsecaseThemeDeleteCreateImpl(this.themeRepository, this.authRepository);

  final ThemeRepository themeRepository;
  final AuthRepository authRepository;

  @override
  Future<void> execute({
    required String applicationId,
    required String themeId,
  }) async {
    await themeRepository.deleteTheme(applicationId, themeId);
  }
}
