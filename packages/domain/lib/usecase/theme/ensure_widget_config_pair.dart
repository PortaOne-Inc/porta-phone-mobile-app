import 'package:injectable/injectable.dart';

import '../../models/themes/widgets_config.dart';
import '../../repository/theme/widget_config_repository.dart';

abstract class EnsureWidgetConfigPairUsecase {
  Future<Map<String, WidgetsConfig>> execute(String appId, String themeId);
}

@Injectable(as: EnsureWidgetConfigPairUsecase)
class EnsureWidgetConfigPairUsecaseImpl extends EnsureWidgetConfigPairUsecase {
  EnsureWidgetConfigPairUsecaseImpl(this.repository);

  final WidgetConfigRepository repository;

  @override
  Future<Map<String, WidgetsConfig>> execute(String appId, String themeId) {
    return repository.ensurePair(appId, themeId);
  }
}
