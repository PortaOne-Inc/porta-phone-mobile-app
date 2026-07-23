import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class UpsertPageConfigByVariantUsecase {
  Future<PageConfigModel> execute({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
    Map<String, dynamic>? config,
    int? expectedVersion,
  });
}

@Injectable(as: UpsertPageConfigByVariantUsecase)
class UpsertPageConfigByVariantUsecaseImpl
    extends UpsertPageConfigByVariantUsecase {
  UpsertPageConfigByVariantUsecaseImpl({required this.repo});

  final PageConfigRepository repo;

  @override
  Future<PageConfigModel> execute({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
    Map<String, dynamic>? config,
    int? expectedVersion,
  }) {
    return repo.upsertByThemeVariant(
      applicationId: applicationId,
      themeId: themeId,
      variant: variant,
      config: config,
      expectedVersion: expectedVersion,
    );
  }
}
