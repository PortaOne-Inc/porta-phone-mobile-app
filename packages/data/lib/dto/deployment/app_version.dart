import 'package:json_annotation/json_annotation.dart';

part 'app_version.g.dart';

@JsonSerializable()
class AppVersion {
  AppVersion(this.appVersion);

  factory AppVersion.fromJson(Map<String, dynamic> json) =>
      _$AppVersionFromJson(json);
  @JsonKey(name: 'app_version')
  final String? appVersion;

  Map<String, dynamic> toJson() => _$AppVersionToJson(this);
}
