import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:dto/dto.dart';

import '../../entity/entity.dart';
import '../../repository/repository.dart';

abstract class UsecaseThemeGetAll {
  FutureOr<List<ThemeModel>> execute({
    required String applicationId,
    int? countThemes,
  });
}

@Injectable(as: UsecaseThemeGetAll)
class UsecaseThemeGetAllImpl extends UsecaseThemeGetAll {
  UsecaseThemeGetAllImpl({
    required this.themeRepository,
    required this.authRepository,
    required this.mapper,
  });

  final ThemeRepository themeRepository;
  final AuthRepository authRepository;

  final Mapper<ThemeDTO?, ThemeModel?> mapper;

  @override
  FutureOr<List<ThemeModel>> execute({required String applicationId, int? countThemes}) async {
    final theme = await themeRepository.getThemes(applicationId);
    final models = mapper.mapToModels(theme).whereType<ThemeModel>().toList();

    if (countThemes == null) {
      return models.toList();
    } else {
      return models.take((countThemes)).toList();
    }
  }
}
