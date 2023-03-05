import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webtrit_configurator/share/share.dart';

import '../../../share/entity/models/theme/theme.dart';
import '../../theme_create/usecase/usecase_theme_get_template.dart';

@Injectable(as: UsecaseThemeGetTemplate)
class GetThemTemplateUseCase extends UsecaseThemeGetTemplate {
  @override
  FutureOr<ThemeModel> execute({int? primaryColor, String? themeName}) {
    return ThemeModel(
      images: ConfiguratorImagesSetting(
        onboarding: ImageModel(),
        logo: ImageModel(),
      ),
      textStyles: FontModel.empty(),
      commonConfig: CommonConfigModel(
        appName: themeName ?? '',
        note: '',
      ),
      colors: ColorsModel(
          gradientTabColor: [0xFF58A1A4, 0xFF343D77],
          primary: primaryColor ?? 0xFFF5841F,
          secondary: 0xFF3D5B68,
          onPrimary: 0xFF000000,
          error: 0xFFE74C3C,
          tertiary: 0xFF75B943,
          onSecondaryContainer: 0xFFC5CED2,
          outline: 0xFFF3F5F6,
          onBackground: 0xFF000000,
          background: 0xFFFFFFFF,
          secondaryContainer: 0xFFC5CED2,
          onSurface: 0xFFF3F5F6,
          surface: 0xFFF3F5F6),
      id: null,
    );
  }
}
