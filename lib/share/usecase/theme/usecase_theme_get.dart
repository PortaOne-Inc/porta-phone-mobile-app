import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseThemeGet {
  Future<ThemeModel> execute({
    required String themeId,
    required String applicationId,
  });
}
