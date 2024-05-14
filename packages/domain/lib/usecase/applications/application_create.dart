import 'dart:async';
import 'dart:typed_data';

import 'package:injectable/injectable.dart';

import 'package:dto/dto.dart';

import '../../entity/entity.dart';
import '../../repository/repository.dart';

abstract class ApplicationCreate {
  FutureOr<ApplicationModel> execute({
    required String name,
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
    this.mapper,
  );

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;
  final ResourcesRepository resourcesRepository;

  final Mapper<ApplicationDTO, ApplicationModel> mapper;

  @override
  FutureOr<ApplicationModel> execute({
    required String name,
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
      final googleService = await _generateGoogleService(
        platformIdentifier,
        androidGoogleServices,
        iosGoogleServices,
      );

      final model = ApplicationModel(
        name: name,
        platformIdentifier: platformIdentifier,
        androidPlatformId: androidPlatformId,
        iosPlatformId: iosPlatformId,
        androidVersion: androidVersion,
        iosVersion: iosVersion,
        coreUrl: coreUrl,
        termsConditionsUrl: termConditionsUrl,
        googleServices: googleService,
        version: version,
      );

      final dto = await applicationRepository.createApplication(mapper.mapToDto(model));
      return mapper.mapToModel(dto);
    } catch (e) {
      rethrow;
    }
  }

  Future<GoogleServicesModel?> _generateGoogleService(
    String? platformIdentifier,
    Uint8List? androidGoogleServices,
    Uint8List? iosGoogleServices,
  ) async {
    String? iosGoogleServiceUrl;
    String? androidGoogleServiceUrl;

    if (iosGoogleServices != null) {
      final iosGoogleServiceName = _generateGoogleServiceName(platformIdentifier ?? 'unknown', 'plist');
      iosGoogleServiceUrl = await resourcesRepository.putBytes(
        'google-services',
        iosGoogleServiceName,
        iosGoogleServices,
      );
    }

    if (androidGoogleServices != null) {
      final androidGoogleServiceName = _generateGoogleServiceName(platformIdentifier ?? 'unknown', 'json');
      androidGoogleServiceUrl = await resourcesRepository.putBytes(
        'google-services',
        androidGoogleServiceName,
        androidGoogleServices,
      );
    }

    return androidGoogleServiceUrl == null && iosGoogleServiceUrl == null
        ? null
        : GoogleServicesModel(
            androidUrl: androidGoogleServiceUrl,
            iosUrl: iosGoogleServiceUrl,
          );
  }

  String _generateGoogleServiceName(String platformIdentifier, String extension) {
    return '${DateTime.now().microsecondsSinceEpoch}-$platformIdentifier-google-services.$extension';
  }
}
