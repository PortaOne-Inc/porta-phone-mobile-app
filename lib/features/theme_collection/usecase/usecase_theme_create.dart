import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseThemeCreate {
  Future<AppConfigurationModel> execute({
    required String applicationId,
    required AppConfigurationModel themeModel,
  });
}
