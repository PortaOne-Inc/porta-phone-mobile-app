import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';
import 'package:data/dto/dto.dart';
import 'package:data/mappers/mappers.dart';

@Injectable(
  as:
      CommonMapper<
        SplashConstraintsDefaultsSliceModel,
        SplashConstraintsDefaultsSliceDto
      >,
)
class SplashConstraintsDefaultsSliceMapper
    extends
        CommonMapper<
          SplashConstraintsDefaultsSliceModel,
          SplashConstraintsDefaultsSliceDto
        > {
  @override
  SplashConstraintsDefaultsSliceDto convertTo(
    SplashConstraintsDefaultsSliceModel it,
  ) {
    return SplashConstraintsDefaultsSliceDto(
      fullSizeDp: it.fullSizeDp,
      maskDiameterDp: it.maskDiameterDp,
      toleranceDp: it.toleranceDp,
    );
  }

  @override
  SplashConstraintsDefaultsSliceModel convertFrom(
    SplashConstraintsDefaultsSliceDto it,
  ) {
    return SplashConstraintsDefaultsSliceModel(
      fullSizeDp: it.fullSizeDp,
      maskDiameterDp: it.maskDiameterDp,
      toleranceDp: it.toleranceDp,
    );
  }
}

@Injectable(
  as:
      CommonMapper<
        SplashConstraintsDefaultsModel,
        SplashConstraintsDefaultsDto
      >,
)
class SplashConstraintsDefaultsMapper
    extends
        CommonMapper<
          SplashConstraintsDefaultsModel,
          SplashConstraintsDefaultsDto
        > {
  SplashConstraintsDefaultsMapper(this._sliceMapper);

  final CommonMapper<
    SplashConstraintsDefaultsSliceModel,
    SplashConstraintsDefaultsSliceDto
  >
  _sliceMapper;

  @override
  SplashConstraintsDefaultsDto convertTo(SplashConstraintsDefaultsModel it) {
    return SplashConstraintsDefaultsDto(
      withBackground: _sliceMapper.convertTo(it.withBackground),
      withoutBackground: _sliceMapper.convertTo(it.withoutBackground),
      android12: it.android12 != null
          ? _sliceMapper.convertTo(it.android12!)
          : null,
    );
  }

  @override
  SplashConstraintsDefaultsModel convertFrom(SplashConstraintsDefaultsDto it) {
    return SplashConstraintsDefaultsModel(
      withBackground: _sliceMapper.convertFrom(it.withBackground),
      withoutBackground: _sliceMapper.convertFrom(it.withoutBackground),
      android12: it.android12 != null
          ? _sliceMapper.convertFrom(it.android12!)
          : null,
    );
  }
}
