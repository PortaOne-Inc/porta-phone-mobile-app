import 'package:injectable/injectable.dart';

import 'package:dto/dto.dart';

import '../../models/application/application_model.dart';
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
      version: model.version,
      platformIdentifier: model.platformIdentifier,
      androidPlatformId: model.androidPlatformId,
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
      version: dto.version ?? 0,
      platformIdentifier: dto.platformIdentifier,
      androidPlatformId: dto.androidPlatformId,
      iosPlatformId: dto.iosPlatformId,
      termsConditionsUrl: dto.termsConditionsUrl,
      coreUrl: dto.coreUrl,
    );
  }
}
