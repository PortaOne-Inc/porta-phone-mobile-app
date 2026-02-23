import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';
import 'package:data/dto/dto.dart';
import 'package:data/mappers/mappers.dart';

@Injectable(as: CommonMapper<AssetLink, AssetLinkDto>)
class AssetLinkMapper extends CommonMapper<AssetLink, AssetLinkDto> {
  @override
  AssetLinkDto convertTo(AssetLink it) {
    return AssetLinkDto(type: it.type, id: it.id);
  }

  @override
  AssetLink convertFrom(AssetLinkDto it) {
    return AssetLink(type: it.type, id: it.id);
  }
}
