import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseThemeUpdate {
  Future<ThemeModel> execute({
    required String applicationId,
    required ThemeModel themeModel,
  });
}
