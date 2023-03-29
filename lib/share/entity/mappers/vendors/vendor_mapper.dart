import 'package:injectable/injectable.dart';

import '../../entity.dart';

@Injectable(as: Mapper<VendorDTO, ApplicationModel>)
class VendorMapper extends Mapper<VendorDTO, ApplicationModel> {
  final Mapper<ThemeDTO?, AppConfigurationModel?> mapper;

  VendorMapper(this.mapper);

  @override
  VendorDTO mapToDto(ApplicationModel model) {
    return VendorDTO(
      name: model.name,
      id: model.id,
      theme: mapper.mapToDto(model.theme),
      platformIdentifier: model.platformIdentifier,
    );
  }

  @override
  ApplicationModel mapToModel(VendorDTO dto) {
    return ApplicationModel(
      name: dto.name,
      id: dto.id,
      theme: mapper.mapToModel(dto.theme),
      platformIdentifier: dto.platformIdentifier,
    );
  }
}
