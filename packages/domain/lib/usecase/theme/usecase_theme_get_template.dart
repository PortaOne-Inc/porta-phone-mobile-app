import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../entity/entity.dart';

abstract class UsecaseThemeGetTemplate {
  FutureOr<ThemeModel> execute({
    String? primaryColor,
    String? themeName,
  });
}

@Injectable(as: UsecaseThemeGetTemplate)
class GetThemTemplateUseCase extends UsecaseThemeGetTemplate {
  @override
  FutureOr<ThemeModel> execute({
    String? primaryColor,
    String? themeName,
  }) {
    return ThemeModel(
      name: themeName,
    );
  }
}
