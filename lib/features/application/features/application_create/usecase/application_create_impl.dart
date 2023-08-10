import 'dart:async';
import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/core/entity/models/application/google_services_model.dart';

import 'application_create.dart';

@Injectable(as: ApplicationCreate)
class ApplicationCreateImpl extends ApplicationCreate {
  ApplicationCreateImpl(this.applicationRepository, this.authRepository, this.mapper);

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;
  final Mapper<ApplicationDTO, ApplicationModel> mapper;

  @override
  FutureOr<ApplicationModel> execute({
    required String name,
    required String platformIdentifier,
    String? theme,
    Uint8List? androidGoogleServices,
    Uint8List? iosGoogleServices,
    int version = 0,
  }) async {
    final iosGoogleServiceName = _generateGoogleServiceName(platformIdentifier, 'plist');
    final iosGoogleServiceUrl = await applicationRepository.uploadGoogleService(
      androidGoogleServices!,
      iosGoogleServiceName,
    );

    final androidGoogleServiceName = _generateGoogleServiceName(platformIdentifier, 'json');
    final androidGoogleServiceUrl = await applicationRepository.uploadGoogleService(
      iosGoogleServices!,
      androidGoogleServiceName,
    );

    final googleService = GoogleServicesModel(
      androidUrl: iosGoogleServiceUrl,
      iosUrl: androidGoogleServiceUrl,
    );

    final model = ApplicationModel(
      name: name,
      platformIdentifier: platformIdentifier,
      googleServices: googleService,
      version: version,
    );

    final dto = await applicationRepository.createApplication(mapper.mapToDto(model));
    return mapper.mapToModel(dto);
  }

  String _generateGoogleServiceName(String platformIdentifier, String extension) {
    return '${DateTime.now().microsecondsSinceEpoch}-$platformIdentifier-google-services.$extension';
  }
}
