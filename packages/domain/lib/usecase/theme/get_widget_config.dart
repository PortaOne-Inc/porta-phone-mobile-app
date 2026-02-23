import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class GetWidgetConfigUsecase {
  Future<WidgetsConfig> execute(
    String appId,
    String themeId,
    BrightnessVariant variant,
  );
}

@Injectable(as: GetWidgetConfigUsecase)
class GetWidgetConfigUsecaseImpl extends GetWidgetConfigUsecase {
  GetWidgetConfigUsecaseImpl(this.repository);

  final WidgetConfigRepository repository;

  @override
  Future<WidgetsConfig> execute(
    String appId,
    String themeId,
    BrightnessVariant variant,
  ) {
    return repository.getByThemeVariant(appId, themeId, variant);
  }
}
