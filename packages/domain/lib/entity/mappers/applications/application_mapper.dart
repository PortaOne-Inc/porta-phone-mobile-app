import 'package:injectable/injectable.dart';

import 'package:dto/dto.dart';

import '../../models/application/application_model.dart';
import '../../models/application/build_version_model.dart';
import '../../models/theme/theme_model.dart';
import '../mapper_contract.dart';

@Injectable(as: Mapper<ApplicationDTO, ApplicationModel>)
class ApplicationMapper extends Mapper<ApplicationDTO, ApplicationModel> {
  ApplicationMapper(this.mapper);
  final Mapper<ThemeDTO?, ThemeModel?> mapper;

  @override
  ApplicationDTO mapToDto(ApplicationModel model) {
    return ApplicationDTO(
      name: model.name,
      id: model.id,
      theme: model.theme,
      androidPlatformId: model.androidPlatformId,
      androidVersion: BuildVersionDTO(
        buildName: model.androidVersion?.buildName,
        buildNumber: model.androidVersion?.buildNumber,
      ),
      iosVersion: BuildVersionDTO(
        buildName: model.iosVersion?.buildName,
        buildNumber: model.iosVersion?.buildNumber,
      ),
      iosPlatformId: model.iosPlatformId,
      termsConditionsUrl: model.termsConditionsUrl,
      coreUrl: model.coreUrl,
    );
  }

  @override
  ApplicationModel mapToModel(ApplicationDTO dto) {
    return ApplicationModel(
      name: dto.name,
      id: dto.id,
      theme: dto.theme,
      androidPlatformId: dto.androidPlatformId,
      iosPlatformId: dto.iosPlatformId,
      termsConditionsUrl: dto.termsConditionsUrl,
      androidVersion: BuildVersionModel(
        buildName: dto.androidVersion?.buildName,
        buildNumber: dto.androidVersion?.buildNumber,
      ),
      iosVersion: BuildVersionModel(
        buildName: dto.iosVersion?.buildName,
        buildNumber: dto.iosVersion?.buildNumber,
      ),
      coreUrl: dto.coreUrl,
    );
  }
}
