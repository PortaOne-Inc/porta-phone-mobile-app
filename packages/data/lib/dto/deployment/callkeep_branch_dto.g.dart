// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'callkeep_branch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallkeepBranchDto _$CallkeepBranchDtoFromJson(Map<String, dynamic> json) =>
    CallkeepBranchDto(
      json['name'] as String,
      json['commit'] == null
          ? null
          : CallkeepBranchDtoCommit.fromJson(
              json['commit'] as Map<String, dynamic>,
            ),
      json['protected'] as bool?,
    );

Map<String, dynamic> _$CallkeepBranchDtoToJson(CallkeepBranchDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'commit': instance.commit,
      'protected': instance.protected,
    };

CallkeepBranchDtoCommit _$CallkeepBranchDtoCommitFromJson(
  Map<String, dynamic> json,
) => CallkeepBranchDtoCommit(json['sha'] as String?, json['url'] as String?);

Map<String, dynamic> _$CallkeepBranchDtoCommitToJson(
  CallkeepBranchDtoCommit instance,
) => <String, dynamic>{'sha': instance.sha, 'url': instance.url};
