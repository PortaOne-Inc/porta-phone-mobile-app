import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_constraints_defaults_model.freezed.dart';

part 'splash_constraints_defaults_model.g.dart';

@freezed
sealed class SplashConstraintsDefaultsSliceModel
    with _$SplashConstraintsDefaultsSliceModel {
  const factory SplashConstraintsDefaultsSliceModel({
    required double fullSizeDp,
    required double maskDiameterDp,
    required double toleranceDp,
  }) = _SplashConstraintsDefaultsSliceModel;

  factory SplashConstraintsDefaultsSliceModel.fromJson(
    Map<String, dynamic> json,
  ) => _$SplashConstraintsDefaultsSliceModelFromJson(json);
}

@freezed
sealed class SplashConstraintsDefaultsModel
    with _$SplashConstraintsDefaultsModel {
  const factory SplashConstraintsDefaultsModel({
    required SplashConstraintsDefaultsSliceModel withBackground,
    required SplashConstraintsDefaultsSliceModel withoutBackground,
    SplashConstraintsDefaultsSliceModel? android12,
  }) = _SplashConstraintsDefaultsModel;

  factory SplashConstraintsDefaultsModel.fromJson(Map<String, dynamic> json) =>
      _$SplashConstraintsDefaultsModelFromJson(json);
}
