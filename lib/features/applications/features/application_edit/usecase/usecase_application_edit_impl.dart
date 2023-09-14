import 'dart:async';
import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/core/entity/models/application/google_services_model.dart';

import 'usecase_application_edit.dart';

@Injectable(as: UsecaseApplicationEdit)
class UsecaseApplicationEditImpl extends UsecaseApplicationEdit {
  UsecaseApplicationEditImpl({
    required this.applicationRepository,
    required this.authRepository,
    required this.resourcesRepository,
    required this.mapper,
  });

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;
  final ResourcesRepository resourcesRepository;

  final Mapper<ApplicationDTO, ApplicationModel> mapper;

  @override
  FutureOr<ApplicationModel> execute({
    required String id,
    required String name,
    required String platformIdentifier,
    String? coreUrl,
    String? theme,
    Uint8List? newAndroidGoogleServices,
    Uint8List? newIosGoogleServices,
    String? applicationAndroidGoogleServicesUrl,
    String? applicationIosGoogleServicesUrl,
    int version = 0,
  }) async {
    String? iosGoogleServicesUrl = applicationIosGoogleServicesUrl;
    String? androidGoogleServicesUrl = applicationAndroidGoogleServicesUrl;

    if (newAndroidGoogleServices != null) {
      iosGoogleServicesUrl = await _uploadIosGoogleServices(platformIdentifier, newAndroidGoogleServices);
    }

    if (newIosGoogleServices != null) {
      androidGoogleServicesUrl = await _uploadAndroidGoogleServices(platformIdentifier, newIosGoogleServices);
    }

    final model = ApplicationModel(
      name: name,
      platformIdentifier: platformIdentifier,
      coreUrl: coreUrl,
      googleServices: GoogleServicesModel(
        iosUrl: iosGoogleServicesUrl,
        androidUrl: androidGoogleServicesUrl,
      ),
      version: version,
    );

    // TODO: The API does not work quite correctly, if there is no field, it makes it null instead of ignoring it.
    final dto = await applicationRepository.updateApplication(id, mapper.mapToDto(model));

    if (newAndroidGoogleServices != null) {
      _deleteDeprecatedGoogleServices(applicationAndroidGoogleServicesUrl);
    }
    if (newAndroidGoogleServices != null) {
      _deleteDeprecatedGoogleServices(applicationIosGoogleServicesUrl);
    }

    return mapper.mapToModel(dto);
  }

  void _deleteDeprecatedGoogleServices(String? applicationAndroidGoogleServicesUrl) {
    if (applicationAndroidGoogleServicesUrl != null) {
      resourcesRepository.delete(applicationAndroidGoogleServicesUrl);
    }
  }

  Future<String> _uploadAndroidGoogleServices(String platformIdentifier, Uint8List? newIosGoogleServices) async {
    final androidGoogleServiceName = _generateGoogleServiceName(platformIdentifier, 'json');
    final androidGoogleServiceUrl = await resourcesRepository.putBytes(
      'google-services',
      androidGoogleServiceName,
      newIosGoogleServices!,
    );
    return androidGoogleServiceUrl;
  }

  Future<String> _uploadIosGoogleServices(String platformIdentifier, Uint8List? newAndroidGoogleServices) async {
    final iosGoogleServiceName = _generateGoogleServiceName(platformIdentifier, 'plist');
    final iosGoogleServiceUrl = await resourcesRepository.putBytes(
      'google-services',
      iosGoogleServiceName,
      newAndroidGoogleServices!,
    );
    return iosGoogleServiceUrl;
  }

  String _generateGoogleServiceName(String platformIdentifier, String extension) {
    return '${DateTime.now().microsecondsSinceEpoch}-$platformIdentifier-google-services.$extension';
  }
}
