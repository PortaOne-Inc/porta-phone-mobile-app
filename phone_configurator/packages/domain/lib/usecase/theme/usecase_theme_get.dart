import 'package:injectable/injectable.dart';

import '../../models/themes/theme_model.dart';
import '../../repository/repository.dart';

abstract class UsecaseThemeGet {
  Future<ThemeModel> execute();
}

@Injectable(as: UsecaseThemeGet)
class UsecaseThemeGetImpl implements UsecaseThemeGet {
  UsecaseThemeGetImpl({
    required this.themeRepository,
    required this.authRepository,
    @factoryParam required this.applicationId,
    @factoryParam required this.themeId,
  });

  String applicationId;
  String themeId;
  final ThemeRepository themeRepository;
  final AuthRepository authRepository;

  @override
  Future<ThemeModel> execute() async {
    return themeRepository.getTheme(applicationId, themeId);
  }
}
