import 'package:injectable/injectable.dart';

import '../../../dto/dto.dart';
import '../../../models/theme/theme.dart';
import '../../mapper.dart';

@Injectable(as: Mapper<TextStyleDTO, TextStyleModel>)
class TextStyleMapper extends Mapper<TextStyleDTO, TextStyleModel> {
  @override
  TextStyleDTO mapToDto(TextStyleModel model) {
    return TextStyleDTO(
        name: model.fontName, letterSpacing: model.letterSpacing, wordSpacing: model.wordSpacing, height: model.height);
  }

  @override
  TextStyleModel mapToModel(TextStyleDTO dto) {
    return TextStyleModel(
        fontName: dto.name, letterSpacing: dto.letterSpacing, wordSpacing: dto.wordSpacing, height: dto.height);
  }
}
