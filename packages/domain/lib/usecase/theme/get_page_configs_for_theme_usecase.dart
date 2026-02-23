import 'dart:async';
import 'package:injectable/injectable.dart';

import '../../models/themes/page_config_model.dart';
import '../../repository/theme/page_config_repository.dart';

abstract class GetPageConfigsForThemeUsecase {
  FutureOr<List<PageConfigModel>> execute({
    required String applicationId,
    required String themeId,
  });
}

@Injectable(as: GetPageConfigsForThemeUsecase)
class GetPageConfigsForThemeUsecaseImpl extends GetPageConfigsForThemeUsecase {
  GetPageConfigsForThemeUsecaseImpl({required this.repo});
  final PageConfigRepository repo;

  @override
  FutureOr<List<PageConfigModel>> execute({
    required String applicationId,
    required String themeId,
  }) {
    return repo.listForTheme(applicationId: applicationId, themeId: themeId);
  }
}
