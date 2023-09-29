import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:dto/dto.dart';

import '../../entity/entity.dart';
import '../../repository/repository.dart';

abstract class UsecaseThemeDeleteCreate {
  Future<void> execute({
    required String applicationId,
    required String themeId,
  });
}



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
