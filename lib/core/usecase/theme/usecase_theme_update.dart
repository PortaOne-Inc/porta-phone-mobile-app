import 'package:webtrit_configurator/core/core.dart';

abstract class UsecaseThemeUpdate {
  static const String applicationEditUsecaseKey = 'applicationEditUsecaseKey';
  static const String staticEditUsecaseKey = 'staticEditUsecaseKey';

  Future<ThemeModel?> execute({
    required ThemeModel themeModel,
  });
}
