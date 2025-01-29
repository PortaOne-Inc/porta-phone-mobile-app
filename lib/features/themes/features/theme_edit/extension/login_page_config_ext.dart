import 'package:webtrit_configurator/core/core.dart';

extension LoginPageConfigExt on LoginPageConfig {
  LoginPageConfig copyWithUrlResources() {
    return copyWith(
      picture: pictureUrl ?? picture,
    );
  }

  String? get pictureUrl => metadata.getString(LoginPageConfig.metadataPictureUrl);
}
