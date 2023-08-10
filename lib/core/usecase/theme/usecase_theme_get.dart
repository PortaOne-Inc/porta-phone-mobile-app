import 'package:webtrit_configurator/core/core.dart';

abstract class UsecaseThemeGet {
  static const String applicationUsecaseKey = 'applicationUsecaseKey';
  static const String staticUsecaseKey = 'staticUsecaseKey';

  Future<ThemeModel> execute();
}
