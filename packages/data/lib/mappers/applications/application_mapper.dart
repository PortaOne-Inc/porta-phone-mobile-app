import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';
import 'package:dto/dto.dart';

import '../mapper.dart';

@Injectable(as: CommonMapper<ApplicationModel, ApplicationDTO>)
class ApplicationMapper extends CommonMapper<ApplicationModel, ApplicationDTO> {
  @override
  ApplicationDTO convertTo(ApplicationModel it) {
    final androidVersion = BuildVersionDTO(
      buildName: it.androidVersion?.buildName,
      buildNumber: it.androidVersion?.buildNumber,
    );
    final iosVersion = BuildVersionDTO(
      buildName: it.iosVersion?.buildName,
      buildNumber: it.iosVersion?.buildNumber,
    );

    return ApplicationDTO(
      id: it.id,
      name: it.name,
      theme: it.theme,
      iosPlatformId: it.iosPlatformId,
      androidPlatformId: it.androidPlatformId,
      androidVersion: androidVersion,
      iosVersion: iosVersion,
      termsConditionsUrl: it.termsConditionsUrl,
      coreUrl: it.coreUrl,
      demo: it.demo,
    );
  }

  @override
  ApplicationModel convertFrom(ApplicationDTO it) {
    final androidVersion = BuildVersionModel(
      buildName: it.androidVersion?.buildName,
      buildNumber: it.androidVersion?.buildNumber,
    );
    final iosVersion = BuildVersionModel(
      buildName: it.iosVersion?.buildName,
      buildNumber: it.iosVersion?.buildNumber,
    );

    return ApplicationModel(
      id: it.id,
      name: it.name,
      theme: it.theme,
      iosPlatformId: it.iosPlatformId,
      androidPlatformId: it.androidPlatformId,
      termsConditionsUrl: it.termsConditionsUrl,
      androidVersion: androidVersion,
      iosVersion: iosVersion,
      coreUrl: it.coreUrl,
      demo: it.demo,
    );
  }
}
