import 'dart:async';
import 'dart:typed_data';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/core/entity/models/application/google_services_model.dart';

import 'application_create.dart';

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
    required String platformIdentifier,
    String? coreUrl,
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
        coreUrl: coreUrl,
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
    String platformIdentifier,
    Uint8List? androidGoogleServices,
    Uint8List? iosGoogleServices,
  ) async {
    String? iosGoogleServiceUrl;
    String? androidGoogleServiceUrl;

    if (iosGoogleServices != null) {
      final iosGoogleServiceName = _generateGoogleServiceName(platformIdentifier, 'plist');
      iosGoogleServiceUrl = await resourcesRepository.putBytes(
        'google-services',
        iosGoogleServiceName,
        iosGoogleServices,
      );
    }

    if (androidGoogleServices != null) {
      final androidGoogleServiceName = _generateGoogleServiceName(platformIdentifier, 'json');
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
