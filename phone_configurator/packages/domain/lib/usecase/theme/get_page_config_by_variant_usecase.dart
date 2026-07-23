import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class GetPageConfigByVariantUsecase {
  FutureOr<PageConfigModel> execute({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
  });
}

@Injectable(as: GetPageConfigByVariantUsecase)
class GetPageConfigByVariantUsecaseImpl extends GetPageConfigByVariantUsecase {
  GetPageConfigByVariantUsecaseImpl({required this.repo});
  final PageConfigRepository repo;

  @override
  FutureOr<PageConfigModel> execute({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
  }) {
    return repo.getByThemeVariant(
      applicationId: applicationId,
      themeId: themeId,
      variant: variant,
    );
  }
}
