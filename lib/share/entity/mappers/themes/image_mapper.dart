import 'package:injectable/injectable.dart';

import '../../dto/dto.dart';
import '../../models/theme/theme.dart';
import '../mapper.dart';

@Injectable(as: Mapper<ImageDTO?, ImageModel?>)
class ImageMapper extends Mapper<ImageDTO?, ImageModel?> {
  @override
  ImageDTO? mapToDto(ImageModel? model) {
    return model == null
        ? const ImageDTO()
        : ImageDTO(
            data: model.data,
            name: model.name,
            mime: model.mime,
            extension: model.extension,
          );
  }

  @override
  ImageModel? mapToModel(ImageDTO? dto) {
    return dto == null
        ? ImageModel()
        : ImageModel(
            data: dto.data,
            name: dto.name,
            mime: dto.mime,
            extension: dto.extension,
          );
  }
}
