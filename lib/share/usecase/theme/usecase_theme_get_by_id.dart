import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseThemeGetById {
  Future<ThemeModel> execute({
    required String themeId,
    required String applicationId,
  });
}
