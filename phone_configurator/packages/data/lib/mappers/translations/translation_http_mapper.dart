import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:data/mappers/mapper.dart';
import 'package:data/dto/dto.dart';

@Injectable(as: CommonMapper<Translation, TranslationHttpModel>)
class TranslationHttpMapper
    extends CommonMapper<Translation, TranslationHttpModel> {
  @override
  Translation convertFrom(TranslationHttpModel it) {
    return Translation(locale: it.locale, key: it.key, value: it.value);
  }

  @override
  TranslationHttpModel convertTo(Translation it) {
    return TranslationHttpModel(
      locale: it.locale,
      key: it.key,
      value: it.value,
    );
  }
}
