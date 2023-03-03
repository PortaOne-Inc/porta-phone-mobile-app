import 'package:injectable/injectable.dart';

import '../../../dto/dto.dart';
import '../../../models/theme/theme.dart';
import '../../mapper.dart';

@Injectable(as: Mapper<ImageDTO, ImageModel>)
class ImageMapper extends Mapper<ImageDTO, ImageModel> {
  @override
  ImageDTO mapToDto(ImageModel model) {
    return ImageDTO(data: model.data, name: model.name, mime: model.mime);
  }

  @override
  ImageModel mapToModel(ImageDTO dto) {
    return ImageModel(data: dto.data, name: dto.name, mime: dto.mime);
  }
}
