import 'package:json_annotation/json_annotation.dart';

part 'callkeep_branch_dto.g.dart';

@JsonSerializable()
class CallkeepBranchDto {
  CallkeepBranchDto(this.name, this.commit, this.protected);

  factory CallkeepBranchDto.fromJson(Map<String, dynamic> json) =>
      _$CallkeepBranchDtoFromJson(json);
  final String name;
  final CallkeepBranchDtoCommit? commit;
  final bool? protected;

  Map<String, dynamic> toJson() => _$CallkeepBranchDtoToJson(this);
}

@JsonSerializable()
class CallkeepBranchDtoCommit {
  CallkeepBranchDtoCommit(this.sha, this.url);

  factory CallkeepBranchDtoCommit.fromJson(Map<String, dynamic> json) =>
      _$CallkeepBranchDtoCommitFromJson(json);
  final String? sha;
  final String? url;

  Map<String, dynamic> toJson() => _$CallkeepBranchDtoCommitToJson(this);
}
