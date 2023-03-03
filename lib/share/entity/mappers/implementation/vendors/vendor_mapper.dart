import 'package:injectable/injectable.dart';

import '../../../entity.dart';

@Injectable(as: Mapper<VendorDTO, ApplicationModel>)
class VendorMapper extends Mapper<VendorDTO, ApplicationModel> {
  VendorMapper();

  @override
  VendorDTO mapToDto(ApplicationModel model) {
    return VendorDTO(
        title: model.title, description: model.description, id: model.id, uuid: model.uuid, theme: model.theme);
  }

  @override
  ApplicationModel mapToModel(VendorDTO dto) {
    return ApplicationModel(
        title: dto.title ?? '',
        description: dto.description ?? '',
        id: dto.id ?? '',
        theme: dto.theme,
        uuid: dto.uuid ?? '');
  }
}
