import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class ApplicationCreate {
  FutureOr<ApplicationModel> execute({
    required String name,
    String? platformIdentifier,
    String? androidPlatformId,
    String? iosPlatformId,
    BuildVersionModel? androidVersion,
    BuildVersionModel? iosVersion,
    String? theme,
  });
}

@Injectable(as: ApplicationCreate)
class ApplicationCreateImpl extends ApplicationCreate {
  ApplicationCreateImpl(
    this.applicationRepository,
    this.authRepository,
    this.resourcesRepository,
  );

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;
  final ResourcesRepository resourcesRepository;

  @override
  FutureOr<ApplicationModel> execute({
    required String name,
    String? platformIdentifier,
    String? androidPlatformId,
    String? iosPlatformId,
    BuildVersionModel? androidVersion,
    BuildVersionModel? iosVersion,
    String? termConditionsUrl,
    String? theme,
  }) async {
    try {
      final model = ApplicationModel(
        name: name,
        androidPlatformId: androidPlatformId,
        iosPlatformId: iosPlatformId,
        androidVersion: androidVersion,
        iosVersion: iosVersion,
        termsConditionsUrl: termConditionsUrl,
      );

      return applicationRepository.createApplication(model);
    } catch (e) {
      rethrow;
    }
  }
}
