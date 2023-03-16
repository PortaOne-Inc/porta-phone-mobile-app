import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseThemeUpdate {
  Future<AppConfigurationModel> execute({
    required String applicationId,
    required AppConfigurationModel themeModel,
  });
}
