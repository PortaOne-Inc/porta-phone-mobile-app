import 'package:injectable/injectable.dart';

import 'package:dto/dto.dart';

import '../../models/application/application_model.dart';
import '../../models/theme/theme_model.dart';
import '../mapper_contract.dart';

@Injectable(as: Mapper<ApplicationDTO, ApplicationModel>)
class ApplicationMapper extends Mapper<ApplicationDTO, ApplicationModel> {
  final Mapper<ThemeDTO?, ThemeModel?> mapper;

  ApplicationMapper(this.mapper);

  @override
  ApplicationDTO mapToDto(ApplicationModel model) {
    return ApplicationDTO(
      name: model.name,
      id: model.id,
      theme: model.theme,
      version: model.version,
      platformIdentifier: model.platformIdentifier,
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
      termsConditionsUrl: dto.termsConditionsUrl,
      coreUrl: dto.coreUrl,
    );
  }
}
