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
      description: model.description,
      id: model.id,
      uuid: model.uuid,
      theme: mapper.mapToDto(model.theme),
      androidIdentifier: model.androidIdentifier,
      iosIdentifier: model.iosIdentifier,
    );
  }

  @override
  ApplicationModel mapToModel(VendorDTO dto) {
    return ApplicationModel(
      title: dto.title,
      description: dto.description,
      id: dto.id,
      theme: mapper.mapToModel(dto.theme),
      uuid: dto.uuid ?? '',
      androidIdentifier: dto.androidIdentifier,
      iosIdentifier: dto.iosIdentifier,
    );
  }
}
