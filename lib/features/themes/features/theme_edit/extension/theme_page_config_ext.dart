import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/features.dart';

extension ThemePageConfigExt on ThemePageConfig {
  ThemePageConfig copyWIthUrlResources() {
    final loginData = login.copyWithUrlResources();
    return copyWith(
      login: loginData,
    );
  }
}
