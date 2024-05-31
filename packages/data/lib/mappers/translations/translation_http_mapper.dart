import 'package:data/models/models.dart';
import 'package:domain/entity/entity.dart';

// TODO(SERDUN): Use common interface instead of static
class TranslationHttpMapper {
  static Translation fromHttpModel(TranslationHttpModel model) {
    return Translation(
      locale: model.locale,
      key: model.key,
      value: model.value,
    );
  }

  static TranslationHttpModel toHttpModel(Translation entity) {
    return TranslationHttpModel(
      locale: entity.locale,
      key: entity.key,
      value: entity.value,
    );
  }
}
