import 'package:domain/domain.dart';

const defaultConstraintsModel = SplashConstraintsDefaultsSliceModel(
  fullSizeDp: 512,
  maskDiameterDp: 384,
  toleranceDp: 512,
);

const defaultAndroid12ConstraintsModel = SplashConstraintsDefaultsSliceModel(
  fullSizeDp: 288,
  maskDiameterDp: 135, // inscribed square in 192dp circle: 192 / √2 ≈ 135
  toleranceDp: 288,
);
