import 'package:injectable/injectable.dart';

import 'package:dto/dto.dart';
import 'package:domain/domain.dart';

import '../mapper.dart';

@Injectable(as: CommonMapper<TextsModel?, TextsDTO?>)
class TextsMapper extends CommonMapper<TextsModel?, TextsDTO?> {
  @override
  TextsDTO? convertTo(TextsModel? it) {
    return it == null
        ? const TextsDTO()
        : TextsDTO(
            greeting: it.greeting,
            contactEmail: it.contactEmail,
          );
  }

  @override
  TextsModel? convertFrom(TextsDTO? it) {
    return it == null
        ? const TextsModel()
        : TextsModel(
            greeting: it.greeting,
            contactEmail: it.contactEmail,
          );
  }
}
