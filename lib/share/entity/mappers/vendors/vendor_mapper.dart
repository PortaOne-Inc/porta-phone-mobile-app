import 'package:injectable/injectable.dart';

import '../../entity.dart';

@Injectable(as: Mapper<VendorDTO, ApplicationModel>)
class VendorMapper extends Mapper<VendorDTO, ApplicationModel> {
  final Mapper<ThemeDTO?, AppConfigurationModel?> mapper;

  VendorMapper(this.mapper);

  @override
  VendorDTO mapToDto(ApplicationModel model) {
    return VendorDTO(
      title: model.title,
      id: model.id,
      theme: mapper.mapToDto(model.theme),
      applicationIdentifier: model.applicationIdentifier,
    );
  }

  @override
  ApplicationModel mapToModel(VendorDTO dto) {
    return ApplicationModel(
      title: dto.title,
      id: dto.id,
      theme: mapper.mapToModel(dto.theme),
      applicationIdentifier: dto.applicationIdentifier,
    );
  }
}
