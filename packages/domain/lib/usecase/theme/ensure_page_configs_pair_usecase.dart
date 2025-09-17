import 'dart:async';
import 'package:injectable/injectable.dart';

import '../../models/themes/page_config_model.dart';
import '../../repository/theme/page_config_repository.dart';

abstract class EnsurePageConfigsPairUsecase {
  FutureOr<({PageConfigModel light, PageConfigModel dark})> execute({
    required String applicationId,
    required String themeId,
  });
}

@Injectable(as: EnsurePageConfigsPairUsecase)
class EnsurePageConfigsPairUsecaseImpl extends EnsurePageConfigsPairUsecase {
  EnsurePageConfigsPairUsecaseImpl({required this.repo});
  final PageConfigRepository repo;

  @override
  FutureOr<({PageConfigModel light, PageConfigModel dark})> execute({
    required String applicationId,
    required String themeId,
  }) {
    return repo.ensurePair(applicationId: applicationId, themeId: themeId);
  }
}
