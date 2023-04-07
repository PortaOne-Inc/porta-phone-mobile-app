import 'package:injectable/injectable.dart';

import '../../entity.dart';

@Injectable(as: Mapper<ApplicationDTO, ApplicationModel>)
class VendorMapper extends Mapper<ApplicationDTO, ApplicationModel> {
  final Mapper<ThemeDTO?, ThemeModel?> mapper;

  VendorMapper(this.mapper);

  @override
  ApplicationDTO mapToDto(ApplicationModel model) {
    return ApplicationDTO(
      name: model.name,
      id: model.id,
      theme: model.theme,
      platformIdentifier: model.platformIdentifier,
    );
  }

  @override
  ApplicationModel mapToModel(ApplicationDTO dto) {
    return ApplicationModel(
      name: dto.name,
      id: dto.id,
      theme: dto.theme,
      platformIdentifier: dto.platformIdentifier,
    );
  }
}
