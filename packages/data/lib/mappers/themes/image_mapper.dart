import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';
import 'package:dto/dto.dart';

import '../mapper.dart';

@Injectable(as: CommonMapper<ImageModel?, ImageDTO?>)
class ImageMapper extends CommonMapper<ImageModel?, ImageDTO?> {
  @override
  ImageDTO? convertTo(ImageModel? it) {
    return it == null
        ? const ImageDTO()
        : ImageDTO(
            data: it.data,
            name: it.name,
            extension: it.extension,
          );
  }

  @override
  ImageModel? convertFrom(ImageDTO? it) {
    return it == null
        ? const ImageModel()
        : ImageModel(
            data: it.data,
            name: it.name,
            extension: it.extension,
          );
  }
}
