import 'package:injectable/injectable.dart';

import '../../dto/dto.dart';
import '../../models/models.dart';
import '../mapper_contract.dart';

@Injectable(as: Mapper<TextsDTO?, TextsModel?>)
class TextsMapper extends Mapper<TextsDTO?, TextsModel?> {
  @override
  TextsDTO? mapToDto(TextsModel? model) {
    return model == null
        ? const TextsDTO()
        : TextsDTO(
            greeting: model.greeting,
            contactEmail: model.contactEmail,
          );
  }

  @override
  TextsModel? mapToModel(TextsDTO? dto) {
    return dto == null
        ? const TextsModel()
        : TextsModel(
            greeting: dto.greeting,
            contactEmail: dto.contactEmail,
          );
  }
}
