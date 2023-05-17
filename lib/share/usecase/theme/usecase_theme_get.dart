import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseThemeGet {
  static const String applicationUsecaseKey = 'applicationUsecaseKey';

  Future<ThemeModel> execute({
    required String themeId,
    required String applicationId,
  });
}
