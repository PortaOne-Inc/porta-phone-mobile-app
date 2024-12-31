import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

abstract class UsecaseThemeCreate {
  Future<ThemeModel> execute({
    required String applicationId,
    required ThemeModel themeModel,
  });
}

@Injectable(as: UsecaseThemeCreate)
class UsecaseThemeCreateImpl implements UsecaseThemeCreate {
  UsecaseThemeCreateImpl(
    this._themeRepository,
  );

  final ThemeRepository _themeRepository;

  @override
  Future<ThemeModel> execute({
    required String applicationId,
    required ThemeModel themeModel,
  }) async {
    return _themeRepository.createTheme(applicationId, themeModel);
  }
}
