import 'package:data/dto/application/application.dart';
import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../mapper.dart';

@Injectable(as: CommonMapper<ApplicationModel, ApplicationDTO>)
class ApplicationMapper extends CommonMapper<ApplicationModel, ApplicationDTO> {
  @override
  ApplicationDTO convertTo(ApplicationModel it) {
    final appVersion = it.appVersion != null
        ? BuildVersionDTO(
            buildName: it.appVersion!.buildName,
            buildNumber: it.appVersion!.buildNumber,
          )
        : null;
    final androidVersion = it.androidVersion != null
        ? BuildVersionDTO(
            buildName: it.androidVersion!.buildName,
            buildNumber: it.androidVersion!.buildNumber,
          )
        : null;
    final iosVersion = it.iosVersion != null
        ? BuildVersionDTO(
            buildName: it.iosVersion!.buildName,
            buildNumber: it.iosVersion!.buildNumber,
          )
        : null;

    return ApplicationDTO(
      id: it.id,
      name: it.name,
      theme: it.theme,
      environment: it.environment,
      iosPlatformId: it.iosPlatformId,
      androidPlatformId: it.androidPlatformId,
      appVersion: appVersion,
      androidVersion: androidVersion,
      iosVersion: iosVersion,
      termsConditionsUrl: it.termsConditionsUrl,
    );
  }

  @override
  ApplicationModel convertFrom(ApplicationDTO it) {
    final appVersion = it.appVersion != null
        ? BuildVersionModel(
            buildName: it.appVersion!.buildName,
            buildNumber: it.appVersion!.buildNumber,
          )
        : null;
    final androidVersion = it.androidVersion != null
        ? BuildVersionModel(
            buildName: it.androidVersion!.buildName,
            buildNumber: it.androidVersion!.buildNumber,
          )
        : null;
    final iosVersion = it.iosVersion != null
        ? BuildVersionModel(
            buildName: it.iosVersion!.buildName,
            buildNumber: it.iosVersion!.buildNumber,
          )
        : null;

    return ApplicationModel(
      id: it.id,
      name: it.name,
      environment: it.environment,
      theme: it.theme,
      iosPlatformId: it.iosPlatformId,
      androidPlatformId: it.androidPlatformId,
      termsConditionsUrl: it.termsConditionsUrl,
      appVersion: appVersion,
      androidVersion: androidVersion,
      iosVersion: iosVersion,
    );
  }
}
