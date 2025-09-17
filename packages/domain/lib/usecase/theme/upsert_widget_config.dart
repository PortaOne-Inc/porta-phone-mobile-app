import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class UpsertWidgetConfigUsecase {
  Future<WidgetsConfig> execute(
    String appId,
    String themeId,
    BrightnessVariant variant,
    Map<String, dynamic>? config,
  );
}

@Injectable(as: UpsertWidgetConfigUsecase)
class UpsertWidgetConfigUsecaseImpl extends UpsertWidgetConfigUsecase {
  UpsertWidgetConfigUsecaseImpl(this.repository);

  final WidgetConfigRepository repository;

  @override
  Future<WidgetsConfig> execute(
    String appId,
    String themeId,
    BrightnessVariant variant,
    Map<String, dynamic>? config,
  ) {
    return repository.upsertByThemeVariant(appId, themeId, variant, config);
  }
}
