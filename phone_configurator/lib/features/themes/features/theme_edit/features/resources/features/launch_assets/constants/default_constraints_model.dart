import 'package:domain/domain.dart';

const defaultConstraintsModel = ConstraintsModel(
  androidAdaptive: PlatformConstraintsModel(
    sizeDp: 432,
    safeZoneDp: 264, // 66dp × 4 (official Android adaptive icon safe zone)
    toleranceDp: 4,
  ),
  androidLegacy: PlatformConstraintsModel(
    sizeDp: 512,
    safeZoneDp: 384,
    toleranceDp: 4,
  ),
  ios: PlatformConstraintsModel(sizeDp: 1024, safeZoneDp: 832, toleranceDp: 4),
  web: PlatformConstraintsModel(sizeDp: 512, safeZoneDp: 460.8, toleranceDp: 4),
);
