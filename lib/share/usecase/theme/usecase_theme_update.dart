import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseThemeUpdate {
  static const String applicationEditUsecaseKey = 'applicationEditUsecaseKey';
  Future<ThemeModel?> execute({
    required ThemeModel themeModel,
  });
}
