import 'package:json_annotation/json_annotation.dart';

part 'phone_branch_dto.g.dart';

@JsonSerializable()
class PhoneBranchDto {
  PhoneBranchDto(this.name, this.commit, this.protected);

  factory PhoneBranchDto.fromJson(Map<String, dynamic> json) =>
      _$PhoneBranchDtoFromJson(json);
  final String name;
  final PhoneBranchDtoCommit? commit;
  final bool? protected;

  Map<String, dynamic> toJson() => _$PhoneBranchDtoToJson(this);
}

@JsonSerializable()
class PhoneBranchDtoCommit {
  PhoneBranchDtoCommit(this.sha, this.url);

  factory PhoneBranchDtoCommit.fromJson(Map<String, dynamic> json) =>
      _$PhoneBranchDtoCommitFromJson(json);
  final String? sha;
  final String? url;

  Map<String, dynamic> toJson() => _$PhoneBranchDtoCommitToJson(this);
}
