import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

abstract class UsecaseThemeCreate {
  Future<ThemeModel> execute({
    required String applicationId,
    required String title,
    required String description,
  });
}

@Injectable(as: UsecaseThemeCreate)
class UsecaseThemeCreateImpl implements UsecaseThemeCreate {
  UsecaseThemeCreateImpl(this._themeRepository);

  final ThemeRepository _themeRepository;

  @override
  Future<ThemeModel> execute({
    required String applicationId,
    required String title,
    required String description,
  }) async {
    return _themeRepository.createTheme(applicationId, title, description);
  }
}
