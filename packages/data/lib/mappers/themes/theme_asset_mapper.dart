import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:data/dto/dto.dart';
import 'package:data/mappers/mappers.dart';

@Injectable(as: CommonMapper<ThemeAssetModel, ThemeAssetDto>)
class ThemeAssetMapper extends CommonMapper<ThemeAssetModel, ThemeAssetDto> {
  ThemeAssetMapper();

  @override
  ThemeAssetDto convertTo(ThemeAssetModel it) {
    return ThemeAssetDto(
      id: it.id,
      name: it.name,
      description: it.description,
      file: it.file,
      url: it.url,
      type: it.type.name,
    );
  }

  @override
  ThemeAssetModel convertFrom(ThemeAssetDto it) {
    return ThemeAssetModel(
      id: it.id,
      name: it.name,
      description: it.description,
      file: it.file,
      url: it.url,
      type: ThemeAssetType.values.firstWhere((e) => e.name == it.type, orElse: () => ThemeAssetType.unknown),
    );
  }
}
