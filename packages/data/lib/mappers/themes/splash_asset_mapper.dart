import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../../dto/dto.dart';
import '../mapper.dart';

@Injectable(as: CommonMapper<SplashAssetModel?, SplashAssetsDto?>)
class SplashAssetsMapper extends CommonMapper<SplashAssetModel?, SplashAssetsDto?> {
  SplashAssetsMapper();

  @override
  SplashAssetsDto? convertTo(SplashAssetModel? it) {
    return SplashAssetsDto(
      originalAssetId: it?.originalAssetId,
      pictureUrl: it?.pictureUrl,
      color: it?.color,
    );
  }

  @override
  SplashAssetModel? convertFrom(SplashAssetsDto? it) {
    return SplashAssetModel(
      originalAssetId: it?.originalAssetId,
      pictureUrl: it?.pictureUrl,
      color: it?.color,
    );
  }
}
