import 'dart:async';
import 'dart:typed_data';

import 'package:injectable/injectable.dart';

import 'package:dto/dto.dart';

import '../../entity/entity.dart';
import '../../repository/repository.dart';

abstract class UsecaseApplicationEdit {
  FutureOr<ApplicationModel> execute({
    required String id,
    required String name,
    String? androidPlatformId,
    String? iosPlatformId,
    BuildVersionModel? androidVersion,
    BuildVersionModel? iosVersion,
    String? coreUrl,
    String? termConditionsUrl,
    String? theme,
    Uint8List? newAndroidGoogleServices,
    Uint8List? newIosGoogleServices,
    String? applicationAndroidGoogleServicesUrl,
    String? applicationIosGoogleServicesUrl,
    int version = 0,
  });
}

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
    String? androidPlatformId,
    String? iosPlatformId,
    BuildVersionModel? androidVersion,
    BuildVersionModel? iosVersion,
    String? coreUrl,
    String? termConditionsUrl,
    String? theme,
    Uint8List? newAndroidGoogleServices,
    Uint8List? newIosGoogleServices,
    String? applicationAndroidGoogleServicesUrl,
    String? applicationIosGoogleServicesUrl,
    int version = 0,
  }) async {
    final model = ApplicationModel(
      name: name,
      androidPlatformId: androidPlatformId,
      iosPlatformId: iosPlatformId,
      androidVersion: androidVersion,
      iosVersion: iosVersion,
      coreUrl: coreUrl,
      termsConditionsUrl: termConditionsUrl,
    );

    // TODO(dmitry): The API does not work quite correctly, if there is no field, it makes it null instead of ignoring it.
    final dto = await applicationRepository.updateApplication(id, mapper.mapToDto(model));

    if (newAndroidGoogleServices != null) {
      await _deleteDeprecatedGoogleServices(applicationAndroidGoogleServicesUrl);
    }
    if (newAndroidGoogleServices != null) {
      await _deleteDeprecatedGoogleServices(applicationIosGoogleServicesUrl);
    }

    return mapper.mapToModel(dto);
  }

  Future<void> _deleteDeprecatedGoogleServices(String? applicationAndroidGoogleServicesUrl) async {
    if (applicationAndroidGoogleServicesUrl != null) {
      await resourcesRepository.delete(applicationAndroidGoogleServicesUrl);
    }
  }
}
