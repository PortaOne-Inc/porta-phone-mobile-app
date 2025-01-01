import 'dart:async';
import 'dart:typed_data';

import 'package:injectable/injectable.dart';

import '../../entity/entity.dart';
import '../../repository/repository.dart';

abstract class ApplicationCreate {
  FutureOr<ApplicationModel> execute({
    required String name,
    String? contactEmail,
    String? platformIdentifier,
    String? androidPlatformId,
    String? iosPlatformId,
    BuildVersionModel? androidVersion,
    BuildVersionModel? iosVersion,
    String? coreUrl,
    String? termConditionsUrl,
    String? theme,
    Uint8List? androidGoogleServices,
    Uint8List? iosGoogleServices,
    int version = 0,
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
    String? contactEmail,
    String? platformIdentifier,
    String? androidPlatformId,
    String? iosPlatformId,
    BuildVersionModel? androidVersion,
    BuildVersionModel? iosVersion,
    String? coreUrl,
    String? termConditionsUrl,
    String? theme,
    Uint8List? androidGoogleServices,
    Uint8List? iosGoogleServices,
    int version = 0,
  }) async {
    try {
      final model = ApplicationModel(
        name: name,
        contactEmail: contactEmail,
        androidPlatformId: androidPlatformId,
        iosPlatformId: iosPlatformId,
        androidVersion: androidVersion,
        iosVersion: iosVersion,
        coreUrl: coreUrl,
        termsConditionsUrl: termConditionsUrl,
      );

      return applicationRepository.createApplication(model);
    } catch (e) {
      rethrow;
    }
  }
}
