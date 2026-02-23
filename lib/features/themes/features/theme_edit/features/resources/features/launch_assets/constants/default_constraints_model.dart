import 'package:domain/domain.dart';

const defaultConstraintsModel = ConstraintsModel(
  androidAdaptive: PlatformConstraintsModel(
    sizeDp: 432,
    safeZoneDp: 324,
    toleranceDp: 432,
  ),
  androidLegacy: PlatformConstraintsModel(
    sizeDp: 512,
    safeZoneDp: 384,
    toleranceDp: 512,
  ),
  ios: PlatformConstraintsModel(
    sizeDp: 1024,
    safeZoneDp: 832,
    toleranceDp: 1024,
  ),
  web: PlatformConstraintsModel(
    sizeDp: 512,
    safeZoneDp: 460.8,
    toleranceDp: 512,
  ),
);
