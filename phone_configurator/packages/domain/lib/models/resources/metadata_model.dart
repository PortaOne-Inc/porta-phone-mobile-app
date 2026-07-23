import 'package:freezed_annotation/freezed_annotation.dart';

part 'metadata_model.freezed.dart';

part 'metadata_model.g.dart';

@freezed
sealed class MetadataModel with _$MetadataModel {
  const factory MetadataModel({@Default({}) Map<String, dynamic> attributes}) =
      _MetadataModel;

  const MetadataModel._();

  factory MetadataModel.fromJson(Map<String, dynamic> json) =>
      _$MetadataModelFromJson(json);
}
