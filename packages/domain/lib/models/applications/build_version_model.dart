import 'package:freezed_annotation/freezed_annotation.dart';

part 'build_version_model.freezed.dart';

part 'build_version_model.g.dart';

@freezed
sealed class BuildVersionModel with _$BuildVersionModel {
  const factory BuildVersionModel({String? buildName, int? buildNumber}) =
      _BuildVersionModel;

  factory BuildVersionModel.fromJson(Map<String, Object?> json) =>
      _$BuildVersionModelFromJson(json);
}

extension BuildVersionModelExtension on BuildVersionModel {
  String get viewString => '${buildName ?? '1.0.0'}+${buildNumber ?? '1'}';
}
