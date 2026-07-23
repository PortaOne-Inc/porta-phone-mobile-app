import 'package:injectable/injectable.dart';

import '../../models/themes/theme_model.dart';
import '../../repository/repository.dart';

abstract class UsecaseThemeUpdate {
  Future<ThemeModel?> execute({required ThemeModel themeModel});
}

@Injectable(as: UsecaseThemeUpdate)
class UsecaseThemeUpdateImpl extends UsecaseThemeUpdate {
  UsecaseThemeUpdateImpl({
    required this.themeRepository,
    required this.authRepository,
    required this.resourcesRepository,
    @factoryParam required this.applicationId,
  });

  String applicationId;

  final ThemeRepository themeRepository;
  final AuthRepository authRepository;
  final ResourcesRepository resourcesRepository;

  @override
  Future<ThemeModel?> execute({required ThemeModel themeModel}) async {
    return themeRepository.updateTheme(applicationId, themeModel);
  }
}
