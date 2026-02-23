import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../models/themes/theme_model.dart';
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
  });

  final ThemeRepository themeRepository;
  final AuthRepository authRepository;

  @override
  FutureOr<List<ThemeModel>> execute({
    required String applicationId,
    int? countThemes,
  }) async {
    return themeRepository.getApplicationThemes(applicationId);
  }
}
