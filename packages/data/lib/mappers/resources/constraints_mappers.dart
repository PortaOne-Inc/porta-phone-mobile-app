import 'package:injectable/injectable.dart';
import 'package:data/mappers/mappers.dart';

import 'package:domain/domain.dart' as d;
import 'package:data/dto/assets/constraints_dto.dart';

@injectable
class PlatformConstraintsMapper
    extends CommonMapper<d.PlatformConstraintsModel, PlatformConstraintsDto> {
  @override
  PlatformConstraintsDto convertTo(d.PlatformConstraintsModel it) =>
      PlatformConstraintsDto(
        sizeDp: it.sizeDp,
        safeZoneDp: it.safeZoneDp,
        toleranceDp: it.toleranceDp,
      );

  @override
  d.PlatformConstraintsModel convertFrom(PlatformConstraintsDto it) =>
      d.PlatformConstraintsModel(
        sizeDp: it.sizeDp,
        safeZoneDp: it.safeZoneDp,
        toleranceDp: it.toleranceDp,
      );
}

@injectable
class ConstraintsMapper
    extends CommonMapper<d.ConstraintsModel, ConstraintsDto> {
  ConstraintsMapper(this.slice);

  final PlatformConstraintsMapper slice;

  @override
  ConstraintsDto convertTo(d.ConstraintsModel it) => ConstraintsDto(
    androidLegacy: it.androidLegacy != null
        ? slice.convertTo(it.androidLegacy!)
        : null,
    androidAdaptive: it.androidAdaptive != null
        ? slice.convertTo(it.androidAdaptive!)
        : null,
    ios: it.ios != null ? slice.convertTo(it.ios!) : null,
    web: it.web != null ? slice.convertTo(it.web!) : null,
  );

  @override
  d.ConstraintsModel convertFrom(ConstraintsDto it) => d.ConstraintsModel(
    androidLegacy: it.androidLegacy != null
        ? slice.convertFrom(it.androidLegacy!)
        : null,
    androidAdaptive: it.androidAdaptive != null
        ? slice.convertFrom(it.androidAdaptive!)
        : null,
    ios: it.ios != null ? slice.convertFrom(it.ios!) : null,
    web: it.web != null ? slice.convertFrom(it.web!) : null,
  );
}
