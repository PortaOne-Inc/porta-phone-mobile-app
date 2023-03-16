import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';

import '../../../dto/dto.dart';
import '../../mapper.dart';

@Injectable(as: Mapper<TextStyleDTO?, TextStyle?>)
class TextStyleMapper extends Mapper<TextStyleDTO?, TextStyle?> {
  @override
  TextStyleDTO? mapToDto(TextStyle? model) {
    return model == null
        ? const TextStyleDTO()
        : TextStyleDTO(
            letterSpacing: model.letterSpacing,
            wordSpacing: model.wordSpacing,
            height: model.height,
          );
  }

  @override
  TextStyle? mapToModel(TextStyleDTO? dto) {
    return dto == null
        ? const TextStyle()
        : TextStyle(
            letterSpacing: dto.letterSpacing,
            wordSpacing: dto.wordSpacing,
            height: dto.height,
          );
  }
}
